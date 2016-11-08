<%@page import="java.util.HashMap"%>
<%@page import="model.Semester"%>
<%@page import="java.util.Map"%>
<%@page import="tool.TimeTableFormat"%>
<%@page import="model.Teach"%>
<%@page import="java.util.List"%>
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
		<p>&nbsp;</p>
		<div id="main_table">
			<table width="1068" border="0" cellspacing="1" cellpadding="0">
				<%
					List<Teach> teachList = user.getTeachList();
					Map<Integer, Map<Integer, Map<Integer, List<Teach>>>> map = new HashMap<Integer, Map<Integer, Map<Integer, List<Teach>>>>();
					if (teachList != null && teachList.size() > 0) {
						List<Teach> teachList1 = user.getTeachList();
						// 						for (int i = 0; i < teachList1.size(); i++) {
						// 							if (!teachList1.get(i).getSemester().equals(Semester.getThisSemester())) {
						// 								teachList.remove(teachList1.get(i));
						// 							}
						// 						}
						teachList1 = null;
						map = TimeTableFormat.formatTeach(teachList);
					}
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
														for (Teach p : map.get(i).get(j).get(high)) {
															sb.append("<a href=\"changeclass2.jsp?id=").append(p.getNumber()).append("\">");
															sb.append(p.getCourse().getName() + "<br>");
															sb.append(p.getTeacher().getName() + "<br>");
															sb.append(p.getClassroom().getFullName() + "<br>");
															sb.append(p.getClassTime().getName() + "<hr>");
															sb.append("</a>");
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
														for (Teach p : map.get(i).get(j).get(high)) {
															sb.append("<a href=\"changeclass2.jsp?id=").append(p.getNumber()).append("\">");
															sb.append(p.getCourse().getName() + "<br>");
															sb.append(p.getTeacher().getName() + "<br>");
															sb.append(p.getClassroom().getFullName() + "<br>");
															sb.append(p.getClassTime().getName() + "<hr>");
															sb.append("</a>");
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
														for (Teach p : map.get(i).get(j).get(high)) {
															sb.append("<a href=\"changeclass2.jsp?id=").append(p.getNumber()).append("\">");
															sb.append(p.getCourse().getName() + "<br>");
															sb.append(p.getTeacher().getName() + "<br>");
															sb.append(p.getClassroom().getFullName() + "<br>");
															sb.append(p.getClassTime().getName() + "<hr>");
															sb.append("</a>");
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
					</td>
				</tr>
			</table>
		</div>
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