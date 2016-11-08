package model;

import java.util.List;
import java.util.ArrayList;

public class Served {

	private int number;
	private Teacher teacher;
	private Post post;

	private static List<Served> servedList = new ArrayList<Served>();

	public Served(int number, int teacher, int post) {
		this.number = number;
		this.teacher = Teacher.searchTeacher(teacher);
		this.post = Post.searchPost(post);
		servedList.add(this);
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

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	public static List<Served> getServedList() {
		return servedList;
	}

	// 删除担任职务
	public static void removeServed(Served served) {
		if (served != null) {
			if (servedList.contains(served)) {
				servedList.remove(served);
			}
		}
		served = null;
	}

	// 通过编号搜索担任职务
	public static Served searchServed(int number) {
		for (Served served : servedList) {
			if (served.getNumber() == number)
				return served;
		}
		return null;
	}

	// 通过教师搜索担任职务
	public static List<Post> searchServed(Teacher teacher) {
		List<Post> aServedList = new ArrayList<Post>();
		for (Served served : servedList) {
			if (served.getTeacher().equals(teacher))
				aServedList.add(served.getPost());
		}
		return aServedList;
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
		Served other = (Served) obj;
		if (number != other.number)
			return false;
		return true;
	}
}
