package test;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeTest {

	public static void main(String[] args) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
		Long time = new Date().getTime();
		System.out.println(sdf.format(new Date(time + 1000 * 60)));
	}

}
