<%@page import="model.Student"%>
<%@page import="java.util.List"%>
<%@page import="model.Profession"%>
<%@page import="model.College"%>
<%@page import="model.Teacher"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
	Teacher user = (Teacher) session.getAttribute("login_user");
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>教务系统首页</title>
<link href="../css/css.css" rel="stylesheet" type="text/css" />
<link href="../css/div.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#apDiv3 {
	position: absolute;
	width: 79px;
	height: 96px;
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
	<!--顶层设计，固定层-->
	<div id="top">
		<div class="userinfo">
			<strong><%=user.getName()%> <%=user.getNumber()%> </strong><a
				href="../logout.do">安全退出</a>
		</div>
		<div class="logo" align="center">
			<p>
				<img src="../images/top_logo2.png" width="350" height="45" />
			</p>
		</div>
		<div id="top_menu">
			<table width="100%" border="0" cellspacing="1" cellpadding="0">
				<tr>
					<td width="80" height="18" align="center" bgcolor="#DCDCDC"
						class="span"><a href="index.jsp"><strong>首页</strong></a></td>
					<td width="54" align="center" bgcolor="#DCDCDC" class="span"><a
						href="changeclass.jsp"><strong>调课</strong></a></td>
					<td width="62" align="center" bgcolor="#DCDCDC" class="span"><strong>请假</strong></td>
					<td width="78" align="center" bgcolor="#DCDCDC" class="span"
						onmouseover="MM_showHideLayers('top','','show','top_menu','','show','apDiv3','','show')"
						onfocus="MM_showHideLayers('top','','show','top_menu','','show','apDiv3','','show')"><strong>信息</strong></td>
					<td width="100" bgcolor="#DCDCDC" class="span"><strong><a
							href="pickcourseinfo.jsp">选课情况</a></strong></td>
					<td width="688" bgcolor="#DCDCDC">&nbsp;</td>
					<td width="61" bgcolor="#DDDDDD">&nbsp;</td>
				</tr>
			</table>
		</div>
	</div>
	<div id="main">
		<table width="64%" height="110" border="1" class="边框color">

			<caption>查询</caption>
			<form action="../searchstudent.do" method="post">
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
								<input type="hidden" name="1" value="1"/>
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
	<div class="menuinfo" id="apDiv3"
		onmouseover="MM_showHideLayers('top','','show','top_menu','','show','apDiv3','','show')"
		onmouseout="MM_showHideLayers('top','','show','top_menu','','show','apDiv3','','hide')">
		<table width="100%" border="0" cellspacing="1" cellpadding="0">
			<tr>
				<td height="30" align="center" bgcolor="#DCDCDC"><strong><a
						href="information.jsp">个人信息</a></strong></td>
			</tr>
			<tr>
				<td height="30" align="center" bgcolor="#DCDCDC"><strong><a
						href="class_imformation.jsp">班级信息</a></strong></td>
			</tr>
		</table>
	</div>
</body>
</html>
