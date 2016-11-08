<%@page import="model.Teacher"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	height: 95px;
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
										<td width="49%" bgcolor="#CCCCCC">毕业生--公布标题</td>
										<td width="16%" align="center" bgcolor="#CCCCCC">发布单位</td>
										<td width="16%" align="center" bgcolor="#CCCCCC">发布时间</td>
										<td width="19%" align="center" bgcolor="#CCCCCC">有效期限</td>
									</tr>
									<tr>
										<td align="left"><a
											href="http://es.bnuz.edu.cn/content.aspx#"
											onclick="window.open('ggsm.aspx?fbsj=2012-12-06 16:32:01&yxqx=2041-12-31&xh=146','gxlb','menubar=0,scrollbars=1,resizable=1,width=900,height=700,left=100,top=0')">延期学习毕业生回校修读课程办理流程</a></td>
										<td align="center">教学部教务办</td>
										<td align="center">2012-12-06</td>
										<td align="center">2041-12-31</td>
									</tr>
									<tr>
										<td height="36" align="left" bgcolor="#CCCCCC"><a
											href="http://es.bnuz.edu.cn/content.aspx#"
											onclick="window.open('ggsm.aspx?fbsj=2009-09-15 16:16:13&yxqx=2099-09-01&xh=73','gxlb','menubar=0,scrollbars=1,resizable=1,width=900,height=700,left=100,top=0')">毕(结)业生申请补(换)发毕业(学位)证书流程</a></td>
										<td align="center" bgcolor="#CCCCCC">教务处</td>
										<td align="center" bgcolor="#CCCCCC">2009-09-15</td>
										<td align="center" bgcolor="#CCCCCC">2099-09-01</td>
									</tr>
									<tr>
										<td align="left">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
									</tr>
									<tr>
										<td align="left" bgcolor="#CCCCCC">&nbsp;</td>
										<td align="center" bgcolor="#CCCCCC">&nbsp;</td>
										<td align="center" bgcolor="#CCCCCC">&nbsp;</td>
										<td align="center" bgcolor="#CCCCCC">&nbsp;</td>
									</tr>
									<tr>
										<td height="26" align="left">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
									</tr>
									<tr>
										<td height="26" align="left" bgcolor="#CCCCCC">&nbsp;</td>
										<td align="center" bgcolor="#CCCCCC">&nbsp;</td>
										<td align="center" bgcolor="#CCCCCC">&nbsp;</td>
										<td align="center" bgcolor="#CCCCCC">&nbsp;</td>
									</tr>
								</table></td>
							<td width="50%" valign="top"><table width="100%"
									height="200" border="0">
									<tr>
										<td bgcolor="#CCCCCC">相关新闻--公布标题</td>
										<td align="center" bgcolor="#CCCCCC">发布单位</td>
										<td align="center" bgcolor="#CCCCCC">发布时间</td>
										<td align="center" bgcolor="#CCCCCC">有效期限</td>
									</tr>
									<tr>
										<td align="left"><a
											href="http://es.bnuz.edu.cn/content.aspx#"
											onclick="window.open('ggsm.aspx?fbsj=2010-03-09 10:58:14&yxqx=2038-03-31&xh=92','gxlb','menubar=0,scrollbars=1,resizable=1,width=900,height=700,left=100,top=0')">教务管理辅助系统登录网址说明</a></td>
										<td align="center">教务处</td>
										<td align="center">2010-03-09</td>
										<td align="center">2038-03-31</td>
									</tr>
									<tr>
										<td align="left" bgcolor="#CCCCCC"><a
											href="http://es.bnuz.edu.cn/content.aspx#"
											onclick="window.open('ggsm.aspx?fbsj=2008-07-02 08:12:00&yxqx=2020-07-01&xh=40','gxlb','menubar=0,scrollbars=1,resizable=1,width=900,height=700,left=100,top=0')">北师大珠海分校学生缴费注册暂行办法</a></td>
										<td align="center" bgcolor="#CCCCCC">北师大珠海分校办公室</td>
										<td align="center" bgcolor="#CCCCCC">2008-07-02</td>
										<td align="center" bgcolor="#CCCCCC">2020-07-01</td>
									</tr>
									<tr>
										<td align="left"><a
											href="http://es.bnuz.edu.cn/content.aspx#"
											onclick="window.open('ggsm.aspx?fbsj=2008-07-01 16:35:42&yxqx=2020-07-01&xh=39','gxlb','menubar=0,scrollbars=1,resizable=1,width=900,height=700,left=100,top=0')">学生成绩管理暂行规定</a></td>
										<td align="center">教务处</td>
										<td align="center">2008-07-01</td>
										<td align="center">2020-07-01</td>
									</tr>
									<tr>
										<td align="left" bgcolor="#CCCCCC">&nbsp;</td>
										<td align="center" bgcolor="#CCCCCC">&nbsp;</td>
										<td align="center" bgcolor="#CCCCCC">&nbsp;</td>
										<td align="center" bgcolor="#CCCCCC">&nbsp;</td>
									</tr>
									<tr>
										<td align="left">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
									</tr>
									<tr>
										<td align="left" bgcolor="#CCCCCC">&nbsp;</td>
										<td align="center" bgcolor="#CCCCCC">&nbsp;</td>
										<td align="center" bgcolor="#CCCCCC">&nbsp;</td>
										<td align="center" bgcolor="#CCCCCC">&nbsp;</td>
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
