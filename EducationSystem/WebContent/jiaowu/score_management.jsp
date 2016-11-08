<%@page import="model.Teach"%>
<%@page import="model.PickCourse"%>
<%@page import="model.ClassTime"%>
<%@page import="model.Course"%>
<%@page import="model.CourseType"%>
<%@page import="java.util.List"%>
<%@page import="model.Semester"%>
<%@ page import="model.Teacher"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	Teacher teacher = (Teacher) session.getAttribute("login_user");
	List<Semester> semesterList = Semester.getSemesterList();
	List<CourseType> courseTypeList = CourseType.getCourseTypeList();
	List<Course> courseList = Course.getCourseList();
	List<Teacher> teacherList = Teacher.getTeacherList();
	List<ClassTime> classTimeList = ClassTime.getClassTimeTimeList();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>成绩管理</title>
<link href="/EducationSystem/css/jw_css.css" rel="stylesheet"
	type="text/css" />
<link href="/EducationSystem/css/jw_div.css" rel="stylesheet"
	type="text/css" />
<style type="text/css">
#apDiv1 {
	position: absolute;
	width: 120px;
	height: 80px;
	z-index: 1;
	left: 245px;
	top: 108px;
	background-color: #CCCCCC;
	opacity: 0.6;
	filter: alpha(opacity = 80);
	visibility: hidden;
}

