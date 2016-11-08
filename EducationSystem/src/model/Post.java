package model;

import java.util.ArrayList;
import java.util.List;

public class Post {

	private int number;
	private String name;

	private static List<Post> postList = new ArrayList<Post>();

	public Post(int number, String name) {
		this.number = number;
		this.name = name;
		postList.add(this);
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

	public static List<Post> getPostList() {
		return postList;
	}

	// 删除职务
	public static void removePost(Post post) {
		if (post != null) {
			if (postList.contains(post)) {
				postList.remove(post);
			}
		}
		post = null;
	}

	// 通过编号搜索职务
	public static Post searchPost(int number) {
		for (Post post : postList) {
			if (post.getNumber() == number)
				return post;
		}
		return null;
	}

	// 通过名称搜索职务
	public static Post searchPost(String name) {
		for (Post post : postList) {
			if (post.getName().equals(name))
				return post;
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
		Post other = (Post) obj;
		if (number != other.number)
			return false;
		return true;
	}
}
