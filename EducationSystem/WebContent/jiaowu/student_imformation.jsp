<%@page import="model.Student"%>
<%@page import="java.util.List"%>
<%@page import="model.Profession"%>
<%@page import="model.College"%>
<%@page import="model.Teacher"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
	Teacher teacher = (Teacher) session.getAttribute("login_user");
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>教务系统首页</title>
<link href="../css/xinxi.css" rel="stylesheet" type="text/css" />
<link href="../css/jw_div.css" rel="stylesheet" type="text/css" />
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
						class="span"><a href="index.html"><strong>教务首页</strong></a></td>
					<td width="120" align="center" bgcolor="#CCCCCC" class="span"><strong>课程导入</strong></td>
					<td width="120" align="center" bgcolor="#CCCCCC" class="span"
						onmouseover="MM_showHideLayers('apDiv1','','show','top','','show','top_menu','','show','main','','show')"
						onmouseout="MM_showHideLayers('apDiv1','','hide','top','','show','top_menu','','show','main','','show')"><strong>信息查询</strong></td>
					<td width="120" align="center" bgcolor="#CCCCCC" class="span"
						onmouseover="MM_showHideLayers('top','','show','top_menu','','show','apDiv3','','show')"
						onfocus="MM_showHideLayers('top','','show','top_menu','','show','apDiv3','','show')"><strong><a
							href="/EducationSystem/jiaowu/adjustclass.jsp">调课信息</a></strong></td>
					<td bgcolor="#CCCCCC" width="120" height="18" align="center"
						class="span"><strong><a href="jwxkqk.html">选课情况</a></strong></td>

					<td bgcolor="#CCCCCC">&nbsp;</td>
				</tr>
			</table>
		</div>
	</div>
	<div id="main">
		<table width="64%" height="110" border="1" class="边框color">

			<caption>查询</caption>
			<form action="../searchstudent.do" method="get">
			<tr>
				<th height="104" align="left" valign="top" scope="col">
					<p>
						学院<select name="college">
							<%
								for (College college : College.getCollegeList()) {
									out.println("<option value =\"" + college.getNumber() + "\">" + college.getName() + "</option>");
								}
							%>
						</select> 专业 <select name="profession">
							<%
								for (Profession profession : Profession.getProfessionList()) {
									out.println("<option value =\"" + profession.getNumber() + "\">" + profession.getName() + "</option>");
								}
							%>
						</select> 班级 <select name="class">
							<%
								for (model.Class theClass : model.Class.getClassList()) {
									out.println("<option value =\"" + theClass.getNumber() + "\">" + theClass.getName() + "</option>");
								}
							%>
						</select> 学号 <label for="textfield3"></label> <input name="number"
							type="text" class="边框" id="textfield3" />
					</p>
					<table width="100%" border="0" align="left">
						<tr>
							<td align="center"><input name="button" type="submit"
								class="边框color" id="button" value="提交" /></td>
						</tr>
					</table>
				</th>
			</tr>
			</form>
		</table>
		<p class="span">已选课程学生</p>
		<table width="100%" border="0">
			<tr>
				<td width="7%" bgcolor="#DCDCDC">&nbsp;</td>
				<td width="14%" align="center" bgcolor="#DCDCDC">学院</td>
				<td width="10%" align="center" bgcolor="#DCDCDC">学号</td>
				<td width="8%" align="center" bgcolor="#DCDCDC">姓名</td>
				<td width="11%" align="center" bgcolor="#DCDCDC">专业</td>
				<td width="11%" align="center" bgcolor="#DCDCDC">课程编号</td>
				<td width="16%" align="center" bgcolor="#DCDCDC">课程名称</td>
				<td width="13%" align="center" bgcolor="#DCDCDC">课程性质</td>
				<td width="10%" align="center" bgcolor="#DCDCDC">行政班级</td>
			</tr>
			<%
				List<Student> list = (List<Student>) session.getAttribute("studentList");
				if (list != null && list.size() > 0) {
					int i = 1;
					for (Student student : list) {
			%>
			<tr <%=(i % 2 != 0) ? "" : "bgcolor=\"#DCDCDC\""%>>
				<td align="center"><a
					href="student.jsp?id=<%=student.getNumber()%>"><input
						type="button" value="查看" /></a></td>
				<td><%=student.getTheClass().getProfession().getCollege().getName()%></td>
				<td><%=student.getNumber()%></td>
				<td><%=student.getName()%></td>
				<td><%=student.getTheClass().getProfession().getName()%></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td><%=student.getTheClass().getName()%></td>
			</tr>
			<%
				i++;
					}
				}
				session.removeAttribute("studentList");
			%>
		</table>
	</div>
</body>
</html>
