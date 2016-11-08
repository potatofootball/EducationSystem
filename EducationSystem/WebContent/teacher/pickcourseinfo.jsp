<%@page import="model.Teach"%>
<%@page import="model.Teacher"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>选课情况</title>
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
<%
	Teacher user = (Teacher) session.getAttribute("login_user");
%>
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
		<p>课程总计</p>
		<table width="101%" height="199" border="0">
			<tr>
				<th width="5%" bgcolor="#DCDCDC" scope="col">编号</th>
				<th width="10%" bgcolor="#DCDCDC" scope="col">任课教师</th>
				<th width="10%" bgcolor="#DCDCDC" scope="col">课程代码</th>
				<th width="10%" bgcolor="#DCDCDC" scope="col">课程名称</th>
				<th width="10%" bgcolor="#DCDCDC" scope="col">课程性质</th>
				<th width="10%" bgcolor="#DCDCDC" scope="col">学分</th>
				<th width="10%" bgcolor="#DCDCDC" scope="col">学周时</th>
				<th width="10%" bgcolor="#DCDCDC" scope="col">选量</th>
				<th width="10%" bgcolor="#DCDCDC" scope="col">余量</th>
				<th width="10%" bgcolor="#DCDCDC" scope="col">退选</th>
			</tr>
			<%
				int i = 0;
				for (Teach teach : user.getTeachList()) {
			%>
			<tr <%=(i % 2 == 0) ? "" : "bgcolor=\"#DCDCDC\""%>>
				<td><%=teach.getNumber()%></td>
				<td><%=teach.getTeacher().getName()%></td>
				<td><%=teach.getCourse().getNumber()%></td>
				<td><%=teach.getCourse().getName()%></td>
				<td><%=teach.getCourse().getCourseType().getName()%></td>
				<td><%=teach.getCredit()%></td>
				<td>&nbsp;</td>
				<td><%=teach.getChoose()%></td>
				<td><%=teach.getCapacity() - teach.getChoose()%></td>
				<td>&nbsp;</td>
			</tr>
			<%
				}
			%>
		</table>
		<table width="101%" height="142" border="0">
			<tr>
				<th height="138" align="center" valign="middle" scope="col"><table
						width="50%" height="83" border="0" class="边框color">
						<tr>
							<td width="49%" align="center" bgcolor="#DCDCDC">已选学生人数：</td>
							<td width="51%" align="center" valign="middle" bgcolor="#D6D6D6">0</td>
						</tr>
						<tr>
							<td align="center" bgcolor="#D6D6D6">未选学生人数：</td>
							<td align="center" valign="middle" bgcolor="#D6D6D6">0</td>
						</tr>
					</table></th>
			</tr>
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
