<%@page import="model.PickCourse"%>
<%@page import="java.util.List"%>
<%@page import="model.Student"%>
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
<title>按分类查看</title>
<link href="../css/jw_css.css" rel="stylesheet" type="text/css" />
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
	<p>&nbsp;</p>

	</div>
	<p>当前位置----学生成绩查询</p>
	<table width="69%" height="110" border="1" class="biankuang">
		<tr>
			<form action="../SearchScoreByTeacher.do" method="get">
				<th height="104" align="left" valign="top" scope="col"><p>
						学生姓名 <label for="textfield"></label> <input name="textfield"
							type="text" class="biankuang" id="textfield" /> 学生学号 <label
							for="textfield2"></label> <input name="studentId" type="text"
							class="biankuang" id="textfield2" /> 学院 <input name="textfield3"
							type="text" class="biankuang" id="textfield3" />
					</p>
					<p>&nbsp;</p>
					<p>
						专业 <input name="textfield4" type="text" class="biankuang"
							id="textfield5" value="" /> 班级 <input name="textfield5"
							type="text" class="biankuang" id="textfield4" value="" />
					</p>
					<p>
						<label for="textfield4"></label>
					</p>
					<table width="100%" border="0" align="left">
						<tr>
							<td align="center"><input name="button" type="submit"
								class="biankuang" id="button" value="提交" /></td>
						</tr>
					</table></th>
			</form>
		</tr>
	</table>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<%
		Student student = (Student) session.getAttribute("student");
		List<PickCourse> pcl = (List<PickCourse>) session.getAttribute("pickCourseList");
	%>
	<table width="69%" border="0">
		<tr>
			<td width="15%" height="14"><strong>学号：<%=(student == null) ? "" : student.getNumber()%></strong></td>
			<td width="21%"><strong>姓名：<%=(student == null) ? "" : student.getName()%></strong></td>
			<td width="21%"><strong>学院：<%=(student == null) ? "" : student.getTheClass().getProfession().getCollege().getName()%></strong></td>
			<td width="19%"><strong> 专业：<%=(student == null) ? "" : student.getTheClass().getProfession().getName()%></strong></td>
			<td width="24%"><strong> 班级 : <%=(student == null) ? "" : student.getTheClass().getName()%></strong></td>
		</tr>
	</table>
	<tr>
		<td height="34"><p>
				<span id="Label1">学年：</span> <select name="ddlXN" id="ddlXN">
					   
					<option value="2015-2016">2015-2016</option>
					<option value="2014-2015">2014-2015</option>
					<option value="2013-2014">2013-2014</option>
				</select>  <span id="Label2">学期：</span> <select name="ddlXQ" id="ddlXQ">
					   
					<option value="2">2</option>
					<option value="1">1</option>
				</select>    <a href="学生成绩查询xjj.html"> <input type=button
					onclick="window.location.href('学生成绩查询xjj.html')" name="Button1"
					value="按学期查询" id="Button1" /></a> <a href="学生成绩查询xjj.html">  <input
					type=button onclick="window.location.href('学生成绩查询xjj.html')"
					name="Button5" value="按学年查询" id="Button5" /></a>  <a
					href="学生成绩查询xjj.html"> <input type=button
					onclick="window.location.href('学生成绩查询xjj.html')" name="Button2"
					value="在校学习成绩查询" id="Button2" /></a>  <a href="学生成绩查询xjj.html"> <input
					type=button onclick="window.location.href('学生成绩查询xjj.html')"
					name="Button6" value="主修专业最高成绩查询" id="Button6" /></a>  
			</p>
			<div class="word">
				<p>【学年第学期学生成绩】获得学分：；修读学分：；重修学分：学生绩点：</p>
			</div></td>
	</tr>


	<p>&nbsp;</p>
	<table width="101%" height="296" border="0">
		<tr>
			<td width="5%" bgcolor="#CCCCCC"><a href="成绩查询.html">学年</a></td>
			<td width="7%" bgcolor="#CCCCCC"><a href="成绩查询.html">学期</a></td>
			<td width="12%" bgcolor="#CCCCCC"><a href="成绩查询.html">课程代码</a></td>
			<td width="6%" bgcolor="#CCCCCC"><a href="成绩查询.html">课程名称</a></td>
			<td width="8%" bgcolor="#CCCCCC"><a href="成绩查询.html">原始课程性质</a></td>
			<td width="8%" bgcolor="#CCCCCC"><a href="成绩查询.html">互认课程性质</a></td>
			<td width="6%" bgcolor="#CCCCCC"><a href="成绩查询.html">课程归属</a></td>
			<td width="6%" bgcolor="#CCCCCC"><a href="成绩查询.html">学分</a></td>
			<td width="6%" bgcolor="#CCCCCC"><a href="成绩查询.html">绩点</a></td>
			<td width="6%" bgcolor="#CCCCCC"><a href="成绩查询.html">成绩</a></td>
			<td width="6%" bgcolor="#CCCCCC"><a href="成绩查询.html">辅修</a></td>
			<td width="6%" bgcolor="#CCCCCC"><a href="成绩查询.html">补考成绩</a></td>
			<td width="6%" bgcolor="#CCCCCC"><a href="成绩查询.html">开课单位</a></td>
			<td width="6%" bgcolor="#CCCCCC"><a href="成绩查询.html">备注</a></td>
			<td width="6%" bgcolor="#CCCCCC"><a href="成绩查询.html">重修</a></td>
		</tr>
		<%
			if (pcl != null) {
				int i = 1;
				for (PickCourse pc : pcl) {
		%>
		<tr <%=(i % 2 == 0) ? "bgcolor=\"#CCCCCC\"" : ""%>>
			<td><%=pc.getTeach().getSemester().getStartYear()%></td>
			<td><%=pc.getTeach().getSemester().getSemester()%></td>
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
			i++;
				}
			} else {
				for (int i = 0; i <= 11; i++) {
					out.println((i % 2 == 0) ? "<tr>" : "<tr bgcolor=\"#CCCCCC\">");
					for (int j = 0; j <= 15; j++) {
						out.println("<td>&nbsp;</td>");
					}
					out.println("</tr>");
				}
			}
		%>
	</table>
	<%
		session.removeAttribute("student");
		session.removeAttribute("pickCourseList");
	%>
	<table width="100%" height="142" border="0">
		<tr>
			<th height="138" align="center" valign="middle" scope="col"><table
					width="50%" height="83" border="0" class="边框color">
					<tr>
						<td width="49%" align="center" bgcolor="#DCDCDC">平均分：</td>
						<td width="51%" align="center" valign="middle" bgcolor="#D6D6D6">&nbsp;</td>
					</tr>
					<tr>
						<td align="center" bgcolor="#D6D6D6">绩点：</td>
						<td align="center" valign="middle" bgcolor="#D6D6D6">&nbsp;</td>
					</tr>
					<tr>
						<td align="center" bgcolor="#D6D6D6">重修课程数：</td>
						<td align="center" valign="middle" bgcolor="#D6D6D6">&nbsp;</td>
					</tr>
				</table></th>
		</tr>
	</table>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	</th>
	</tr>
	</table>
</body>
</html>
