package com.hejin.util;

import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class JunitFourTest {
    @Test
    public void testAdd(){
        assertEquals(6, new JunitFour().add(3, 3));
    }

    @Test
    public void testSubtract() {
        assertEquals(3, new JunitFour().subtract(5,2));
    }

    @Test
    public void testMultiply() {
        assertEquals(4, new JunitFour().multiply(2, 2));
    }

    @Test
    public void testDivide() {
        assertEquals(3, new JunitFour().divide(6, 2));
    }
}
