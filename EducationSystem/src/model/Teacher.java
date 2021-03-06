package model;

import java.util.ArrayList;
import java.util.List;

public class Teacher {

	private int number;
	private String name;
	private String password;
	private String gender;
	private Long birthday;
	private Profession profession;
	private College college;
	private Title title;
	private boolean isJiaoWu;
	private List<Teach> teachList = new ArrayList<Teach>();

	private static List<Teacher> teacherList = new ArrayList<Teacher>();

	public Teacher(int number, String name, String password, String gender, Long birthday, int college, int profession,
			int title, int isJiaoWu) {
		this.number = number;
		this.name = name;
		this.password = password;
		this.gender = gender;
		this.birthday = birthday;
		this.profession = Profession.searchProfession(profession);
		this.college = College.searchCollege(college);
		this.title = Title.searchTitle(title);
		if (isJiaoWu == 0) {
			this.isJiaoWu = true;
		} else {
			this.isJiaoWu = false;
		}
		teacherList.add(this);
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public Profession getProfession() {
		return profession;
	}

	public void setProfession(Profession profession) {
		this.profession = profession;
	}

	public College getCollege() {
		return college;
	}

	public void setCollege(College college) {
		this.college = college;
	}

	public Title getTitle() {
		return title;
	}

	public void setTitle(Title title) {
		this.title = title;
	}

	public boolean isJiaoWu() {
		return isJiaoWu;
	}

	public void setJiaoWu(boolean isJiaoWu) {
		this.isJiaoWu = isJiaoWu;
	}

	public List<Teach> getTeachList() {
		return teachList;
	}

	public static List<Teacher> getTeacherList() {
		return teacherList;
	}

	// 删除教师
	public static void removeTeacher(Teacher teacher) {
		if (teacher != null) {
			if (teacherList.contains(teacher)) {
				teacherList.remove(teacher);
			}
		}
		teacher = null;
	}

	// 通过编号搜索教师
	public static Teacher searchTeacher(int number) {
		for (Teacher teacher : teacherList) {
			if (teacher.getNumber() == number)
				return teacher;
		}
		return null;
	}

	// 通过名称搜索教师
	public static Teacher searchTeacher(String name) {
		for (Teacher teacher : teacherList) {
			if (teacher.getName().equals(name))
				return teacher;
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
		Teacher other = (Teacher) obj;
		if (number != other.number)
			return false;
		return true;
	}
}
