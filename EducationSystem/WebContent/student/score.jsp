<%@page import="model.PickCourse"%>
<%@page import="java.util.List"%>
<%@page import="model.Semester"%>
<%@ page import="model.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	Student user = (Student) session.getAttribute("login_user");
	List<PickCourse> pickCourseList = (List<PickCourse>) session.getAttribute("pickCourseList");
	session.removeAttribute("pickCourseList");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教务系统-成绩</title>
<link href="../css/css.css" rel="stylesheet" type="text/css" />
<link href="../css/div.css" rel="stylesheet" type="text/css" />
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
			<strong><%=user.getName()%>-<%=user.getNumber()%></strong> <a
				href="/EducationSystem/logout.do">安全退出</a>
		</div>
		<div class="logo" align="center">
			<p>
				<img src="../images/top_logo2.png" width="350" height="45" />
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
			<table width="100%" border="0">
				<tr>
					<td width="14%" height="33">学号：<%=user.getNumber()%>姓名：<%=user.getName()%>
						学院：<%=user.getTheClass().getProfession().getCollege().getName()%>
						专业：<%=user.getTheClass().getProfession().getName()%> 班级：<%=user.getTheClass().getName()%>
					</td>
				</tr>
				<tr>
					<td height="34">
						<form action="../searchscorebystudent.do" method="post">
							<p>
								<%
									List<Semester> semesterList = Semester.getStudentSemester(user);
								%>
								<span id="Label1">学年学期：</span>  <select name="option" id="ddlXN">
									<%
										for (Semester s : semesterList) {
											out.print("<option value=\"" + s.getNumber() + "\">" + s.getStartYear() + "-" + s.getOverYear() + "-"
													+ s.getSemester() + "</option>");
										}
									%>
								</select> <input type="submit" name="button1" value="按学期查询"> <input
									type="submit" name="button2" value="按学年查询"> <input
									type="submit" name="button3" value="在校学习成绩查询">
							</p>
						</form> <!-- 						<div class="word"> --> <!-- 							<p>【学年第学期学生成绩】获得学分：；修读学分：；重修学分：</p> -->
						<!-- 						</div> -->
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div id="main">
		<table width="100%" border="0">
			<tr>
				<td width="5%" bgcolor="#CDE199">学年</td>
				<td width="7%" bgcolor="#CDE199">学期</td>
				<td width="12%" bgcolor="#CDE199">课程代码</td>
				<td width="6%" bgcolor="#CDE199">课程名称</td>
				<td width="8%" bgcolor="#CDE199">原始课程性质</td>
				<td width="8%" bgcolor="#CDE199">互认课程性质</td>
				<td width="6%" bgcolor="#CDE199">课程归属</td>
				<td width="6%" bgcolor="#CDE199">学分</td>
				<td width="6%" bgcolor="#CDE199">绩点</td>
				<td width="6%" bgcolor="#CDE199">成绩</td>
				<td width="6%" bgcolor="#CDE199">辅修</td>
				<td width="6%" bgcolor="#CDE199">补考成绩</td>
				<td width="6%" bgcolor="#CDE199">开课单位</td>
				<td width="6%" bgcolor="#CDE199">备注</td>
				<td width="6%" bgcolor="#CDE199">重修</td>
			</tr>
			<%
				if (pickCourseList != null && !pickCourseList.isEmpty()) {
					for (int i = 0; i < pickCourseList.size(); i++) {
						PickCourse pc = pickCourseList.get(i);
						Semester semester = pc.getTeach().getSemester();
						if (i % 2 == 0) {
			%>
			<tr>
				<td><%=semester.getStartYear()%>-<%=semester.getOverYear()%></td>
				<td><%=semester.getSemester()%></td>
				<td><%=pc.getTeach().getNumber()%></td>
				<td><%=pc.getTeach().getCourse().getName()%></td>
				<td><%=pc.getTeach().getCourse().getCourseType().getName()%></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td><%=pc.getTeach().getCredit()%></td>
				<td><%=(pc.getScore() > 50) ? (pc.getScore() - 50) / 10.0 : 0%></td>
				<td><%=pc.getScore()%></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<%
				} else {
			%>
			<tr bgcolor="#CDE199">
				<td><%=semester.getStartYear()%>-<%=semester.getOverYear()%></td>
				<td><%=semester.getSemester()%></td>
				<td><%=pc.getTeach().getNumber()%></td>
				<td><%=pc.getTeach().getCourse().getName()%></td>
				<td><%=pc.getTeach().getCourse().getCourseType().getName()%></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td><%=pc.getTeach().getCredit()%></td>
				<td><%=(pc.getScore() > 50) ? (pc.getScore() - 50) / 10.0 : 0%></td>
				<td><%=pc.getScore()%></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<%
				}
					}
				}
			%>
		</table>
		<table width="100%">
			<tbody>
				<tr>
					<td height="222" colspan="2"><fieldset>
							<legend>学分修读情况统计</legend>
							<div>
								<table width="50%" cellpadding="3" border="0" id="gv_xf">
									<tbody>
										<tr>
											<th bgcolor="#D4E4A6" scope="col">课程性质</th>
											<th bgcolor="#D4E4A6" scope="col">学分要求</th>
											<th bgcolor="#D4E4A6" scope="col">获得学分</th>
											<th bgcolor="#D4E4A6" scope="col">本学期在修学分</th>
											<th bgcolor="#D4E4A6" scope="col">下学期选课学分</th>
											<th bgcolor="#D4E4A6" scope="col">缺学分</th>
										</tr>
										<tr>
											<td>公共必修课</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td> </td>
											<td> </td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td bgcolor="#CEE29B">公共选修课</td>
											<td bgcolor="#CEE29B">&nbsp;</td>
											<td bgcolor="#CEE29B">&nbsp;</td>
											<td bgcolor="#CEE29B"> </td>
											<td bgcolor="#CEE29B"> </td>
											<td bgcolor="#CEE29B">&nbsp;</td>
										</tr>
										<tr>
											<td>学科基础课</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td> </td>
											<td> </td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td bgcolor="#CDE19A">专业方向课</td>
											<td bgcolor="#CDE19A">&nbsp;</td>
											<td bgcolor="#CDE19A">&nbsp;</td>
											<td bgcolor="#CDE19A">&nbsp;</td>
											<td bgcolor="#CDE19A"> </td>
											<td bgcolor="#CDE19A">&nbsp;</td>
										</tr>
										<tr>
											<td>实践教学</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td> </td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td bgcolor="#CDE199">专业主干课</td>
											<td bgcolor="#CDE199">&nbsp;</td>
											<td bgcolor="#CDE199">&nbsp;</td>
											<td bgcolor="#CDE199">&nbsp;</td>
											<td bgcolor="#CDE199"> </td>
											<td bgcolor="#CDE199">&nbsp;</td>
										</tr>
										<tr>
											<td>个性课程</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td> </td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td bgcolor="#CDE199">合计</td>
											<td bgcolor="#CDE199">&nbsp;</td>
											<td bgcolor="#CDE199">&nbsp;</td>
											<td bgcolor="#CDE199">&nbsp;</td>
											<td bgcolor="#CDE199"> </td>
											<td bgcolor="#CDE199">&nbsp;</td>
										</tr>
									</tbody>
								</table>
							</div>
							<br /> 注:缺学分合计不包含超过学分要求多修的学分。
						</fieldset></td>
					<td width="50%"><fieldset>
							<legend>重修获得学分计入正修学年学期</legend>
							<div>
								<table width="50%" cellpadding="3" border="0" id="gridview7">
									<tbody>
										<tr>
											<th bgcolor="#CDE19A" scope="col">学年学期</th>
											<th bgcolor="#CDE19A" scope="col">获得学分</th>
											<th bgcolor="#CDE19A" scope="col">选课学分</th>
											<th bgcolor="#CDE19A" scope="col">重修学分</th>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td bgcolor="#CDE199">&nbsp;</td>
											<td bgcolor="#CDE199">&nbsp;</td>
											<td bgcolor="#CDE199">&nbsp;</td>
											<td bgcolor="#CDE199">&nbsp;</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td bgcolor="#CDE199">&nbsp;</td>
											<td bgcolor="#CDE199">&nbsp;</td>
											<td bgcolor="#CDE199">&nbsp;</td>
											<td bgcolor="#CDE199">&nbsp;</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td height="15" bgcolor="#CDE199">&nbsp;</td>
											<td bgcolor="#CDE199">&nbsp;</td>
											<td bgcolor="#CDE199">&nbsp;</td>
											<td bgcolor="#CDE199">&nbsp;</td>
										</tr>
										<tr>
											<td>合计</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
										</tr>
									</tbody>
								</table>
							</div>
						</fieldset></td>
				</tr>
			</tbody>
		</table>
		<p>&nbsp;</p>

		<div id="main_table"></div>
	</div>
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