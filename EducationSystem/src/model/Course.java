package model;

import java.util.ArrayList;
import java.util.List;

public class Course {

	private int number;
	private String name;
	private CourseType courseType;

	private static List<Course> courseList = new ArrayList<Course>();

	public Course(int number, String name, int courseType) {
		this.number = number;
		this.name = name;
		this.courseType = CourseType.searchCourseType(courseType);
		courseList.add(this);
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

	public CourseType getCourseType() {
		return courseType;
	}

	public void setCourseType(CourseType courseType) {
		this.courseType = courseType;
	}

	public static List<Course> getCourseList() {
		return courseList;
	}

	// 删除课程
	public static void removeCourse(Course course) {
		if (course != null) {
			if (courseList.contains(course)) {
				courseList.remove(course);
			}
		}
		course = null;
	}

	// 通过编号搜索课程
	public static Course searchCourse(int number) {
		for (Course course : courseList) {
			if (course.getNumber() == number)
				return course;
		}
		return null;
	}

	// 通过名称搜索课程
	public static Course searchCourse(String name) {
		for (Course course : courseList) {
			if (course.getName().equals(name))
				return course;
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
		Course other = (Course) obj;
		if (number != other.number)
			return false;
		return true;
	}

}
