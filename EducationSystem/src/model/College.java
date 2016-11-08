package model;

import java.util.ArrayList;
import java.util.List;

public class College {

	private int number;
	private String name;
	private List<Profession> professionList = new ArrayList<Profession>();

	private static List<College> collegeList = new ArrayList<College>();

	public College(int number, String name) {
		this.number = number;
		this.name = name;
		collegeList.add(this);
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

	public List<Profession> getProfessionList() {
		return professionList;
	}
	
	public void addProfession(Profession profession) {
		professionList.add(profession);
	}

	public static List<College> getCollegeList() {
		return collegeList;
	}
	
	//删除学院
	public static void removeCollege(College college) {
		if (college != null) {
			if (collegeList.contains(college)) {
				collegeList.remove(college);
			}
		}
		college = null;
	}

	//通过编号搜索学院
	public static College searchCollege(int number) {
		for (College college : collegeList) {
			if (college.getNumber() == number)
				return college;
		}
		return null;
	}

	//通过名称搜索学院
	public static College searchCollege(String name) {
		for (College college : collegeList) {
			if (college.getName().equals(name))
				return college;
		}
		return null;
	}

}
