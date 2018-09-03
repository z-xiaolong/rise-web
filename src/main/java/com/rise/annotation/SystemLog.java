package com.rise.annotation;

import java.lang.annotation.*;

/**
 * @Author xiaolong
 * @Date 2018/6/14 17:24
 * @Description
 */

@Target({ElementType.PARAMETER, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface SystemLog {
    String method() default "";
}
