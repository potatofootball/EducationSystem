package test;

import java.util.HashMap;
import java.util.Iterator;

public class Test {

	public static void main(String[] args) {

		do {
			HashMap<Integer, HashMap<Integer, Integer>> map = new HashMap<Integer, HashMap<Integer, Integer>>();
			map.put(1, new HashMap<Integer, Integer>());
			map.put(2, new HashMap<Integer, Integer>());
			map.get(1).put(1, 1);
			map.get(1).put(2, 1);
			map.get(2).put(3, 1);
			Iterator<Integer> i1 = map.keySet().iterator();
			while (i1.hasNext()) {
				int j1 = i1.next();
				Iterator<Integer> i2 = map.get(j1).keySet().iterator();
				while (i2.hasNext()) {
					int j2 = i2.next();
					System.out.println(j1 + " " + j2 + " " + map.get(j1).get(j2));
					continue;
				}
			}
		} while (true);
	}
}
