package model;

import java.util.List;
import java.util.ArrayList;

public class Student {

	private int number;
	private String name;
	private Class student;
	private String gender;
	private Long birthday;
	private boolean pickCoursePower;

	private static List<Student> studentList = new ArrayList<Student>();

	public Student(int number, String name, Class student, String gender, Long birthday, boolean pickCoursePower) {
		this.number = number;
		this.name = name;
		this.student = student;
		this.gender = gender;
		this.birthday = birthday;
		this.pickCoursePower = pickCoursePower;
		studentList.add(this);
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

	public Class getstudent() {
		return student;
	}

	public void setstudent(Class student) {
		this.student = student;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Long getBirthday() {
		return birthday;
	}

	public void setBirthday(Long birthday) {
		this.birthday = birthday;
	}

	public boolean isPickCoursePower() {
		return pickCoursePower;
	}

	public void setPickCoursePower(boolean pickCoursePower) {
		this.pickCoursePower = pickCoursePower;
	}

	public static List<Student> getStudentList() {
		return studentList;
	}

	// 删除学生
	public static void removeStudent(Student student) {
		if (student != null) {
			if (studentList.contains(student)) {
				studentList.remove(student);
			}
		}
		student = null;
	}

	// 通过编号搜索学生
	public static Student searchStudent(int number) {
		for (Student student : studentList) {
			if (student.getNumber() == number)
				return student;
		}
		return null;
	}

	// 通过名称搜索学生
	public static Student searchStudent(String name) {
		for (Student student : studentList) {
			if (student.getName().equals(name))
				return student;
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
		Student other = (Student) obj;
		if (number != other.number)
			return false;
		return true;
	}
}
