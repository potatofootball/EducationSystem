package model;

import java.util.ArrayList;
import java.util.List;

public class AdjustClass {

	private int number;
	private Teach teach;
	private String changeFrom;
	private String changeTo;
	private String message;
	private Long submitTime;
	private Long confirmTime;
	private boolean confirm;
	private boolean allow;

	private static List<AdjustClass> adjustClassList = new ArrayList<AdjustClass>();

	public AdjustClass(int number, int teach, String changeFrom, String changeTo, String message, Long submitTime,
			Long confirmTime, int confirm, int allow) {
		this.number = number;
		this.teach = Teach.searchTeach(teach);
		this.changeFrom = changeFrom;
		this.changeTo = changeTo;
		this.message = message;
		this.submitTime = submitTime;
		this.confirmTime = confirmTime;
		if (confirm == 0) {
			this.confirm = true;
		} else {
			this.confirm = false;
		}
		if (allow == 0) {
			this.allow = true;
		} else {
			this.allow = false;
		}
		adjustClassList.add(this);
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public Teach getTeach() {
		return teach;
	}

	public void setTeach(Teach teach) {
		this.teach = teach;
	}

	public String getChangeFrom() {
		return changeFrom;
	}

	public void setChangeFrom(String changeFrom) {
		this.changeFrom = changeFrom;
	}
	
	public String getWeek(String week) {
		if (week.indexOf("1") >= 0) {
			return "单周";
		} else if (week.indexOf("2") >= 0) {
			return "双周";
		} else {
			return "单双周";
		}
	}

	public String getChangeTo() {
		return changeTo;
	}

	public void setChangeTo(String changeTo) {
		this.changeTo = changeTo;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Long getSubmitTime() {
		return submitTime;
	}

	public void setSubmitTime(Long submitTime) {
		this.submitTime = submitTime;
	}

	public Long getConfirmTime() {
		return confirmTime;
	}

	public void setConfirmTime(Long confirmTime) {
		this.confirmTime = confirmTime;
	}

	public boolean isConfirm() {
		return confirm;
	}

	public void setConfirm(boolean confirm) {
		this.confirm = confirm;
	}

	public boolean isAllow() {
		return allow;
	}

	public void setAllow(boolean allow) {
		this.allow = allow;
	}

	public static List<AdjustClass> getAdjustClassList() {
		return adjustClassList;
	}

	// 删除调课信息
	public static void removeAdjustClass(AdjustClass adjustClass) {
		if (adjustClass != null) {
			if (adjustClassList.contains(adjustClass)) {
				adjustClassList.remove(adjustClass);
			}
		}
		adjustClass = null;
	}

	// 通过编号搜索调课信息
	public static AdjustClass searchAdjustClass(int number) {
		for (AdjustClass AdjustClass : adjustClassList) {
			if (AdjustClass.getNumber() == number)
				return AdjustClass;
		}
		return null;
	}

	// 通过课程搜索调课信息
	public static List<AdjustClass> searchAdjustClass(Teach teach) {
		List<AdjustClass> list = new ArrayList<AdjustClass>();
		for (AdjustClass AdjustClass : adjustClassList) {
			if (AdjustClass.getTeach().equals(teach))
				list.add(AdjustClass);
		}
		return list;
	}

}
