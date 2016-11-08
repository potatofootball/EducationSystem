<%@page import="model.AdjustClass"%>
<%@page import="java.util.List"%>
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
<link href="../css/jw_css.css" rel="stylesheet" type="text/css" />
<link href="../css/jw_div.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#apDiv1 {
	position: absolute;
	width: 120px;
	height: 160px;
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
				<th height="40" scope="row"><a
					href="/EducationSystem/jiaowu/student_score.jsp">学生成绩查询</a></th>
			</tr>
			<tr>
				<th height="40" scope="row"><a
					href="/EducationSystem/jiaowu/student_imformation.jsp">学生信息</a></th>
			</tr>
			<tr>
				<th height="40" scope="row"><a
					href="/EducationSystem/jiaowu/jiaowu_information.jsp">教师信息</a></th>
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
	<div id="main">
		<table width="100%" border="0" cellspacing="1" cellpadding="0">
			<form action="../adjustclass.do" method="get">
				<%
					List<AdjustClass> acList = AdjustClass.getAdjustClassList();
					int i = 1;
					for (AdjustClass ac : acList) {
						if (!ac.isConfirm()) {
							String[] from = ac.getChangeFrom().split(",");
							String[] to = ac.getChangeTo().split(",");
				%>
			
			<tr>
				<th height="40" align="left" scope="row"><span class="span"><%=i%>、<%=ac.getTeach().getTeacher().getName()%>，<%=from[0]%>周
						- <%=from[1]%>周 <%=ac.getWeek(from[2])%> 周<%=from[3]%> <%=from[4]%>-<%=from[5]%>节
						调至<%=to[0]%>周 - <%=to[1]%>周 <%=ac.getWeek(to[2])%> 周<%=to[3]%> <%=to[4]%>-<%=to[5]%>节,原因：<%=ac.getMessage()%></span>
					<div class="main_select">
						<input type="radio" name="<%=ac.getNumber()%>" id="checkbox"
							value="true" checked="checked" /> <label for="checkbox"></label>
						同意 <input type="radio" name="<%=ac.getNumber()%>" id="checkbox2"
							value="false" /> <label for="checkbox2"></label> 不同意
					</div></th>
			</tr>
			<%
				i++;
					}
				}
			%>
			<tr>
				<th height="40" align="left" scope="row">
					<div id="main_button" align="center">
						<input type="submit" class="span" value="提交" />
					</div>
				</th>
			</tr>
			</form>
		</table>
	</div>
	<p>&nbsp;</p>

</body>
</html>
