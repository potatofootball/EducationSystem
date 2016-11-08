package model;

import java.util.ArrayList;
import java.util.List;

public class ClassTime {

	private int number;
	private String name;
	private List<int[]> timeList = new ArrayList<int[]>();
	//timeList保存为时间队列，每个数组存6个数据
	//分别为起始周、结束周、单双周（0全周、1单周、2双周）、周几、起始节、结束节

	private static List<ClassTime> classTimeList = new ArrayList<ClassTime>();

	public ClassTime(int number, String name, String time) {
		this.number = number;
		this.name = name;
		String[] stringChar = time.split(",");
		int[] intChar = new int[6];
		for (int i = 0; i < stringChar.length; i++) {
			intChar[i % 6] = Integer.parseInt(stringChar[i]);
			if ((i + 1) / 6 > 0) {
				timeList.add(intChar);
			}
		}
		classTimeList.add(this);
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<int[]> getTimeList() {
		return timeList;
	}

	public void setTimeList(List<int[]> timeList) {
		this.timeList = timeList;
	}

	public String getTime() {
		StringBuilder sb = new StringBuilder();
		for (int[] i : timeList) {
			for (int j = 0; j < i.length; j++) {
				sb.append(i[j]);
				sb.append(",");
			}
		}
		return sb.substring(0, sb.length() - 1).toString();
	}

	public static List<ClassTime> getClassTimeTimeList() {
		return classTimeList;
	}

	// 删除课程时间
	public static void removeClassTime(ClassTime classTime) {
		if (classTime != null) {
			if (classTimeList.contains(classTime)) {
				classTimeList.remove(classTime);
			}
		}
		classTime = null;
	}

	// 通过编号搜索课程时间
	public static ClassTime searchClassTime(int number) {
		for (ClassTime classTime : classTimeList) {
			if (classTime.getNumber() == number)
				return classTime;
		}
		return null;
	}

	// 通过名称搜索课程时间
	public static ClassTime searchClassTime(String name) {
		for (ClassTime classTime : classTimeList) {
			if (classTime.getName().equals(name))
				return classTime;
		}
		return null;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + number;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ClassTime other = (ClassTime) obj;
		if (number != other.number)
			return false;
		return true;
	}
}
