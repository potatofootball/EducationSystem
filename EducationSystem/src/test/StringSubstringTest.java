package test;

import java.util.ArrayList;
import java.util.List;

public class StringSubstringTest {

	public static void main(String[] args) {
		String time = "2013,2014,1,10,11,0,1,10,11";
		System.out.println(time);
		System.out.println(Integer.parseInt(time.substring(0, time.indexOf(","))));
		time = time.substring(time.indexOf(",") + 1);
		System.out.println(time);
		System.out.println(Integer.parseInt(time.substring(0, time.indexOf(","))));
		time = time.substring(time.indexOf(",") + 1);
		System.out.println(time);
		System.out.println(Integer.parseInt(time.substring(0, time.indexOf(","))));
		time = time.substring(time.indexOf(",") + 1);
		System.out.println(time);
		System.out.println("-------------------------------");
		List<int[]> list = new ArrayList<int[]>();
		int[] i1 = {1,2};
		list.add(i1);
		int[] i2 = {1,2,3};
		list.add(i2);
		for (int[] i :list ) {
			for (int j : i) {
				System.out.print(j +" ");
			}
			System.out.println();
		}
	}

}
