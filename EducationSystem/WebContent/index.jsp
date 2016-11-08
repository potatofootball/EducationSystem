<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎登陆教务系统</title>
<link href="css/denglu.css" rel="stylesheet" type="text/css" />
</head>
<body onload=first_check()>
	<!--容器-->
	<div id="main">
		<!--top-->
		<!--logo-->
		<div id="nav">
			<img src="images/top_logo.png" width="234" height="51" /> <a
				target="_blank" href=""
				style="float: left; margin: 5px 20px; width: 140px; height: 31px">
			</a>
		</div>
		<!--mid-->
		<div id="content">
			<!--中部背景-->
			<div id="center_bg">
				<div id="center_mune_bg">
					<!--登录主界面-->
					<div id="center_mune">
						<div id="word">LOGIN/登录</div>
						<form id=apLogin name=apLogin class="login_form" method="post">
							<span id="landing_box_title"> 帐号 <input type="text"
								name="username" id="username" placeholder="学号/教师号/职工号" />
							</span> <span id="landing_box_title"> 密码 <input type="password"
								name="password" id="password" />
							</span>
							<div id="chose">
								<input name="identity" type="radio" value="student"
									checked="checked" /> 学生 <input name="identity" type="radio"
									value="teacher" /> 教师 <input name="identity" type="radio"
									value="jiaowu" /> 教务 <input name="identity" type="radio"
									value="manager" /> 管理员
							</div>
							<span id="landing_box_title"> <input type="submit"
								name="login" id="login" value="登录" onclick="denglu_submit();" />
								<input type="reset" name="reset" id="reset" value="重置" /> <input
								type="submit" name="forget" id="forget" value="忘记密码" />
							</span> <span id="landing_box_title">
								<div>新生初始密码查询&nbsp;&nbsp;系统选课操作说明</div>
							</span>
						</form>
					</div>
				</div>
			</div>
			<script type="text/javascript">
			
				function first_check() {
					<%if (session.getAttribute("errormessage") != null) {%>
					alert("<%=(String) session.getAttribute("errormessage")%>")
					<%session.removeAttribute("errormessage");
			} else {
				out.print("alert(\"密码都为123456\\n教务账号1001、1002\\n教师账号1003起，逢50千位进一\\n学生账号从1301011001起，末两位至49后千位进1，千位至3后，万位进1，万位至5后百万位进1\")");
			}%>
					return true;
				}
				
				function denglu_submit() {
					var user_val = document.getElementById("username").value;
					var password_val = document.getElementById("password").value;
					if (user_val == "") {
						alert("用户名不能为空！！");
						return false;
					} else if (password_val == "") {
						alert("密码不能为空！！！");
						return false;
					}else if(user_val.length<4||user_val.length>16){
						alert("账号长度应在4到16个字符之间！");
						return false;
					}else if (password_val.length<6||password_val.length>16){
						alert("密码长度应在6到16个字符之间！");
						return false;
					}	else {
						document.apLogin.action = "login.do";
					}
					return true;
				}
				</script>
			<!--footer-->
			<div id="footer" class="w">
				<hr />
				<div align="center">Copyright©2002-2016 - 北京师范大学珠海分校 版权所有</div>
			</div>
		</div>

	</div>
</body>
</html>