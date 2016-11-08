package test;

import java.util.ArrayList;

public class ArrayTest {

	public static void main(String[] args) {
		ArrayList<String> list1 = new ArrayList<String>();
		ArrayList<String> list2 = new ArrayList<String>();
		list1.add("1");
		list1.add("2");
		list1.add("3");
		list1.add("4");
		list2.add("1");
		list2.add("2");
		list2.add("3");
		list2.add("5");
		list1.removeAll(list2);
		for (String s : list1) {
			System.out.println(s.toString());
		}
	}

}
