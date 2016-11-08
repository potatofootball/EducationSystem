<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Student"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教务系统首页</title>
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
						onfocus="MM_showHideLayers('top','','show','top_menu','','show','apDiv3','','show')">
						<strong>信息</strong>
					</td>
					<td bgcolor="#D0E3A1">&nbsp;</td>
					<td bgcolor="#D0E3A1">&nbsp;</td>
					<td bgcolor="#D0E3A1">&nbsp;</td>
				</tr>
			</table>
		</div>
	</div>
	<div id="main">
		<div id="Vidown_extension_alhnopeoagjmjfgcbnokcnagkecgdcdh"
			style="display: none;"></div>
		<table width="100%" height="354" border="0">
			<tr>
				<td height="350" align="left" valign="middle">
					<table width="100%" height="298" border="0">
						<tr>
							<td width="50%" align="left" valign="top"><table
									width="100%" height="200" border="0">
									<tr>
										<td width="49%" bgcolor="#D0E3A1">毕业生--公布标题</td>
										<td width="16%" align="center" bgcolor="#D0E3A1">发布单位</td>
										<td width="16%" align="center" bgcolor="#D0E3A1">发布时间</td>
										<td width="19%" align="center" bgcolor="#D0E3A1">有效期限</td>
									</tr>
									<tr>
										<td align="left">延期学习毕业生回校修读课程办理流程</td>
										<td align="center">教学部教务办</td>
										<td align="center">2012-12-06</td>
										<td align="center">2041-12-31</td>
									</tr>
									<tr>
										<td height="36" align="left" bgcolor="#D0E3A1">毕(结)业生申请补(换)发毕业(学位)证书流程</td>
										<td align="center" bgcolor="#D0E3A1">教务处</td>
										<td align="center" bgcolor="#D0E3A1">2009-09-15</td>
										<td align="center" bgcolor="#D0E3A1">2099-09-01</td>
									</tr>
									<tr>
										<td align="left">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
									</tr>
									<tr>
										<td align="left" bgcolor="#D0E3A1">&nbsp;</td>
										<td align="center" bgcolor="#D0E3A1">&nbsp;</td>
										<td align="center" bgcolor="#D0E3A1">&nbsp;</td>
										<td align="center" bgcolor="#D0E3A1">&nbsp;</td>
									</tr>
									<tr>
										<td height="26" align="left">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
									</tr>
									<tr>
										<td height="26" align="left" bgcolor="#D0E3A1">&nbsp;</td>
										<td align="center" bgcolor="#D0E3A1">&nbsp;</td>
										<td align="center" bgcolor="#D0E3A1">&nbsp;</td>
										<td align="center" bgcolor="#D0E3A1">&nbsp;</td>
									</tr>
								</table></td>
							<td width="50%" valign="top"><table width="100%"
									height="200" border="0">
									<tr>
										<td bgcolor="#D0E3A1">相关新闻--公布标题</td>
										<td align="center" bgcolor="#D0E3A1">发布单位</td>
										<td align="center" bgcolor="#D0E3A1">发布时间</td>
										<td align="center" bgcolor="#D0E3A1">有效期限</td>
									</tr>
									<tr>
										<td align="left">教务管理辅助系统登录网址说明</td>
										<td align="center">教务处</td>
										<td align="center">2010-03-09</td>
										<td align="center">2038-03-31</td>
									</tr>
									<tr>
										<td align="left" bgcolor="#D0E3A1">北师大珠海分校学生缴费注册暂行办法</td>
										<td align="center" bgcolor="#D0E3A1">北师大珠海分校办公室</td>
										<td align="center" bgcolor="#D0E3A1">2008-07-02</td>
										<td align="center" bgcolor="#D0E3A1">2020-07-01</td>
									</tr>
									<tr>
										<td align="left">学生成绩管理暂行规定</td>
										<td align="center">教务处</td>
										<td align="center">2008-07-01</td>
										<td align="center">2020-07-01</td>
									</tr>
									<tr>
										<td align="left" bgcolor="#D0E3A1">&nbsp;</td>
										<td align="center" bgcolor="#D0E3A1">&nbsp;</td>
										<td align="center" bgcolor="#D0E3A1">&nbsp;</td>
										<td align="center" bgcolor="#D0E3A1">&nbsp;</td>
									</tr>
									<tr>
										<td align="left">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
									</tr>
									<tr>
										<td align="left" bgcolor="#D0E3A1">&nbsp;</td>
										<td align="center" bgcolor="#D0E3A1">&nbsp;</td>
										<td align="center" bgcolor="#D0E3A1">&nbsp;</td>
										<td align="center" bgcolor="#D0E3A1">&nbsp;</td>
									</tr>
								</table></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
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
