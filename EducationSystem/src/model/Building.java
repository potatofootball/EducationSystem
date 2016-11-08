package model;

import java.util.ArrayList;
import java.util.List;

public class Building {

	private int number;
	private String name;
	private ClassArea classArea;
	private List<Classroom> classroomList = new ArrayList<Classroom>();
	
	private static List<Building> buildingList = new ArrayList<Building>();
	
	public Building(int number, String name, int classArea) {
		this.number = number;
		this.name = name;
		this.classArea = ClassArea.searchClassArea(classArea);
		buildingList.add(this);
		this.classArea.getBuildingList().add(this);
	}
	
	public Building(int number, String name, ClassArea classArea) {
		this.number = number;
		this.name = name;
		this.classArea = classArea;
		buildingList.add(this);
		this.classArea.getBuildingList().add(this);
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

	public ClassArea getClassArea() {
		return classArea;
	}

	public void setClassArea(ClassArea classArea) {
		this.classArea = classArea;
	}

	public List<Classroom> getClassroomList() {
		return classroomList;
	}

	public static List<Building> getBuildingList() {
		return buildingList;
	}

	// 删除教学楼
	public static void removeBuilding(Building building) {
		if (building != null) {
			if (buildingList.contains(building)) {
				buildingList.remove(building);
			}
		}
		building = null;
	}

	// 通过编号搜索教学楼
	public static Building searchClassArea(int number) {
		for (Building building : buildingList) {
			if (building.getNumber() == number)
				return building;
		}
		return null;
	}

	// 通过名称搜索教学楼
	public static Building searchClassArea(String name) {
		for (Building building : buildingList) {
			if (building.getName().equals(name))
				return building;
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
		Building other = (Building) obj;
		if (number != other.number)
			return false;
		return true;
	}
}
