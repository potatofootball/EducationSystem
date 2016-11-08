<%@page import="model.Student"%>
<%@page import="model.Teacher"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
	Teacher teacher = (Teacher) session.getAttribute("login_user");
	Student student = Student.searchStudent(Integer.parseInt(request.getParameter("id")));
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>教务系统首页</title>
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
<body>
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
									<td width="128">学号：</td>
									<td width="195"><%=student.getNumber()%></td>
									<td width="179"><span id="Label1">学生证号：</span></td>
									<td colspan="2"><span id="lbl_xszh"> </span></td>
									<td width="124">手机类型：</td>
									<td width="165"><span id="lbl_TELLX"></span></td>
									<td width="221" rowspan="6"><img id="xszp"
										src="http://es.bnuz.edu.cn/readimagexs.aspx?xh=1302020077"
										alt="照片" align="absmiddle" /><br /> <span id="Label5">建议文件大小：9-18K，<br />
											分辨率：96*128，<br /> 文件类型：jpg、jpeg
									</span></td>
								</tr>
								<tr>
									<td>姓名：</td>
									<td><%=student.getName()%></td>
									<td>培养方向：</td>
									<td colspan="2"><span id="lbl_pyfx"> </span></td>
									<td>手机号码：</td>
									<td width="165"><span id="lbl_TELNUMBER"> </span></td>
								</tr>
								<tr>
									<td>曾用名：</td>
									<td><p>
											<span id="lbl_zym"> </span>
										</p></td>
									<td>专业方向：</td>
									<td colspan="2"><%=student.getTheClass().getProfession().getName()%></td>
									<td>家庭邮编：</td>
									<td width="165"><span id="lbl_jtyb"> </span></td>
								</tr>
								<tr>
									<td>性别：</td>
									<td><%=student.getGender()%></td>
									<td>入学日期：</td>
									<td colspan="2">&nbsp;</td>
									<td>家庭电话：</td>
									<td width="165"><span id="lbl_jtdh"> </span></td>
								</tr>
								<tr>
									<td>出生日期：</td>
									<td>&nbsp;</td>
									<td>毕业中学：</td>
									<td colspan="2">&nbsp;</td>
									<td>父亲姓名：</td>
									<td width="165"><span id="lbl_fqxm"> </span></td>
								</tr>
								<tr>
									<td>民族：</td>
									<td>&nbsp;</td>
									<td>宿舍号：</td>
									<td colspan="2"><span id="lbl_ssh"> </span></td>
									<td>父亲单位：</td>
									<td width="165"><span id="lbl_fqdw"> </span></td>
								</tr>
								<tr>
									<td>籍贯：</td>
									<td><span id="lbl_jg"> </span></td>
									<td>电子邮箱：</td>
									<td colspan="2"><span id="lbl_dzyxdz"> </span></td>
									<td>父亲单位邮编：</td>
									<td width="165"><span id="lbl_fqdwyb"> </span></td>
									<td></td>
								</tr>
								<tr>
									<td height="7">政治面貌：</td>
									<td height="7">&nbsp;</td>
									<td height="7">联系电话：</td>
									<td colspan="2" height="7">&nbsp;</td>
									<td height="7">母亲姓名：</td>
									<td width="165" height="7"><span id="lbl_mqxm"> </span></td>
									<td align="center" height="7"></td>
								</tr>
								<tr>
									<td>来源地区：</td>
									<td>&nbsp;</td>
									<td>邮政编码：</td>
									<td colspan="2"><span id="lbl_yzbm"> </span></td>
									<td>母亲单位：</td>
									<td width="165"><span id="lbl_mqdw"> </span></td>
									<td align="center"></td>
								</tr>
								<tr>
									<td>来源省：</td>
									<td>&nbsp;</td>
									<td>准考证号：</td>
									<td colspan="2">&nbsp;</td>
									<td>母亲单位邮编：</td>
									<td width="165"><span id="lbl_mqdwyb"> </span></td>
									<td align="center"> </td>
								</tr>
								<tr>
									<td>出生地：</td>
									<td><span id="lbl_csd"> </span></td>
									<td>身份证号：</td>
									<td colspan="2">&nbsp;</td>
									<td colspan="2">父亲单位电话或手机：</td>
									<td><span id="lbl_fqdwdh"> </span></td>
								</tr>
								<tr>
									<td>健康状况：</td>
									<td><span id="lbl_jkzk"> </span></td>
									<td>学历层次：</td>
									<td colspan="2">&nbsp;</td>
									<td colspan="2">母亲单位电话或手机：</td>
									<td><span id="lbl_mqdwdh"> </span></td>
								</tr>
								<tr>
									<td>学院：</td>
									<td>&nbsp;</td>
									<td>港澳台码：</td>
									<td colspan="2"><span id="lbl_gatm"> </span></td>
									<td colspan="2">家庭地址：</td>
									<td><span id="lbl_jtdz"> </span></td>
								</tr>
								<tr>
									<td>系：</td>
									<td><span id="lbl_xi"> </span></td>
									<td>报到号：</td>
									<td colspan="2">&nbsp;</td>
									<td colspan="2">家庭所在地（/省/县）：</td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td id="TDzymc">专业名称：</td>
									<td>&nbsp;</td>
									<td id="TDsfgspydy" colspan="3"><span id="Label2">是否高水平运动员：</span><span
										id="lbl_SFGSPYDY"> </span></td>
									<td valign="top" rowspan="4">备注：</td>
									<td colspan="2" rowspan="4"><span id="lbl_bz"> </span></td>
								</tr>
								<tr>
									<td>教学班名称：</td>
									<td><span id="lbl_JXBMC"> </span></td>
									<td id="TDyydj">英语等级：</td>
									<td colspan="2"><span id="lbl_yydj"> </span><span
										id="lbl_xslb"> </span></td>
								</tr>
								<tr>
									<td>行政班：</td>
									<td>&nbsp;</td>
									<td id="TDyycj">英语成绩：</td>
									<td colspan="2"><span id="lbl_YYCJ"> </span></td>
								</tr>
								<tr>
									<td id="TDxz">学制：</td>
									<td>&nbsp;</td>
									<td id="TDljbym">录检表页码：</td>
									<td colspan="2"><span id="lbl_LJBYM"> </span></td>
								</tr>
								<tr>
									<td height="39">学习年限：</td>
									<td height="39"><span id="lbl_xxnx"> </span></td>
									<td height="39">特长：</td>
									<td colspan="2" height="39"><span id="lbl_tc"> </span></td>
									<td colspan="2" height="39"></td>
									<td height="39"><span id="lbl_qqny"> </span></td>
								</tr>
								<tr>
									<td height="39">学籍状态：</td>
									<td height="39">&nbsp;</td>
									<td height="39">党(团)时间：</td>
									<td colspan="2" height="39"><span id="lbl_RDSJ"> </span></td>
									<td colspan="2" height="39"></td>
									<td height="39"><span id="lbl_xxmc"> </span></td>
								</tr>
								<tr>
									<td height="39">当前所在级：</td>
									<td height="39">&nbsp;</td>
									<td id="TDccqj" height="39">火车终点站：</td>
									<td colspan="2" height="39"><span id="lbl_ccqj"> </span></td>
									<td colspan="2" height="39"></td>
									<td height="39"><span id="lbl_zmr"> </span></td>
								</tr>
								<tr id="trksh">
									<td>考生号：</td>
									<td>&nbsp;</td>
									<td>学习形式：</td>
									<td colspan="2"><span id="lbl_xxxs"> </span></td>
									<td colspan="2"></td>
									<td></td>
								</tr>
								<tr id="Tr1">
									<td>银行帐号：</td>
									<td><input name="yhzh" type="text" id="yhzh"
										disabled="disabled" /> <span id="lbl_yhzh"> </span></td>
									<td></td>
									<td colspan="2"></td>
									<td colspan="2"><span id="lblxmpy" disabled="disabled">姓名拼音：</span></td>
									<td>&nbsp;</td>
								</tr>
								<tr id="T" border="2">
									<td colspan="8" height="100"><span id="t"> </span></td>
								</tr>
							</tbody>
						</table></td>
				</tr>
			</table>
			<div>
				<table width="100%" border="0" align="left" bgcolor="#CCCCCC">
					<tr>
						<td align="right"><form id="form1" name="form1" method="post"
								action="">
								<div class="other">
									<input name="提交" type="submit" class="height" id="提交"
										value="提交" /> <input name="修改" type="submit" class="height"
										id="修改" value="修改" />
								</div>
							</form></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
