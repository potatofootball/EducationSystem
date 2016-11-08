package model;

import java.util.ArrayList;
import java.util.List;

public class Classroom {

	private int number;
	private String name;
	private Building building;
	private int capacity;

	private static List<Classroom> classroomList = new ArrayList<Classroom>();

	public Classroom(int number, String name, int building, int capacity) {
		this.number = number;
		this.name = name;
		this.building = Building.searchClassArea(building);
		this.capacity = capacity;
		classroomList.add(this);
		this.building.getClassroomList().add(this);
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public Building getBuilding() {
		return building;
	}

	public void setBuilding(Building building) {
		this.building = building;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public static List<Classroom> getClassroomList() {
		return classroomList;
	}

	public String getFullName() {
		return building.getClassArea().getName() + building.getName() + name;
	}

	// 删除教室
	public static void removeClassroom(Classroom classroom) {
		if (classroom != null) {
			if (classroomList.contains(classroom)) {
				classroomList.remove(classroom);
			}
		}
		classroom = null;
	}

	// 通过编号搜索教室
	public static Classroom searchClassroom(int number) {
		for (Classroom classroom : classroomList) {
			if (classroom.getNumber() == number)
				return classroom;
		}
		return null;
	}

	// 通过名称搜索教室
	public static Classroom searchClassroom(String name) {
		for (Classroom classroom : classroomList) {
			if (classroom.getName().equals(name))
				return classroom;
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
		Classroom other = (Classroom) obj;
		if (number != other.number)
			return false;
		return true;
	}
}
