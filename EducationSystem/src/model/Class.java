package model;

import java.util.ArrayList;
import java.util.List;

public class Class {

	private int number;
	private String name;
	private Profession profession;
	private int year;

	private static List<Class> classList = new ArrayList<Class>();
	private List<Student> studentList = new ArrayList<Student>();

	public Class(int number, String name, int profession, int year) {
		this.number = number;
		this.name = name;
		this.profession = Profession.searchProfession(profession);
		this.year = year;
		classList.add(this);
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

	public Profession getProfession() {
		return profession;
	}

	public void setProfession(Profession profession) {
		this.profession = profession;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public static List<Class> getClassList() {
		return classList;
	}

	public List<Student> getStudentList() {
		return studentList;
	}

	// 删除班级
	public static void removeClass(Class aClass) {
		if (aClass != null) {
			if (classList.contains(aClass)) {
				classList.remove(aClass);
			}
		}
		aClass = null;
	}

	// 通过编号搜索班级
	public static Class searchClass(int number) {
		for (Class aClass : classList) {
			if (aClass.getNumber() == number)
				return aClass;
		}
		return null;
	}

	// 通过名称搜索班级
	public static Class searchClass(String name) {
		for (Class aClass : classList) {
			if (aClass.getName().equals(name))
				return aClass;
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
		Class other = (Class) obj;
		if (number != other.number)
			return false;
		return true;
	}

}
