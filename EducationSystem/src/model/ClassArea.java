package model;

import java.util.ArrayList;
import java.util.List;

public class ClassArea {

	private int number;
	private String name;
	private List<Building> buildingList = new ArrayList<Building>();

	private static List<ClassArea> classAreaList = new ArrayList<ClassArea>();

	public ClassArea(int number, String name) {
		this.number = number;
		this.name = name;
		classAreaList.add(this);
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

	public List<Building> getBuildingList() {
		return buildingList;
	}
	
	public static List<ClassArea> getClassAreaList() {
		return classAreaList;
	}

	// 删除教学区
	public static void removeClassArea(ClassArea classArea) {
		if (classArea != null) {
			if (classAreaList.contains(classArea)) {
				classAreaList.remove(classArea);
			}
		}
		classArea = null;
	}

	// 通过编号搜索教学区
	public static ClassArea searchClassArea(int number) {
		for (ClassArea classArea : classAreaList) {
			if (classArea.getNumber() == number)
				return classArea;
		}
		return null;
	}

	// 通过名称搜索教学区
	public static ClassArea searchClassArea(String name) {
		for (ClassArea classArea : classAreaList) {
			if (classArea.getName().equals(name))
				return classArea;
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
		ClassArea other = (ClassArea) obj;
		if (number != other.number)
			return false;
		return true;
	}

}
