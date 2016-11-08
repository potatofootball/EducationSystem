package tool;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import model.PickCourse;
import model.Teach;

public class TimeTableFormat {

	public static Map<Integer, Map<Integer, Map<Integer, List<PickCourse>>>> format(List<PickCourse> list) {
		if (list == null || list.isEmpty()) {
			return null;
		}
		Map<Integer, Map<Integer, Map<Integer, List<PickCourse>>>> map = new HashMap<Integer, Map<Integer, Map<Integer, List<PickCourse>>>>();
		for (PickCourse pc : list) {
			for (int[] i : pc.getTeach().getClassTime().getTimeList()) {
				if (!map.containsKey(i[4])) {
					map.put(i[4], new HashMap<Integer, Map<Integer, List<PickCourse>>>());
				}
				if (!map.get(i[4]).containsKey(i[3])) {
					map.get(i[4]).put(i[3], new HashMap<Integer, List<PickCourse>>());
				}
				if (!map.get(i[4]).get(i[3]).containsKey(i[5] - i[4] + 1)) {
					map.get(i[4]).get(i[3]).put(i[5] - i[4] + 1, new ArrayList<PickCourse>());
				}
				map.get(i[4]).get(i[3]).get(i[5] - i[4] + 1).add(pc);
			}
		}
		// 向map中添加课程的信息
		Iterator<Integer> i1 = map.keySet().iterator();
		while (i1.hasNext()) {
			int j1 = i1.next();
			Iterator<Integer> i2 = map.get(j1).keySet().iterator();
			while (i2.hasNext()) {
				int j2 = i2.next();
				Iterator<Integer> i3 = map.get(j1).get(j2).keySet().iterator();
				int max = 0;
				while (i3.hasNext()) {
					int j3 = i3.next();
					if (j3 > max) {
						max = j3;
					}
				}
				Iterator<Integer> i4 = map.get(j1).get(j2).keySet().iterator();
				while (i4.hasNext()) {
					int j4 = i4.next();
					if (j4 == max) {
						continue;
					} else {
						map.get(j1).get(j2).get(max).addAll(map.get(j1).get(j2).get(j4));
						map.get(j1).get(j2).remove(j4);
					}
				}
			}
		}
		// 合并map中起始时间相同的课程
		boolean isContinue;
		do {
			isContinue = false;
			Iterator<Integer> i11 = map.keySet().iterator();
			while (i11.hasNext()) {
				if (isContinue) {
					break;
				}
				int j11 = i11.next();
				Iterator<Integer> i12 = map.get(j11).keySet().iterator();
				while (i12.hasNext()) {
					if (isContinue) {
						break;
					}
					int j12 = i12.next();
					Iterator<Integer> i13 = map.get(j11).get(j12).keySet().iterator();
					while (i13.hasNext()) {
						if (isContinue) {
							break;
						}
						int j13 = i13.next();
						for (int i = 1; i < j13; i++) {
							if (map.containsKey(j11 + i)) {
								if (map.get(j11 + i).containsKey(j12)) {
									map.get(j11).get(j12).get(j13).addAll(map.get(j11 + i).get(j12)
											.get(map.get(j11 + i).get(j12).keySet().iterator().next()));
									map.get(j11 + i).remove(j12);
									isContinue = true;
								}
							}
						}
					}
				}
			}
		} while (isContinue);
		// 合并map中时间重叠的课程
		for (

		int i = 1; i < 14; i++) {
			for (int j = 1; j < 8; j++) {
				if (map.containsKey(i)) {
					if (map.get(i).containsKey(j)) {
						continue;
					} else {
						map.get(i).put(j, new HashMap<Integer, List<PickCourse>>());
					}
				} else {
					map.put(i, new HashMap<Integer, Map<Integer, List<PickCourse>>>());
					map.get(i).put(j, new HashMap<Integer, List<PickCourse>>());
				}
				map.get(i).get(j).put(1, null);
			}
		}
		// 向map中空白课表内置空值
		do {
			isContinue = false;
			Iterator<Integer> i11 = map.keySet().iterator();
			while (i11.hasNext()) {
				if (isContinue) {
					break;
				}
				int j11 = i11.next();
				Iterator<Integer> i12 = map.get(j11).keySet().iterator();
				while (i12.hasNext()) {
					if (isContinue) {
						break;
					}
					int j12 = i12.next();
					Iterator<Integer> i13 = map.get(j11).get(j12).keySet().iterator();
					while (i13.hasNext()) {
						if (isContinue) {
							break;
						}
						int j13 = i13.next();
						for (int i = 1; i < j13; i++) {
							if (map.containsKey(j11 + i)) {
								if (map.get(j11 + i).containsKey(j12)) {
									map.get(j11 + i).remove(j12);
									isContinue = true;
								}
							}
						}
					}
				}
			}

		} while (isContinue);
		// 删除map中时间重叠下的空白课程

		// Iterator<Integer> i11 = map.keySet().iterator();
		// while (i11.hasNext()) {
		// int j11 = i11.next();
		// Iterator<Integer> i12 = map.get(j11).keySet().iterator();
		// while (i12.hasNext()) {
		// int j12 = i12.next();
		// Iterator<Integer> i13 = map.get(j11).get(j12).keySet().iterator();
		// while (i13.hasNext()) {
		// int j13 = i13.next();
		// if (map.get(j11).get(j12).get(j13) != null) {
		// for (PickCourse pc : map.get(j11).get(j12).get(j13)) {
		// System.out.println(j11 + " " + j12 + " " + j13 + " " +
		// pc.getTeach().getNumber());
		// }
		// } else {
		// System.out.println(j11 + " " + j12 + " " + j13 + " null");
		// }
		// }
		// }
		// }
		// 输出返回的map内容

		// for (int i = 1; i < 14; i++) {
		// for (int j = 1; j < 8; j++) {
		// if (map.get(i).get(j) == null) {
		// System.out.print("楼上 ");
		// } else if
		// (map.get(i).get(j).get(map.get(i).get(j).keySet().iterator().next())
		// == null) {
		// System.out.print("null ");
		// } else {
		// System.out.print(map.get(i).get(j).get(map.get(i).get(j).keySet().iterator().next()).get(0)
		// .getTeach().getNumber() + " ");
		// }
		// }
		// System.out.println();
		// }
		// 以表格输出map内容
		return map;
	}

