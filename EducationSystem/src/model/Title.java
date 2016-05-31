package model;

import java.util.ArrayList;
import java.util.List;

public class Title {

	private int number;
	private String name;

	private static List<Title> titleList = new ArrayList<Title>();

	public Title(int number, String name) {
		this.number = number;
		this.name = name;
		titleList.add(this);
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

	public List<Title> getTitleList() {
		return titleList;
	}

	// 删除职称
	public static void removeTitle(Title title) {
		if (title != null) {
			if (titleList.contains(title)) {
				titleList.remove(title);
			}
		}
		title = null;
	}

	// 通过编号搜索职称
	public static Title searchTitle(int number) {
		for (Title title : titleList) {
			if (title.getNumber() == number)
				return title;
		}
		return null;
	}

	// 通过名称搜索职称
	public static Title searchTitle(String name) {
		for (Title title : titleList) {
			if (title.getName().equals(name))
				return title;
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
		Title other = (Title) obj;
		if (number != other.number)
			return false;
		return true;
	}

}
