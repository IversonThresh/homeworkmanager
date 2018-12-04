package com.hejin.util;

import org.junit.Test;

import static org.junit.Assert.*;

public class AnnotationsTest {
    @Test
    public void test() {
        String obj1 = "junit";
        String obj2 = "junit";
        String obj3 = "test";
        String obj4 = "test";
        String obj5 = null;
        int var1 = 1;
        int var2 = 2;
        int[] arithmetic1 = { 1, 2, 3 };
        int[] arithmetic2 = { 1, 2, 3 };
        int[ ][ ]  arr = {{5,7,9},{12,14,16,18},{23,25,36,47},{22,54,65,15},{22,34}};

        int i = arr[1][3];
        int length = arr.length;
        System.out.println(i+"---"+length);

        assertEquals(obj1, obj2);

        assertSame(obj3, obj4);

        assertNotSame(obj2, obj4);

        assertNotNull(obj1);

        assertNull(obj5);

        assertArrayEquals(arithmetic1, arithmetic2);
    }
}
