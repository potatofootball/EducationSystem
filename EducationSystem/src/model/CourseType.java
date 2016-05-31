package model;

import java.util.ArrayList;
import java.util.List;

public class CourseType {

	private int number;
	private String name;

	private static List<CourseType> courseTypeList = new ArrayList<CourseType>();

	public CourseType(int number, String name) {
		this.number = number;
		this.name = name;
		courseTypeList.add(this);
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

	public List<CourseType> getCourseTypeList() {
		return courseTypeList;
	}

	// 删除课程类型
	public static void removeCourseType(CourseType courseType) {
		if (courseType != null) {
			if (courseTypeList.contains(courseType)) {
				courseTypeList.remove(courseType);
			}
		}
		courseType = null;
	}

	// 通过编号搜索课程类型
	public static CourseType searchCourseType(int number) {
		for (CourseType courseType : courseTypeList) {
			if (courseType.getNumber() == number)
				return courseType;
		}
		return null;
	}

	// 通过名称搜索课程类型
	public static CourseType searchCourseType(String name) {
		for (CourseType courseType : courseTypeList) {
			if (courseType.getName().equals(name))
				return courseType;
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
		CourseType other = (CourseType) obj;
		if (number != other.number)
			return false;
		return true;
	}
}
