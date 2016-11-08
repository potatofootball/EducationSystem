package model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Semester {

	private int number;
	private int startYear;
	private int overYear;
	private int semester;
	private boolean thisSemester;

	private static Map<Integer, ArrayList<Semester>> semesterMap = new HashMap<Integer, ArrayList<Semester>>();
	private static List<Semester> semesterList = new ArrayList<Semester>();

	public Semester(int number, int startYear, int overYear, int semester, boolean thisSemester) {
		this.number = number;
		this.startYear = startYear;
		this.overYear = overYear;
		this.semester = semester;
		this.thisSemester = thisSemester;
		if (!semesterMap.containsKey(startYear)) {
			semesterMap.put(startYear, new ArrayList<Semester>());
		}
		semesterMap.get(startYear).add(this);
		semesterList.add(this);
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public int getStartYear() {
		return startYear;
	}

	public void setStartYear(int startYear) {
		this.startYear = startYear;
	}

	public int getOverYear() {
		return overYear;
	}

	public void setOverYear(int overYear) {
		this.overYear = overYear;
	}

	public int getSemester() {
		return semester;
	}

	public static Map<Integer, ArrayList<Semester>> getSemesterMap() {
		return semesterMap;
	}

	public void setSemester(int semester) {
		this.semester = semester;
	}

	public boolean isThisSemester() {
		return thisSemester;
	}

	public void setThisSemester(boolean thisSemester) {
		this.thisSemester = thisSemester;
	}

	public static List<Semester> getSemesterList() {
		return semesterList;
	}

	// 删除教学年度
	public static void removeSemester(Semester semester) {
		if (semester != null) {
			if (semesterList.contains(semester)) {
				semesterList.remove(semester);
			}
		}
		semester = null;
	}

	// 通过编号搜索教学年度
	public static Semester searchSemester(int number) {
		for (Semester semester : semesterList) {
			if (semester.getNumber() == number)
				return semester;
		}
		return null;
	}

	// 通过时间搜索教学年度
	public static Semester searchSemester(int startYear, int overYear, int semester) {
		for (Semester s : semesterList) {
			if (s.getStartYear() == startYear)
				if (s.getOverYear() == overYear)
					if (s.getSemester() == semester)
						return s;
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
		Semester other = (Semester) obj;
		if (number != other.number)
			return false;
		return true;
	}

	public static List<Semester> getStudentSemester(Student student) {
		int startYear = student.getTheClass().getYear();
		List<Semester> studentSemesterList = new ArrayList<Semester>();
		for (Semester semester : getSemesterList()) {
			if (semester.getStartYear() >= startYear && semester.getStartYear() <= startYear + 4) {
				studentSemesterList.add(semester);
			}
		}
		return studentSemesterList;
	}

	public static Semester getThisSemester() {
		for (Semester s : semesterList) {
			if (s.isThisSemester()) {
				return s;
			}
		}
		return semesterList.get(semesterList.size() - 1);
	}

}
