<%@page import="model.Semester"%>
<%@page import="model.PickCourse"%>
<%@page import="model.Teach"%>
<%@page import="java.util.List"%>
<%@page import="model.CourseType"%>
<%@ page import="model.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	Student student = (Student) request.getSession().getAttribute("login_user");
	CourseType courseType = CourseType.searchCourseType(Integer.parseInt(request.getParameter("coursetype")));
	List<Teach> teachList = (List<Teach>) request.getAttribute("teachList");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=courseType.getName()%></title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
<link href="css/div.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#apDiv3 {
	position: absolute;
	width: 79px;
	height: 114px;
	z-index: 1;
	left: 245px;
	top: 110px;
	filter: alpha(opacity = 80);
	opacity: 0.6;
	background-color: #CFE39E;
	visibility: hidden;
}

a:visited {
	color: #333;
}
</style>
<script type="text/javascript">
	function MM_showHideLayers() { //v9.0
		var i, p, v, obj, args = MM_showHideLayers.arguments;
		for (i = 0; i < (args.length - 2); i += 3)
			with (document)
				if (getElementById && ((obj = getElementById(args[i])) != null)) {
					v = args[i + 2];
					if (obj.style) {
						obj = obj.style;
						v = (v == 'show') ? 'visible'
								: (v == 'hide') ? 'hidden' : v;
					}
					obj.visibility = v;
				}
	}
