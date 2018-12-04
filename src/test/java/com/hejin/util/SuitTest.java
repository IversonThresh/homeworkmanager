package com.hejin.util;

import com.hejin.dao.IUserDaoTest;
import org.junit.runner.RunWith;
import org.junit.runners.Suite;

@RunWith(Suite.class)
@Suite.SuiteClasses({IUserServiceTest.class, IUserDaoTest.class})
public class SuitTest {
    /*
     * 测试套件就是组织测试类一起运行的
     * 写一个作为测试套件的入口类，这个类里不需要包含其他的方法
     * 1.更改测试运行器Suite.class
     * 2.将要测试的类作为数组传入到Suite.SuiteClasses（{}）
     */
}
