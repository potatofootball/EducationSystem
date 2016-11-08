<%@page import="model.ClassTime"%>
<%@page import="model.Teach"%>
<%@page import="model.Teacher"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>调课页面</title>
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
		<%
			String id = request.getParameter("id");
			Teach teach = Teach.searchTeach(Integer.parseInt(id));
			ClassTime ct = teach.getClassTime();
			int[] s = ct.getTimeList().get(0);
		%>
		<table>
			<form action="../createadjustclass.do" method="get">
				<input type="hidden" name="id" value="<%=id%>" />
				<thead>调课申请表
				</thead>
				<tr>
					<th>原时间</th>
				</tr>
				<tr>
					<td>起始周</td>
					<td><%=s[0]%></td>
					<td>结束周</td>
					<td><%=s[1]%></td>
					<td>单双周</td>
					<td><%=s[2]%></td>
					<td>周几</td>
					<td><%=s[3]%></td>
					<td>起始节</td>
					<td><%=s[4]%></td>
					<td>结束节</td>
					<td><%=s[5]%></td>
				</tr>
				<tr>
					<th>调整时间</th>
				</tr>
				<tr>
					<td>起始周</td>
					<td><select name="start1">
							<%
								for (int i = 1; i < 19; i++) {
									out.println("<option value=\"" + i + "\">" + i + "</option>");
								}
							%>
					</select></td>
					<td>结束周</td>
					<td><select name="over1">
							<%
								for (int i = 2; i < 19; i++) {
									out.println("<option value=\"" + i + "\">" + i + "</option>");
								}
							%>
					</select></td>
					<td>单双周</td>
					<td><select name="week1">
							<option value="0">单双周</option>
							<option value="1">单周</option>
							<option value="2">双周</option>
					</select></td>
					<td>周几</td>
					<td><select name="week2">
							<%
								for (int i = 1; i < 8; i++) {
									out.println("<option value=\"" + i + "\">" + i + "</option>");
								}
							%>
					</select></td>
					<td>起始节</td>
					<td><select name="start2">
							<%
								for (int i = 1; i < 14; i++) {
									out.println("<option value=\"" + i + "\">" + i + "</option>");
								}
							%>
					</select></td>
					<td>结束节</td>
					<td><select name="over2">
							<%
								for (int i = 2; i < 14; i++) {
									out.println("<option value=\"" + i + "\">" + i + "</option>");
								}
							%>
					</select></td>
				</tr>
				<tr>
					<td>申请原因</td>
					<td colspan="10" rowspan="3"><input type="text" name="msg"
						size="100" /></td>
				</tr>
				<tr>
					<td><input type="submit" value="提交" /></td>
				</tr>
			</form>
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