package controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class CommonController {
	public static String getNow() {
		Calendar calendar = Calendar.getInstance();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return simpleDateFormat.format(calendar.getTime());
	}
	public static String getNow(String format) {
		Calendar calendar = Calendar.getInstance();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(format);
		return simpleDateFormat.format(calendar.getTime());
	}
}
