<%@page import="java.util.Arrays"%>
<%@page import="model.Semester"%>
<%@page import="model.Credit"%>
<%@page import="model.CourseType"%>
<%@page import="model.PickCourse"%>
<%@ page import="model.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>选课</title>
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

<%
	Student user = (Student) session.getAttribute("login_user");
%>

<body>
	<!--顶层设计，固定层-->
	<div id="top">
		<div class="userinfo">
			<strong><%=user.getName()%> <%=user.getNumber()%></strong> <a
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
	<p>当前位置----选课</p>
	<table width="443" border="0">
		<tr>
			<th width="150" bgcolor="#D5E4AB" scope="col"><a
				href="pickcourse.jsp">已选课程</a></th>

			<%
				//动态生成选不同类型课的超链接
				for (CourseType ct : CourseType.getCourseTypeList()) {
					if (!ct.isPickCourse()) {
						continue;
					}
			%>

			<th width="150" bgcolor="#D5E4AB" scope="col"><a
				href="../pickcourse?coursetype=<%=ct.getNumber()%>"><%=ct.getName()%></a></th>
			<%
				}
			%>
		</tr>
	</table>
	<%
		Semester semester = Semester.getThisSemester();
	%>
	<table width="57%" height="50" border="0">
		<tr>
			<th align="left" scope="col"><p class="字体细">
					学号:<%=user.getNumber()%> 姓名:<%=user.getName()%> 学院:<%=user.getTheClass().getProfession().getCollege().getName()%> 行政班:<%=user.getTheClass().getName()%>
					<span class="字体细" id="xnxq"><strong><%=semester.getStartYear()%>-<%=semester.getOverYear()%></strong>学年
						第<strong><%=semester.getSemester()%></strong></span><span class="字体细">学期
						选课<span id="Label_Nj"><br>年级：<%=user.getTheClass().getYear()%></span>
					</span> <span class="字体细"> <span id="xsxxmc">已选课程：</span></span>
				</p></th>
		</tr>
	</table>
	<table width="100%" height="282" border="0">
		<tr>
			<th height="278" align="left" valign="top" scope="col"><table
					width="100%" height="262" border="0">
					<tr>
						<th width="9%" bgcolor="#CDE199" scope="col">课程代码</th>
						<th width="21%" bgcolor="#CDE199" scope="col">课程名称</th>
						<th width="12%" bgcolor="#CDE199" scope="col">课程性质</th>
						<th width="7%" bgcolor="#CDE199" scope="col">学分</th>
						<th width="6%" bgcolor="#CDE199" scope="col">周学时</th>
						<th width="16%" bgcolor="#CDE199" scope="col">课程介绍</th>
						<th width="5%" bgcolor="#CDE199" scope="col">选否</th>
						<th width="11%" bgcolor="#CDE199" scope="col">余量</th>
						<th width="13%" bgcolor="#CDE199" scope="col"></th>
					</tr>
					<%
						//仅显示当前学期的选课
						for (int i = 0, j = 0; j < user.getPickCourseList().size(); j++) {
							PickCourse p = user.getPickCourseList().get(j);
							if (!p.getTeach().getSemester().equals(semester)) {
								continue;
							}
							if (i % 2 == 0) {
					%>
					<tr>
						<td height="25" bgcolor="#CDE199"><%=p.getTeach().getNumber()%></td>
						<td bgcolor="#CDE199"><%=p.getTeach().getCourse().getName()%></td>
						<td bgcolor="#CDE199"><%=p.getTeach().getCourse().getCourseType().getName()%></td>
						<td bgcolor="#CDE199"><%=p.getTeach().getCredit()%></td>
						<td bgcolor="#CDE199">&nbsp;</td>
						<td bgcolor="#CDE199">&nbsp;</td>
						<td bgcolor="#CDE199">&nbsp;</td>
						<td bgcolor="#CDE199"><%=p.getTeach().getCapacity() - p.getTeach().getChoose()%>
						</td>
						<td bgcolor="#CDE199"><a
							href="../cancelpickcourse.do?number=<%=p.getNumber()%>">退选</a></td>
					</tr>
					<%
						i++;
							} else {
					%>
					<tr>
						<td height="25"><%=p.getTeach().getNumber()%></td>
						<td><%=p.getTeach().getCourse().getName()%></td>
						<td><%=p.getTeach().getCourse().getCourseType().getName()%></td>
						<td><%=p.getTeach().getCredit()%></td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td><%=p.getTeach().getCapacity() - p.getTeach().getChoose()%></td>
						<td><a
							href="../cancelpickcourse.do?number=<%=p.getNumber()%>">退选</a></td>
					</tr>
					<%
						i++;
							}
						}
					%>
				</table></th>
		</tr>
	</table>
	<%
		int[] count = new int[4];
	%>
	<table width="100%" height="225" border="0">
		<tr>
			<td width="254" align="center" bgcolor="#DFEABF">课程性质</td>
			<td width="237" align="center" bgcolor="#DFEABF">学分要求</td>
			<td width="193" align="center" bgcolor="#DFEABF">获得学分</td>
			<td width="193" align="center" bgcolor="#DFEABF">在修学分</td>
			<td width="193" align="center" bgcolor="#DFEABF">缺学分</td>
		</tr>
		<%
			Arrays.fill(count, 0);
			for (CourseType ct : CourseType.getCourseTypeList()) {
		%>
		<tr>
			<td bgcolor="#DFEABF"><%=ct.getName()%></td>
			<td bgcolor="#DFEABF">
				<%
					int creditNeed = Credit.searchCredit(user.getTheClass().getProfession(), ct).getCredit();
						count[0] += creditNeed;
						out.print(creditNeed);
				%>
			</td>
			<td bgcolor="#DFEABF">
				<%
					int creditSum = 0;
						int creditSumIng = 0;
						for (PickCourse pc : user.getPickCourseList()) {
							if (pc.getTeach().getCourse().getCourseType().equals(ct)) {
								if (pc.getTeach().isSocreConfirm()) {
									creditSum += pc.getTeach().getCredit();
								} else {
									creditSumIng += pc.getTeach().getCredit();
								}
							}
						}
						count[1] += creditSum;
						count[2] += creditSumIng;
						count[3] += creditNeed - creditSum;
						out.print(creditSum);
				%>
			</td>

			<td bgcolor="#DFEABF"><%=creditSumIng%></td>
			<td bgcolor="#DFEABF"><%=creditNeed - creditSum%></td>
		</tr>
		<%
			}
		%>
		<tr>
			<td bgcolor="#DFEABF">合计：</td>
			<%
				for (int i : count) {
			%>
			<td bgcolor="#DFEABF"><%=i%></td>
			<%
				}
			%>
		</tr>
	</table>
	<p>注:缺学分合计不包含超过学分要求多修的学分。</p>
	<table width="100%" border="0">
		<tr>
			<td width="20%" align="center" bgcolor="#CDE199">本学期修读信息</td>
			<td width="20%" align="center" bgcolor="#CDE199">当前学期最低学分</td>
			<td width="20%" align="center" bgcolor="#CDE199">当前学期最高限额学分</td>
			<td width="20%" align="center" bgcolor="#CDE199">当前学期辅修选定学分</td>
			<td width="20%" align="center" bgcolor="#CDE199">当前学期主修选定学分</td>
		</tr>
		<tr>
			<td bgcolor="#CDE199">&nbsp;</td>
			<td bgcolor="#CDE199">&nbsp;</td>
			<td bgcolor="#CDE199">&nbsp;</td>
			<td bgcolor="#CDE199">&nbsp;</td>
			<td bgcolor="#CDE199">&nbsp;</td>
		</tr>
	</table>
	<table width="100%" border="0">
		<tr>
			<td>&nbsp;</td>
		</tr>
	</table>
	<table width="100%" height="39" border="0">
		<tr>
			<td width="46%">&nbsp;</td>
			<td width="9%">&nbsp;</td>
			<td width="9%">&nbsp;</td>
			<td width="9%">&nbsp;</td>
			<td width="9%" align="center"><input type="submit" name="button"
				id="button" value="本专业选课" /></td>
			<td width="9%" align="center"><input type="submit"
				name="button2" id="button2" value="查看课表" /></td>
			<td width="9%">&nbsp;</td>
		</tr>
	</table>
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
