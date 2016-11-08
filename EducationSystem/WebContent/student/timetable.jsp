<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@page import="tool.TimeTableFormat"%>
<%@page import="model.PickCourse"%>
<%@page import="model.Semester"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Student"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人课表</title>
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

a:link {
	color: #333;
	text-decoration: none;
}

a:visited {
	text-decoration: none;
	color: #333;
}

a:hover {
	text-decoration: none;
}

a:active {
	text-decoration: none;
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

<%
	Student user = (Student) session.getAttribute("login_user");
	List<Semester> semesterList = Semester.getStudentSemester(user);
	List<PickCourse> pickCourseList = (List<PickCourse>) session.getAttribute("pickCourseList");
	session.removeAttribute("pickCourseList");
%>

<body>
	<!--顶层设计，固定层-->
	<div id="top">
		<div class="userinfo">
			<strong><%=user.getName()%>&nbsp;<%=user.getNumber()%> </strong><a
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
					<td width="80" align="center" bgcolor="#D0E3A1" class="span"><a
						href="/EducationSystem/student/pickcourse.jsp"><strong>选课</strong></a></td>
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
	<p>当前位置----个人课表</p>
	<table width="100%" height="902" border="0">
		<tr>
			<form action="../searchscorebystudent.do" method="get">
				<td height="34"><input type="submit" name="button1" value="查询"
					id="bt_cx"> <select name="option"
					onchange="javascript:setTimeout('__doPostBack(\'ddl_xn\',\'\')', 0)"
					id="ddl_xn">
						<%
							for (Semester s : semesterList) {
								out.print("<option value=\"" + s.getNumber() + "\">" + s.getStartYear() + "-" + s.getOverYear() + "-"
										+ s.getSemester() + "</option>");
							}
						%>
				</select> 学期学生个人课程表 <span id="upp2"><span id="lb_xf">（本学期选课学分：学分。）</span></span></td>
			</form>
		</tr>
		<tr>
			<td height="27"><span id="Label5">学号：<%=user.getNumber()%></span>
				| <span id="Label6">姓名：<%=user.getName()%></span> | <span
				id="Label7">学院：<%=user.getTheClass().getProfession().getCollege().getName()%></span>
				| <span id="Label8">专业：<%=user.getTheClass().getProfession().getName()%></span>|
				<span id="Label9">班级：<%=user.getTheClass().getName()%></span></td>
		</tr>
		<!--引用js-->
		<script type="text/javascript" src="../js/kchb.js"></script>
		<%
			Map<Integer, Map<Integer, Map<Integer, List<PickCourse>>>> map = TimeTableFormat.format(pickCourseList);
		%>
		<tr>
			<td height="833" align="left" valign="top">
				<%
					if (map == null || map.isEmpty()) {
				%><table width="100%" height="695" border="1" id="table1">
					<tbody>
						<tr>
							<td colspan="2" rowspan="1">时间</td>
							<td width="13.4%" align="center">星期一</td>
							<td width="13.4%" align="center">星期二</td>
							<td width="13.4%" align="center">星期三</td>
							<td width="13.4%" align="center">星期四</td>
							<td width="13.4%" align="center">星期五</td>
							<td width="13.4%" align="center">星期六</td>
							<td width="13.4%" align="center">星期日</td>
						</tr>
						<tr>
							<td width="4%" rowspan="4">上午</td>
							<td width="6%">第一节</td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
						</tr>
						<tr>
							<td>第二节</td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
						</tr>
						<tr>
							<td>第三节</td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
						</tr>
						<tr>
							<td>第四节</td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
						</tr>
						<tr>
							<td rowspan="5">下午</td>
							<td>第五节</td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
						</tr>
						<tr>
							<td>第六节</td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
						</tr>
						<tr>
							<td>第七节</td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
						</tr>
						<tr>
							<td>第八节</td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
						</tr>
						<tr>
							<td>第九节</td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
						</tr>
						<tr>
							<td rowspan="4">晚上</td>
							<td>第十节</td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
						</tr>
						<tr>
							<td>第十一节</td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
						</tr>
						<tr>
							<td>第十二节</td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
						</tr>
						<tr>
							<td>第十三节</td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
						</tr>
					</tbody>
				</table> <%
 	} else {
 %>
				<table width="100%" height="695" border="1" id="table1">
					<tbody>
						<tr>
							<td colspan="2" rowspan="1">时间</td>
							<td width="13.4%" align="center">星期一</td>
							<td width="13.4%" align="center">星期二</td>
							<td width="13.4%" align="center">星期三</td>
							<td width="13.4%" align="center">星期四</td>
							<td width="13.4%" align="center">星期五</td>
							<td width="13.4%" align="center">星期六</td>
							<td width="13.4%" align="center">星期日</td>
						</tr>
						<tr>
							<td width="4%" rowspan="4">上午</td>
							<%
								for (int i = 1; i < 5; i++) {
										out.print("<td width=\"6%\">第" + i + "节</td>");
										for (int j = 1; j < 8; j++) {
											if (map.get(i).get(j) == null) {
											} else if (map.get(i).get(j).get(map.get(i).get(j).keySet().iterator().next()) == null) {
												out.print("<td align=\"center\"> </td> ");
											} else {
												StringBuilder sb = new StringBuilder();
												int high = map.get(i).get(j).keySet().iterator().next();
												for (PickCourse p : map.get(i).get(j).get(high)) {
													sb.append(p.getTeach().getCourse().getName() + "<br>");
													sb.append(p.getTeach().getTeacher().getName() + "<br>");
													sb.append(p.getTeach().getClassroom().getFullName() + "<br>");
													sb.append(p.getTeach().getClassTime().getName() + "<hr>");
												}
												sb.delete(sb.length() - 4, sb.length());
												out.print("<td align=\"center\" rowspan=\"" + high + "\">" + sb.toString() + "</td>");
											}
										}
										out.println("</tr>");
									}
							%>
							<td rowspan="5">下午</td>
							<%
								for (int i = 5; i < 10; i++) {
										out.print("<td width=\"6%\">第" + i + "节</td>");
										for (int j = 1; j < 8; j++) {
											if (map.get(i).get(j) == null) {
											} else if (map.get(i).get(j).get(map.get(i).get(j).keySet().iterator().next()) == null) {
												out.print("<td align=\"center\"> </td> ");
											} else {
												StringBuilder sb = new StringBuilder();
												int high = map.get(i).get(j).keySet().iterator().next();
												for (PickCourse p : map.get(i).get(j).get(high)) {
													sb.append(p.getTeach().getCourse().getName() + "<br>");
													sb.append(p.getTeach().getTeacher().getName() + "<br>");
													sb.append(p.getTeach().getClassroom().getFullName() + "<br>");
													sb.append(p.getTeach().getClassTime().getName() + "<hr>");
												}
												sb.delete(sb.length() - 4, sb.length());
												out.print("<td align=\"center\" rowspan=\"" + high + "\">" + sb.toString() + "</td>");
											}
										}
										out.println("</tr>");
									}
							%>
							<td rowspan="4">晚上</td>
							<%
								for (int i = 10; i < 14; i++) {
										out.print("<td width=\"6%\">第" + i + "节</td>");
										for (int j = 1; j < 8; j++) {
											if (map.get(i).get(j) == null) {
											} else if (map.get(i).get(j).get(map.get(i).get(j).keySet().iterator().next()) == null) {
												out.print("<td align=\"center\"> </td> ");
											} else {
												StringBuilder sb = new StringBuilder();
												int high = map.get(i).get(j).keySet().iterator().next();
												for (PickCourse p : map.get(i).get(j).get(high)) {
													sb.append(p.getTeach().getCourse().getName() + "<br>");
													sb.append(p.getTeach().getTeacher().getName() + "<br>");
													sb.append(p.getTeach().getClassroom().getFullName() + "<br>");
													sb.append(p.getTeach().getClassTime().getName() + "<hr>");
												}
												sb.delete(sb.length() - 4, sb.length());
												out.print("<td align=\"center\" rowspan=\"" + high + "\">" + sb.toString() + "</td>");
											}
										}
										out.println("</tr>");
										if (i != 13)
											out.println("<tr>");
									}
							%>
						
					</tbody>
				</table> <%
 	}
 %>
				<fieldset>
					<legend>未安排上课时间的课程：</legend>
					<div>
						<table cellspacing="0" cellpadding="4" rules="all" border="1"
							id="gv_kc">
							<tbody>
								<tr>
									<td colspan="5">该查询条件无任何数据</td>
								</tr>
							</tbody>
						</table>
					</div>
				</fieldset>
				<fieldset>
					<legend>调、停（补）课信息：</legend>
					<div>
						<table cellspacing="0" cellpadding="4" rules="all" border="1"
							id="gv_ttk">
							<tbody>
								<tr>
									<td colspan="8">该查询条件无任何数据</td>
								</tr>
							</tbody>
						</table>
					</div>
				</fieldset>
				<fieldset>
					<legend>退选信息(以下信息为教学班退选历史信息)：</legend>
					<div>
						<table cellspacing="0" cellpadding="3" rules="all" border="1"
							id="gv_txlist">
							<tbody>
								<tr>
									<td colspan="7">暂无退选记录。</td>
								</tr>
							</tbody>
						</table>
					</div>
				</fieldset>
			</td>
		</tr>
	</table>
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