body {
	background-repeat: repeat-x;
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
	<div class="menuinfo" id="apDiv1"
		onmousemove="MM_showHideLayers('apDiv1','','show','top','','show','top_menu','','show','main','','show')"
		onmouseout="MM_showHideLayers('apDiv1','','hide','top','','show','top_menu','','show','main','','show')">
		<table width="100%" border="0" cellspacing="1" cellpadding="0">
			<tr>
				<th height="40" scope="row"><a
					href="/EducationSystem/jiaowu/score_management.jsp">课程成绩查询</a></th>
			</tr>
			<tr>
				<th height="40" scope="row"><a href="/EducationSystem/jiaowu/student_score.jsp">学生成绩查询</a></th>
			</tr>
			<tr>
				<th height="40" scope="row"><a href="/EducationSystem/jiaowu/student_imformation.jsp">学生信息</a></th>
			</tr>
			<tr>
				<th height="40" scope="row"><a href="/EducationSystem/jiaowu/jiaowu_information.jsp">教师信息</a></th>
			</tr>
		</table>
	</div>
	<!--顶层设计，固定层-->
	<div id="top">
		<div class="userinfo">
			<strong><%=teacher.getName()%> </strong><a
				href="/EducationSystem/logout.do">安全退出</a>
		</div>
		<div class="logo">
			<p>
				<img src="../images/top_logo2.png" width="350" height="45" />
			</p>
		</div>
		<div id="top_menu">
			<table width="100%" border="0" cellspacing="1" cellpadding="0">
				<tr>
					<td width="120" height="18" align="center" bgcolor="#CCCCCC"
						class="span"><a href="/EducationSystem/jiaowu/index.jsp"><strong>教务首页</strong></a></td>
					<td width="120" align="center" bgcolor="#CCCCCC" class="span"><strong>课程导入</strong></td>
					<td width="120" align="center" bgcolor="#CCCCCC" class="span"
						onmouseover="MM_showHideLayers('apDiv1','','show','top','','show','top_menu','','show','main','','show')"
						onmouseout="MM_showHideLayers('apDiv1','','hide','top','','show','top_menu','','show','main','','show')"><strong>信息查询</strong></td>
					<td width="120" align="center" bgcolor="#CCCCCC" class="span"
						onmouseover="MM_showHideLayers('top','','show','top_menu','','show','apDiv3','','show')"
						onfocus="MM_showHideLayers('top','','show','top_menu','','show','apDiv3','','show')"><strong><a
							href="/EducationSystem/jiaowu/adjustclass.jsp">调课信息</a></strong></td>
					<td width="120" align="center" bgcolor="#CCCCCC" class="span"><strong><a
							href="jwxkqk.html">选课情况</a></strong></td>
					<td bgcolor="#CCCCCC">&nbsp;</td>
					<td bgcolor="#CCCCCC">&nbsp;</td>
				</tr>
			</table>
		</div>
	</div>
	<div id="main"></div>
	<p>当前位置----课程成绩查询</p>
	<form action="/EducationSystem/teachscore.do" method="post">
		<table width="100%" height="104" border="1" class="biankuang">
			<tbody>
				<tr>
					<th width="50%" height="92" align="left" valign="top" scope="col"><p>
							按课程代码查询：课程代码 <label for="textfield"></label> <input
								name="classNumber" type="text" class="biankuang" id="textfield"><input
								name="button" type="submit" id="button" value="查询"></th>
					<th width="50%" align="left" valign="top" scope="col"><p>
							按课程性质查询：学期 <label for="select"></label> <select name="semester"
								id="select">
								<%
									for (Semester semester : semesterList) {
										out.println("<option>" + semester.getStartYear() + "-" + semester.getOverYear() + "-"
												+ semester.getSemester() + "</option>");
									}
								%>
							</select> 课程类型 <label for="textfield2"></label> <select name="courseType"
								id="select">
								<%
									for (CourseType ct : courseTypeList) {
										out.println("<option>" + ct.getName() + "</option>");
									}
								%>
							</select>
						</p>
						<p>&nbsp;</p>
						<p>
							课程名 <label for="textfield3"></label> <select name="course"
								id="select">
								<%
									for (Course c : courseList) {
										out.println("<option>" + c.getName() + "</option>");
									}
								%>
							</select> 任课教师 <label for="textfield2"></label> <select name="teacher"
								id="select">
								<%
									for (Teacher t : teacherList) {
										out.println("<option>" + t.getName() + "</option>");
									}
								%>
							</select>
						</p>
						<p>&nbsp;</p>
						<p>
							上课时间 <label for="textfield3"></label> <select name="classtime"
								id="select">
								<%
									for (ClassTime ct : classTimeList) {
										out.println("<option>" + ct.getName() + "</option>");
									}
								%>
							</select> <input type="submit" name="button2" id="button2" value="查询">
						</p></th>
				</tr>
			</tbody>
		</table>
		<!-- 修改查询条件的边框到这里结束-->
	</form>
	<p>&nbsp;</p>
	<p>
		<strong>课程总计</strong> --
	</p>
	<%
		Teach teach = (Teach) request.getAttribute("teach");
	%>
	<table width="69%" border="0">
		<tbody>
			<tr>
				<%
					if (teach != null) {
				%>
				<td width="20%" height="14"><strong>课程编码：<%=teach.getNumber()%></strong></td>
				<td width="27%"><strong>选课人数：<%=teach.getChoose()%></strong></td>
				<td width="27%"><strong>任课教师：<%=teach.getTeacher().getName()%></strong></td>
				<td width="26%"><strong>课程性质：<%=teach.getCourse().getCourseType().getName()%></strong></td>
				<%
					} else {
				%>
				<td width="20%" height="14"><strong>课程编码：</strong></td>
				<td width="27%"><strong>选课人数：</strong></td>
				<td width="27%"><strong>任课教师：</strong></td>
				<td width="26%"><strong>课程性质：</strong></td>
				<%
					}
				%>
				<td width="27%">&nbsp;</td>
			</tr>
		</tbody>
	</table>
	<p>&nbsp;</p>
	<table width="100%" border="0">
		<tbody>
			<tr>
				<th width="11%" bgcolor="#DCDCDC" scope="col">学号</th>
				<th width="12%" bgcolor="#DCDCDC" scope="col">学生姓名</th>
				<th width="12%" bgcolor="#DCDCDC" scope="col">平时成绩</th>
				<th width="13%" bgcolor="#DCDCDC" scope="col">期中成绩</th>
				<th width="13%" bgcolor="#DCDCDC" scope="col">期末成绩</th>
				<th width="11%" bgcolor="#DCDCDC" scope="col">总评成绩</th>
				<th width="6%" bgcolor="#DCDCDC" scope="col">绩点</th>
				<th width="12%" bgcolor="#DCDCDC" scope="col">备注</th>
				<th width="10%" bgcolor="#DCDCDC" scope="col">重修标记</th>
			</tr>
			<%
				if (teach != null) {
					List<PickCourse> pickCourseList = teach.getPickCourseList();
					for (int mark = 0; mark < pickCourseList.size(); mark++) {
						PickCourse pc = pickCourseList.get(mark);
						if (mark % 2 == 1) {
			%>
			<tr>
				<td><%=pc.getStudent().getNumber()%></td>
				<td><%=pc.getStudent().getName()%></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td><%=pc.getScore()%></td>
				<td><%=pc.getTeach().getCredit()%></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<%
				} else {
			%>
			<tr>
				<td bgcolor="#DCDCDC"><%=pc.getStudent().getNumber()%></td>
				<td bgcolor="#DCDCDC"><%=pc.getStudent().getName()%></td>
				<td bgcolor="#DCDCDC">&nbsp;</td>
				<td bgcolor="#DCDCDC">&nbsp;</td>
				<td bgcolor="#DCDCDC">&nbsp;</td>
				<td bgcolor="#DCDCDC"><%=pc.getScore()%></td>
				<td bgcolor="#DCDCDC"><%=pc.getTeach().getCredit()%></td>
				<td bgcolor="#DCDCDC">&nbsp;</td>
				<td bgcolor="#DCDCDC">&nbsp;</td>
			</tr>
			<%
				}
					}
				}
			%>
		</tbody>
	</table>
	<table width="100%" height="142" border="0">
		<tr>
			<th height="138" align="center" valign="middle" scope="col"><table
					width="50%" height="83" border="0" class="边框color">
					<tr>
						<td width="49%" align="center" bgcolor="#DCDCDC">课程平均分：</td>
						<td width="51%" align="center" valign="middle" bgcolor="#D6D6D6">&nbsp;</td>
					</tr>
					<tr>
						<td align="center" bgcolor="#D6D6D6">课程及格人数：</td>
						<td align="center" valign="middle" bgcolor="#D6D6D6">&nbsp;</td>
					</tr>
					<tr>
						<td align="center" bgcolor="#D6D6D6">课程不及格人数：</td>
						<td align="center" valign="middle" bgcolor="#D6D6D6">&nbsp;</td>
					</tr>
				</table></th>
		</tr>
	</table>
	<p>&nbsp;</p>
	<p>&nbsp;</p>

</body>
</html>
