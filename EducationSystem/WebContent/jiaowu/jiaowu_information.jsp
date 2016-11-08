<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.Teacher"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
	Teacher teacher = (Teacher) session.getAttribute("login_user");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>教务系统首页</title>
<link href="../css/xinxi.css" rel="stylesheet" type="text/css" />
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
										<td width="195"><%=teacher.getNumber()%></td>
										<td width="179">姓名</td>
										<td colspan="2"><span id="lbl_xszh"><%=teacher.getName()%></span><span
											id="lbl_TELLX"></span></td>
										<td width="221" rowspan="6"><img id="xszp"
											src="http://es.bnuz.edu.cn/readimagexs.aspx?xh=1302020077"
											alt="照片" align="absmiddle" /><br /> <span id="Label5">建议文件大小：9-18K，<br />
												分辨率：96*128，<br /> 文件类型：jpg、jpeg
										</span></td>
									</tr>
									<tr>
										<td>性别</td>
										<td><%=teacher.getGender()%></td>
										<td>&nbsp;</td>
										<td colspan="2"><span id="lbl_pyfx"> </span><span
											id="lbl_TELNUMBER"> </span></td>
									</tr>
									<tr>
										<td>出生日期</td>
										<td><p>
												<span id="lbl_zym"> <%=sdf.format(teacher.getBirthday())%>
												</span>
											</p></td>
										<td>&nbsp;</td>
										<td colspan="2"><span id="lbl_jtyb"> </span></td>
									</tr>
									<tr>
										<td>学院</td>
										<td><%=teacher.getCollege().getName()%></td>
										<td>系（所）</td>
										<td colspan="2"><span id="lbl_jtdh"><%=teacher.getProfession().getName()%></span></td>
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
										<td height="7">&nbsp;</td>
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
							</table>
							<div>
								<table width="100%" border="0" align="left" bgcolor="#CCCCCC">
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
								</table>
								</th>
					</tr>
				</table>
				</th>
				</tr>
				</table>
			</div>
		</div>
</body>
</html>
