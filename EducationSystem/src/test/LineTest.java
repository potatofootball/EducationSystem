package test;

import java.util.ArrayList;
import java.util.List;

public class LineTest {

	public static void main(String[] args) {
		List<String> list = new ArrayList<String>();
		list.add("1");
		list.add("2");
		list.add("3");
		list.remove(0);
		System.out.println(list.get(1));
	}

}
