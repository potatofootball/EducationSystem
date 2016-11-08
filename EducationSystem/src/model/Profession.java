package model;

import java.util.ArrayList;
import java.util.List;

public class Profession {

	private int number;
	private String name;
	private College college;

	private static List<Profession> professionList = new ArrayList<Profession>();

	public Profession(int number, String name, int college) {
		this.number = number;
		this.name = name;
		this.college = College.searchCollege(college);
		professionList.add(this);
		this.college.addProfession(this);
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

	public College getCollege() {
		return college;
	}

	public void setCollege(int college) {
		this.college = College.searchCollege(college);
	}

	public static List<Profession> getProfessionList() {
		return professionList;
	}

	// 删除专业
	public static void removeprofession(Profession profession) {
		if (profession != null) {
			if (professionList.contains(profession)) {
				professionList.remove(profession);
			}
		}
		profession = null;
	}

	// 通过编号查找专业
	public static Profession searchProfession(int number) {
		for (Profession profession : professionList) {
			if (profession.getNumber() == number)
				return profession;
		}
		return null;
	}

	// 通过名称查找专业
	public static Profession searchProfession(String name) {
		for (Profession profession : professionList) {
			if (profession.getName().equals(name))
				return profession;
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
		Profession other = (Profession) obj;
		if (number != other.number)
			return false;
		return true;
	}

}
