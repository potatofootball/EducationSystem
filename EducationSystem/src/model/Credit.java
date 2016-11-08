package model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Credit {

	private int number;
	private Profession profession;
	private CourseType courseType;
	private int credit;

	private static Map<Profession, List<CourseType>> creditMap = new HashMap<Profession, List<CourseType>>();

	private static List<Credit> creditList = new ArrayList<Credit>();

	public Credit(int number, int profession, int courseType, int credit) {
		this.number = number;
		this.profession = Profession.searchProfession(profession);
		this.courseType = CourseType.searchCourseType(courseType);
		this.credit = credit;
		if (!creditMap.containsKey(this.profession)) {
			creditMap.put(this.profession, new ArrayList<CourseType>());

		}
		creditMap.get(this.profession).add(this.courseType);
		creditList.add(this);
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public Profession getProfession() {
		return profession;
	}

	public void setProfession(Profession profession) {
		this.profession = profession;
	}

	public CourseType getCourseType() {
		return courseType;
	}

	public void setCourseType(CourseType courseType) {
		this.courseType = courseType;
	}

	public int getCredit() {
		return credit;
	}

	public void setCredit(int credit) {
		this.credit = credit;
	}

	public static Map<Profession, List<CourseType>> getCreditMap() {
		return creditMap;
	}

	public static List<Credit> getCreditList() {
		return creditList;
	}

	// 删除实际学分要求
	public static void removeCredit(Credit credit) {
		if (credit != null) {
			if (creditList.contains(credit)) {
				creditList.remove(credit);
			}
		}
		credit = null;
	}

	// 通过编号搜索实际学分要求
	public static Credit searchCredit(int number) {
		for (Credit credit : creditList) {
			if (credit.getNumber() == number)
				return credit;
		}
		return null;
	}

	// 通过专业、课程类型搜索实际学分要求
	public static Credit searchCredit(Profession profession, CourseType courseType) {
		for (Credit credit : creditList) {
			if (credit.getProfession().equals(profession) && credit.getCourseType().equals(courseType))
				return credit;
		}
		return null;
	}
}
