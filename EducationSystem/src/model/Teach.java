package model;

import java.util.ArrayList;
import java.util.List;

public class Teach {

	private int number;
	private Teacher teacher;
	private Course course;
	private Classroom classroom;
	private int credit;
	private int capacity;
	private int choose;
	private ClassTime classTime;
	private boolean socreConfirm;
	private Semester semester;
	private List<PickCourse> pickCourseList = new ArrayList<PickCourse>();

	private static List<Teach> teachList = new ArrayList<Teach>();

	public Teach(int number, int teacher, int course, int classroom, int credit, int capacity, int choose,
			int classTime, int socreConfirm, int semester) {
		this.number = number;
		this.teacher = Teacher.searchTeacher(teacher);
		this.course = Course.searchCourse(course);
		this.classroom = Classroom.searchClassroom(classroom);
		this.credit = credit;
		this.capacity = capacity;
		this.choose = choose;
		this.classTime = ClassTime.searchClassTime(classTime);
		if (socreConfirm != 0) {
			this.socreConfirm = true;
		} else {
			this.socreConfirm = false;
		}
		this.semester = Semester.searchSemester(semester);
		this.course.addTeach(this);
		teachList.add(this);
		this.teacher.getTeachList().add(this);
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public Classroom getClassroom() {
		return classroom;
	}

	public void setClassroom(Classroom classroom) {
		this.classroom = classroom;
	}

	public int getCredit() {
		return credit;
	}

	public void setCredit(int credit) {
		this.credit = credit;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public int getChoose() {
		return choose;
	}

	public void setChoose(int choose) {
		this.choose = choose;
	}

	public ClassTime getClassTime() {
		return classTime;
	}

	public void setClassTime(ClassTime classTime) {
		this.classTime = classTime;
	}

	public boolean isSocreConfirm() {
		return socreConfirm;
	}

	public void setSocreConfirm(boolean socreConfirm) {
		this.socreConfirm = socreConfirm;
	}

	public Semester getSemester() {
		return semester;
	}

	public void setSemester(Semester semester) {
		this.semester = semester;
	}

	public List<PickCourse> getPickCourseList() {
		return pickCourseList;
	}

	public static List<Teach> getTeachList() {
		return teachList;
	}

	// 删除实际课程
	public static void removeTeach(Teach teach) {
		if (teach != null) {
			if (teachList.contains(teach)) {
				teachList.remove(teach);
			}
		}
		teach = null;
	}

	// 通过编号搜索实际课程
	public static Teach searchTeach(int number) {
		for (Teach teach : teachList) {
			if (teach.getNumber() == number)
				return teach;
		}
		return null;
	}

	// 通过教师搜索其执教的实际课程
	public static List<Teach> searchTeach(Teacher teacher) {
		List<Teach> list = new ArrayList<Teach>();
		for (Teach teach : teachList) {
			if (teacher.equals(teach.getTeacher()))
				list.add(teach);
		}
		return list;
	}
}
