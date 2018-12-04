package com.hejin.util;

import com.hejin.model.User;
import com.hejin.service.impl.UserServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-mybatis.xml"})
public class IUserServiceTest {
    @Autowired
    private UserServiceImpl userService;

    @Test
    public void selectUserByIdTest(){
        User user = userService.selectUser(1);
        System.out.println(user.getUsername());
        System.out.println(user.getEmail());
    }
}
