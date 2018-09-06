package com.rise.aop;

import com.rise.annotation.SystemLog;
import com.rise.entity.common.Log;
import com.rise.entity.common.RiseAdmin;
import com.rise.service.LogService;
import com.rise.util.WebUtil;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.junit.platform.commons.logging.Logger;
import org.junit.platform.commons.logging.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.lang.reflect.Method;
import java.util.Date;

/**
 * @Author xiaolong
 * @Date 2018/6/14 17:26
 * @Description
 */
@Aspect
@Component
public class LogAopAction {
    @Resource(name = "logServiceImpl")
    private LogService logServiceImpl;

    //本地异常日志记录对象
    private static final Logger logger = LoggerFactory.getLogger(LogAopAction.class);

    //配置接入点
    //@Pointcut("execution(public * com.rise.controller..*.*(..))")
    @Pointcut("@annotation(com.rise.annotation.SystemLog)")
    private void controllerAspect() {
    } //定义一个切入点

    @Around("controllerAspect()")
    public Object around(ProceedingJoinPoint pjp) throws Throwable {
        long start = System.currentTimeMillis();
        Log log = new Log();
        System.out.println("+++++++++++++SystemLog++++++++++++++++");
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        //方法通知前获取时间,用来计算模块执行时间的

        // 拦截的实体类，就是当前正在执行的controller
        Object target = pjp.getTarget();
        // 拦截的方法名称，当前正在执行的方法
        String methodName = pjp.getSignature().getName();

        // 拦截的放参数类型
        Signature sig = pjp.getSignature();
        MethodSignature msig = null;
        if (!(sig instanceof MethodSignature)) {
            throw new IllegalArgumentException("该注解只能用于方法");
        }

        msig = (MethodSignature) sig;
        Class[] parameterTypes = msig.getMethod().getParameterTypes();

        Object object = null;

        // 获得被拦截的方法
        Method method = null;
        try {
            method = target.getClass().getMethod(methodName, parameterTypes);
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        } catch (SecurityException e) {
            e.printStackTrace();
        }

        if (method != null) {
            // 判断是否包含自定义的注解，SystemLog是自己自定义的注解
            if (method.isAnnotationPresent(SystemLog.class)) {
                SystemLog systemlog = method.getAnnotation(SystemLog.class);
                log.setDescription(systemlog.method());
                try {
                    object = pjp.proceed();
                    //获取登录用户账户
                    System.out.println("+++++++++++request+++++++++" + request);
                    HttpSession session = request.getSession();
                    RiseAdmin user = (RiseAdmin) session.getAttribute("user");

                    System.out.println("+++++++++++++++user+++++++++++log:" + user);
                    log.setUserName(user.getUserName());
                    log.setAccount(user.getAccount());
                    log.setOperationTime(new Date());
                    //获取系统ip
                    String ip = WebUtil.getIpAddress(request);
                    log.setIp(ip);
                    long end = System.currentTimeMillis();
                    //将计算好的时间保存在实体中
                    log.setResponseTime((end - start) + "ms");
                    //保存进数据库
                    log.setStatus(1);
                    logServiceImpl.saveLog(log);
                } catch (Throwable e) {
                    long end = System.currentTimeMillis();
                    log.setResponseTime((end - start) + "ms");
                    log.setStatus(0);
                    log.setOperationTime(new Date());
                    logServiceImpl.saveLog(log);
                }
            } else {//没有包含注解
                object = pjp.proceed();
            }
        } else {//不需要拦截直接执行
            object = pjp.proceed();
        }
        return object;
    }
}
