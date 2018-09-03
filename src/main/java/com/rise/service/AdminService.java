package com.rise.service;

import com.rise.entity.base.BaseUser;
import com.rise.entity.common.RiseAdmin;
import com.rise.entity.common.RiseStudent;
import com.rise.entity.common.RiseTeacher;

/**
 * @Author xiaolong
 * @Date 2018/6/5 16:52
 */
public interface AdminService {

    /**
     * @Author xiaolong
     * @Date 2018/6/9 19:26
     * 通过RiseUser某个属性获取用户信息
     */
    public RiseAdmin getRiseAdmin(String userName) throws Exception;

    public RiseTeacher getRiseTeacher(String userName) throws Exception;

    public RiseStudent getRiseStudent(String userName) throws Exception;

    public void updateAdminPassword(RiseAdmin riseAdmin) throws Exception;

    public void  updateTeacherPassword(RiseTeacher riseTeacher) throws Exception;

    public void updateStudentPassword(RiseStudent riseStudent) throws Exception;
}
