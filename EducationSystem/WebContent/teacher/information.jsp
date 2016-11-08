<%@page import="model.Teacher"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人信息</title>
<link href="../css/xinxi.css" rel="stylesheet" type="text/css" />
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
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
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
					<td width="62" height="18" align="center" bgcolor="#DCDCDC"
						class="span"><a href="index.jsp"><strong>首页</strong></a></td>
					<td width="68" align="center" bgcolor="#DCDCDC" class="span"><a
						href="changeclass.jsp"><strong>调课</strong></a></td>
					<td width="65" align="center" bgcolor="#DCDCDC" class="span"><strong>请假</strong></td>
					<td width="72" align="center" bgcolor="#DCDCDC" class="span"
						onmouseover="MM_showHideLayers('top','','show','top_menu','','show','apDiv3','','show')"
						onfocus="MM_showHideLayers('top','','show','top_menu','','show','apDiv3','','show')"><strong>信息</strong></td>
					<td width="112" align="center" valign="middle" bgcolor="#DCDCDC"
						class="字体"><strong><a href="pickcourseinfo.jsp"
							class="span">选课情况</a></strong></td>
					<td width="621" bgcolor="#DCDCDC">&nbsp;</td>
					<td width="100" bgcolor="#DDDDDD">&nbsp;</td>
				</tr>
			</table>
		</div>
	</div>
	<div id="main">
		<div id="main_table1">
			<div id="main_table1">
				<table width="100%" border="0" class="color">
					<tr>
						<td><em>当前位置 -- <span id="dqwz">个人信息</span></em></td>
					</tr>
					<tr>
						<td><table width="100%" border="1" align="center"
								class="color">
								<tbody>
									<tr>
										<td width="128">职工号</td>
										<td width="195"><%=user.getNumber()%></td>
										<td width="179">姓名</td>
										<td colspan="2"><span id="lbl_xszh"> </span><span
											id="lbl_TELLX"><%=user.getName()%></span></td>
										<td width="221" rowspan="6"><img id="xszp"
											src="http://es.bnuz.edu.cn/readimagexs.aspx?xh=1302020077"
											alt="照片" align="absmiddle" /><br /> <span id="Label5">建议文件大小：9-18K，<br />
												分辨率：96*128，<br /> 文件类型：jpg、jpeg
										</span></td>
									</tr>
									<tr>
										<td>性别</td>
										<td><%=user.getGender()%></td>
										<td>&nbsp;</td>
										<td colspan="2"><span id="lbl_pyfx"> </span><span
											id="lbl_TELNUMBER"> </span></td>
									</tr>
									<tr>
										<td>出生日期</td>
										<td><p>
												<span id="lbl_zym"><%=sdf.format(user.getBirthday())%>
												</span>
											</p></td>
										<td></td>
										<td colspan="2"><span id="lbl_jtyb"> </span></td>
									</tr>
									<tr>
										<td>学院</td>
										<td><%=user.getCollege().getName()%></td>
										<td>系（所）</td>
										<td colspan="2"><span id="lbl_jtdh"><%=user.getProfession().getName()%></span></td>
									</tr>
									<tr>
										<td>电话</td>
										<td>&nbsp;</td>
										<td>毕业专业</td>
										<td colspan="2"><span id="lbl_fqxm"> </span></td>
									</tr>
									<tr>
										<td>毕业院校</td>
										<td>&nbsp;</td>
										<td>学位</td>
										<td colspan="2"><span id="lbl_ssh"> </span><span
											id="lbl_fqdw"> </span></td>
									</tr>
									<tr>
										<td>学历</td>
										<td><span id="lbl_jg"> </span></td>
										<td>&nbsp;</td>
										<td colspan="2"><span id="lbl_dzyxdz"> </span><span
											id="lbl_fqdwyb"> </span></td>
										<td></td>
									</tr>
									<tr>
										<td height="7">职称</td>
										<td height="7"><%=user.getTitle().getName()%></td>
										<td height="7">&nbsp;</td>
										<td height="7" colspan="2"><span id="lbl_mqxm"> </span></td>
										<td align="center" height="7"></td>
									</tr>
									<tr>
										<td>学科方向</td>
										<td>&nbsp;</td>
										<td>主讲教师资格证</td>
										<td colspan="2"><span id="lbl_yzbm"> </span><span
											id="lbl_mqdw"> </span></td>
										<td align="center"></td>
									</tr>
									<tr>
										<td>教师资格证</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td><span id="lbl_mqdwyb"> </span></td>
										<td align="center"> </td>
									</tr>
									<tr>
										<td>人事职工号</td>
										<td><span id="lbl_csd"> </span></td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td><span id="lbl_fqdwdh"> </span></td>
									</tr>
									<tr>
										<td>教学质量评价</td>
										<td colspan="5" height="80"><span id="lbl_jkzk"> </span><span
											id="lbl_mqdwdh"> </span></td>
									</tr>
									<tr>
										<td>教师简介</td>
										<td colspan="5" height="80"><span id="lbl_gatm"> </span><span
											id="lbl_jtdz"> </span></td>
									</tr>
									<tr id="T" border="2">
										<td colspan="6" height="100"><span id="t"> </span></td>
									</tr>
								</tbody>
							</table> <%
 	/*<table width="100%" border="0" align="left" bgcolor="#CCCCCC">
 									<tr>
 										<td align="right"><form id="form1" name="form1"
 												method="post" action="">
 												<div class="other">
 													<input name="提交" type="submit" class="height" id="提交"
 														value="提交" /> <input name="修改" type="submit"
 														class="height" id="修改" value="修改" />
 												</div>
 											</form></td>
 									</tr>
 								</table>*/
 %></td>
					</tr>
				</table>
			</div>
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