	public static int getLongestCourse(Map<Integer, List<PickCourse>> map) {
		Iterator<Integer> set = map.keySet().iterator();
		int max = 0;
		while (set.hasNext()) {
			int next = set.next();
			if (next > max) {
				max = next;
			}
		}
		return max;
	}
	
	public static Map<Integer, Map<Integer, Map<Integer, List<Teach>>>> formatTeach(List<Teach> list) {
		if (list == null || list.isEmpty()) {
			return null;
		}
		Map<Integer, Map<Integer, Map<Integer, List<Teach>>>> map = new HashMap<Integer, Map<Integer, Map<Integer, List<Teach>>>>();
		for (Teach pc : list) {
			for (int[] i : pc.getClassTime().getTimeList()) {
				if (!map.containsKey(i[4])) {
					map.put(i[4], new HashMap<Integer, Map<Integer, List<Teach>>>());
				}
				if (!map.get(i[4]).containsKey(i[3])) {
					map.get(i[4]).put(i[3], new HashMap<Integer, List<Teach>>());
				}
				if (!map.get(i[4]).get(i[3]).containsKey(i[5] - i[4] + 1)) {
					map.get(i[4]).get(i[3]).put(i[5] - i[4] + 1, new ArrayList<Teach>());
				}
				map.get(i[4]).get(i[3]).get(i[5] - i[4] + 1).add(pc);
			}
		}
		// 向map中添加课程的信息
		Iterator<Integer> i1 = map.keySet().iterator();
		while (i1.hasNext()) {
			int j1 = i1.next();
			Iterator<Integer> i2 = map.get(j1).keySet().iterator();
			while (i2.hasNext()) {
				int j2 = i2.next();
				Iterator<Integer> i3 = map.get(j1).get(j2).keySet().iterator();
				int max = 0;
				while (i3.hasNext()) {
					int j3 = i3.next();
					if (j3 > max) {
						max = j3;
					}
				}
				Iterator<Integer> i4 = map.get(j1).get(j2).keySet().iterator();
				while (i4.hasNext()) {
					int j4 = i4.next();
					if (j4 == max) {
						continue;
					} else {
						map.get(j1).get(j2).get(max).addAll(map.get(j1).get(j2).get(j4));
						map.get(j1).get(j2).remove(j4);
					}
				}
			}
		}
		// 合并map中起始时间相同的课程
		boolean isContinue;
		do {
			isContinue = false;
			Iterator<Integer> i11 = map.keySet().iterator();
			while (i11.hasNext()) {
				if (isContinue) {
					break;
				}
				int j11 = i11.next();
				Iterator<Integer> i12 = map.get(j11).keySet().iterator();
				while (i12.hasNext()) {
					if (isContinue) {
						break;
					}
					int j12 = i12.next();
					Iterator<Integer> i13 = map.get(j11).get(j12).keySet().iterator();
					while (i13.hasNext()) {
						if (isContinue) {
							break;
						}
						int j13 = i13.next();
						for (int i = 1; i < j13; i++) {
							if (map.containsKey(j11 + i)) {
								if (map.get(j11 + i).containsKey(j12)) {
									map.get(j11).get(j12).get(j13).addAll(map.get(j11 + i).get(j12)
											.get(map.get(j11 + i).get(j12).keySet().iterator().next()));
									map.get(j11 + i).remove(j12);
									isContinue = true;
								}
							}
						}
					}
				}
			}
		} while (isContinue);
		// 合并map中时间重叠的课程
		for (

		int i = 1; i < 14; i++) {
			for (int j = 1; j < 8; j++) {
				if (map.containsKey(i)) {
					if (map.get(i).containsKey(j)) {
						continue;
					} else {
						map.get(i).put(j, new HashMap<Integer, List<Teach>>());
					}
				} else {
					map.put(i, new HashMap<Integer, Map<Integer, List<Teach>>>());
					map.get(i).put(j, new HashMap<Integer, List<Teach>>());
				}
				map.get(i).get(j).put(1, null);
			}
		}
		// 向map中空白课表内置空值
		do {
			isContinue = false;
			Iterator<Integer> i11 = map.keySet().iterator();
			while (i11.hasNext()) {
				if (isContinue) {
					break;
				}
				int j11 = i11.next();
				Iterator<Integer> i12 = map.get(j11).keySet().iterator();
				while (i12.hasNext()) {
					if (isContinue) {
						break;
					}
					int j12 = i12.next();
					Iterator<Integer> i13 = map.get(j11).get(j12).keySet().iterator();
					while (i13.hasNext()) {
						if (isContinue) {
							break;
						}
						int j13 = i13.next();
						for (int i = 1; i < j13; i++) {
							if (map.containsKey(j11 + i)) {
								if (map.get(j11 + i).containsKey(j12)) {
									map.get(j11 + i).remove(j12);
									isContinue = true;
								}
							}
						}
					}
				}
			}

		} while (isContinue);
		return map;
	}

}
