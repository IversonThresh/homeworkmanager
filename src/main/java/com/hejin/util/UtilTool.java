package com.hejin.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class UtilTool {
    public String intIdProduct(){
        Date date = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
        String id = format.format(date);
        String substring = id.substring(2, 14);
        return substring;
    }
}