</script>
</head>
<body>
	<!--顶层设计，固定层-->
	<div id="top">
		<div class="userinfo">
			<strong><%=student.getName()%> <%=student.getNumber()%> </strong> <a
				href="/EducationSystem/logout.do">安全退出</a>
		</div>
		<div class="logo" align="center">
			<p>
				<img src="images/top_logo2.png" width="350" height="45" />
			</p>
		</div>
		<div id="top_menu">
			<table width="100%" border="0" cellspacing="1" cellpadding="0">
				<tr>
					<td width="80" height="18" align="center" bgcolor="#D0E3A1"
						class="span"><a href="/EducationSystem/student/index.jsp"><strong>首页</strong></a></td>
					<td width="80" align="center" bgcolor="#D0E3A1" class="span"><strong><a
							href="/EducationSystem/student/pickcourse.jsp">选课</a></strong></td>
					<td width="80" align="center" bgcolor="#D0E3A1" class="span"><strong></strong></td>
					<td width="80" align="center" bgcolor="#D0E3A1" class="span"
						onmouseover="MM_showHideLayers('top','','show','top_menu','','show','apDiv3','','show')"
						onfocus="MM_showHideLayers('top','','show','top_menu','','show','apDiv3','','show')"><strong>信息</strong></td>
					<td bgcolor="#D0E3A1">&nbsp;</td>
					<td bgcolor="#D0E3A1">&nbsp;</td>
					<td bgcolor="#D0E3A1">&nbsp;</td>
				</tr>
			</table>
		</div>
	</div>
	<p>
		当前位置----<%=courseType.getName()%></p>
	<table width="443" border="0">
		<tr>
			<th width="150" bgcolor="#D5E4AB" scope="col"><a
				href="/EducationSystem/student/pickcourse.jsp">已选课程</a></th>
			<%
				//动态生成选不同类型课的超链接
				for (CourseType ct : CourseType.getCourseTypeList()) {
					if (!ct.isPickCourse()) {
						continue;
					}
			%>

			<th width="150" bgcolor="#D5E4AB" scope="col"><a
				href="pickcourse?coursetype=<%=ct.getNumber()%>"><%=ct.getName()%></a></th>
			<%
				}
			%>
		</tr>
	</table>
	<form
		action="/EducationSystem/pickcourse?coursetype=<%=courseType.getNumber()%>"
		method="post">
		<table width="100%" border="0">
			<tr>
				<td width="6%" bgcolor="#D6E5AC">选课</td>
				<td width="8%" bgcolor="#D6E5AC">课程名称</td>
				<td width="7%" bgcolor="#D6E5AC">课程代码</td>
				<td width="7%" bgcolor="#D6E5AC">教师姓名</td>
				<td width="7%" bgcolor="#D6E5AC">上课时间</td>
				<td width="7%" bgcolor="#D6E5AC">上课地点</td>
				<td width="4%" bgcolor="#D6E5AC">学分</td>
				<td width="6%" bgcolor="#D6E5AC">周学时</td>
				<td width="9%" bgcolor="#D6E5AC">起始结束周</td>
				<td width="3%" bgcolor="#D6E5AC">容量</td>
				<td width="3%" bgcolor="#D6E5AC">余量</td>
				<td width="7%" bgcolor="#D6E5AC">退选人数</td>
				<td width="7%" bgcolor="#D6E5AC">课程归属</td>
				<td width="7%" bgcolor="#D6E5AC">课程性质</td>
				<td width="8%" bgcolor="#D6E5AC">开课学院</td>
				<td width="4%" bgcolor="#D6E5AC">考试时间</td>
			</tr>
			<%
				for (int i = 0; i < teachList.size(); i++) {
					Teach teach = teachList.get(i);
					if (i % 2 == 0) {
			%>
			<tr bgcolor="#FAF8F9">
				<td align="center"><input type="checkbox" name="checkbox"
					id="checkbox" value="<%=teach.getNumber()%>" /> <label
					for="checkbox"></label></td>
				<td><%=teach.getCourse().getName()%></td>
				<td><%=teach.getNumber()%></td>
				<td><%=teach.getTeacher().getName()%></td>
				<td><%=teach.getClassTime().getName()%></td>
				<td><%=teach.getClassroom().getFullName()%></td>
				<td><%=teach.getCredit()%></td>
				<td>&nbsp;</td>
				<td><%=teach.getSemester().getStartYear()%>-<%=teach.getSemester().getOverYear()%></td>
				<td><%=teach.getCapacity()%></td>
				<td><%=teach.getCapacity() - teach.getChoose()%></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td><%=teach.getCourse().getCourseType().getName()%></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<%
				} else {
			%>
			<tr>
				<td align="center" bgcolor="#D6E5AC"><input type="checkbox"
					name="checkbox" id="checkbox" value="<%=teach.getNumber()%>" /></td>
				<td bgcolor="#D6E5AC"><%=teach.getCourse().getName()%></td>
				<td bgcolor="#D6E5AC"><%=teach.getNumber()%></td>
				<td bgcolor="#D6E5AC"><%=teach.getTeacher().getName()%></td>
				<td bgcolor="#D6E5AC"><%=teach.getClassTime().getName()%></td>
				<td bgcolor="#D6E5AC"><%=teach.getClassroom().getFullName()%></td>
				<td bgcolor="#D6E5AC"><%=teach.getCredit()%></td>
				<td bgcolor="#D6E5AC">&nbsp;</td>
				<td bgcolor="#D6E5AC"><%=teach.getSemester().getStartYear()%>-<%=teach.getSemester().getOverYear()%></td>
				<td bgcolor="#D6E5AC"><%=teach.getCapacity()%></td>
				<td bgcolor="#D6E5AC"><%=teach.getCapacity() - teach.getChoose()%></td>
				<td bgcolor="#D6E5AC">&nbsp;</td>
				<td bgcolor="#D6E5AC">&nbsp;</td>
				<td bgcolor="#D6E5AC"><%=teach.getCourse().getCourseType().getName()%></td>
				<td bgcolor="#D6E5AC">&nbsp;</td>
				<td bgcolor="#D6E5AC">&nbsp;</td>
			</tr>
			<%
				}
				}
			%>
		</table>
		<table width="100%" height="33" border="0">
			<tr>
				<td align="center"><input type="submit" name="button"
					id="button" value="提交" /></td>
			</tr>
		</table>
	</form>
	<table width="100%" border="0">
		<caption>已选课程</caption>
		<tr>
			<th width="8%" bgcolor="#FFFFFF" scope="col">课程名称</th>
			<th width="7%" bgcolor="#FFFFFF" scope="col">教师姓名</th>
			<th width="7%" bgcolor="#FFFFFF" scope="col">学分</th>
			<th width="8%" bgcolor="#FFFFFF" scope="col">周学时</th>
			<th width="10%" bgcolor="#FFFFFF" scope="col">起始结束周</th>
			<th width="8%" bgcolor="#FFFFFF" scope="col">校区</th>
			<th width="9%" bgcolor="#FFFFFF" scope="col">上课时间</th>
			<th width="10%" bgcolor="#FFFFFF" scope="col">上课地点</th>
			<th width="6%" bgcolor="#FFFFFF" scope="col">教材</th>
			<th width="8%" bgcolor="#FFFFFF" scope="col">课程归属</th>
			<th width="9%" bgcolor="#FFFFFF" scope="col">课程性质</th>
			<th width="5%" bgcolor="#FFFFFF" scope="col">退选</th>
		</tr>
		<%
			Semester semester = Semester.getThisSemester();
			for (PickCourse pickCourse : student.getPickCourseList()) {
				if (!pickCourse.getTeach().getCourse().getCourseType().equals(courseType)
						|| !pickCourse.getTeach().getSemester().equals(semester)) {
					continue;
				} else {
		%>

		<tr>
			<td bgcolor="#D6E5AC"><%=pickCourse.getTeach().getCourse().getName()%></td>
			<td bgcolor="#D6E5AC"><%=pickCourse.getTeach().getTeacher().getName()%></td>
			<td bgcolor="#D6E5AC"><%=pickCourse.getTeach().getCredit()%></td>
			<td bgcolor="#D6E5AC">&nbsp;</td>
			<td bgcolor="#D6E5AC"><%=pickCourse.getTeach().getSemester().getStartYear()%>-<%=pickCourse.getTeach().getSemester().getOverYear()%></td>
			<td bgcolor="#D6E5AC"><%=pickCourse.getTeach().getClassroom().getBuilding().getClassArea().getName()%></td>
			<td bgcolor="#D6E5AC"><%=pickCourse.getTeach().getClassTime().getName()%></td>
			<td bgcolor="#D6E5AC"><%=pickCourse.getTeach().getClassroom().getFullName()%></td>
			<td bgcolor="#D6E5AC">&nbsp;</td>
			<td bgcolor="#D6E5AC">&nbsp;</td>
			<td bgcolor="#D6E5AC"><%=pickCourse.getTeach().getCourse().getCourseType().getName()%></td>
			<td bgcolor="#D6E5AC"><a
				href="cancelpickcourse.do?number=<%=pickCourse.getNumber()%>">退选</a></td>
		</tr>
		<%
			}
			}
		%>
	</table>
	<table width="100%" border="0">
		<caption>课程总计</caption>
		<tr>
			<th width="8%" bgcolor="#D6E5AC" scope="col">代码</th>
			<th width="18%" bgcolor="#D6E5AC" scope="col">课程归属</th>
			<th width="23%" bgcolor="#D6E5AC" scope="col">已选学分</th>
			<th width="21%" bgcolor="#D6E5AC" scope="col">获得学分</th>
		</tr>
		<tr>
			<td align="center">0</td>
			<td align="left">通识必修</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr bgcolor="#D6E5AC">
			<td align="center">8</td>
			<td align="left">大学英语替换课</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</table>
	<p>&nbsp;</p>
	<p>
		<label for="radio"></label>
	</p>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<div class="menuinfo" id="apDiv3"
		onmouseover="MM_showHideLayers('top','','show','top_menu','','show','apDiv3','','show')"
		onmouseout="MM_showHideLayers('top','','show','top_menu','','show','apDiv3','','hide')">
		<table width="100%" border="0" cellspacing="1" cellpadding="0">
			<tr>
				<td height="30" align="center"><strong><a
						href="/EducationSystem/student/timetable.jsp">个人课表</a></strong></td>
			</tr>
			<tr>
				<td height="30" align="center"><strong><a
						href="/EducationSystem/student/information.jsp">个人信息</a></strong></td>
			</tr>
			<tr>
				<td height="30" align="center"><strong><a
						href="/EducationSystem/student/score.jsp">成绩信息</a></strong></td>
			</tr>
		</table>

	</div>
</body>
</html>