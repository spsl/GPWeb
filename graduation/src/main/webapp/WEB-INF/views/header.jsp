<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn">
		<head>
			<meta charset="utf-8">
			<meta http-equiv="X-UA-Compatible" content="IE=edge">
			<meta name="viewport"
				content="width=device-width, initial-scale=1"
				charset="UTF-8 maximum-scale=1, user-scalable=nomaximum-scale=1, user-scalable=no">

			<title>${param.subTitle}</title>
			<!-- Bootstrap --> 
			<link href="resources/css/bootstrap.css" rel="stylesheet">
			<link href="resources/css/bootstrap-theme.css" rel="stylesheet">
			<link href="resources/css/main.css" rel="stylesheet">
		<!-- 	<link href="resources/dist/css/bootstrap.min.css" rel="stylesheet"> -->
			
			
			<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js">
			</script>
			<!-- Include all compiled plugins (below), or include individual files as needed -->
			<script src="resources/dist/js/bootstrap.min.js">
			</script>
			<script src="resources/js/tableCheck.js">
			</script>
			<script src="resources/js/registerFormCheck.js">
			</script>
			<script src="resources/js/loginFormCheck.js"></script>
			<script src="resources/js/templateList.js"></script>
			<script type="text/javascript" src="<c:url value="/resources/js/js_template.js" />"></script> 
			<script type="text/javascript" src="<c:url value="/resources/js/qyff-common-1.0.0.js" />"></script>
			<script>
				$(document).ready(function(){
					$('body').height($(window).height());
					
				});
			</script>
		</head>
		<body>
			<div class="container-fluid"  >
				<div id="main" >
				<nav class="navbar navbar-default navbar-fixed-top" role="navigation" >
					<div class="container"  >
						<!-- Brand and toggle get grouped for better mobile display -->
						<div class="navbar-header" >
							<button type="button"
								class="navbar-toggle collapsed" data-toggle="collapse"
								data-target="#bs-navbar-collapse-one">
								<span class="sr-only">
									Toggle navigation
								</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								
							</button>
								<a class="navbar-brand" href="Home" id="homeicon">
									<img alt="青颖飞帆" src="resources/images/download/logo.png" style="height:79px"></a>

							
						</div>

						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse" id="bs-navbar-collapse-one" style="margin-left:50px;padding:25px 50px 25px 50px" >

							<ul class="nav navbar-nav " >
								<li style="margin-left:50px" >
									<a href="Home" id="home">首页</a>
								</li>
								<li class="dropdown" style="margin-left:50px">
								 <a href="Product" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
								 产品 <span class="caret"></span></a>
									<ul class="dropdown-menu" role="menu">
										<li><a href="Product" id="qingshu">青书</a></li>
										<li><a href="ProductEClass" id="eclass">青书e学堂</a></li>
									</ul>
								</li>
								<li style="margin-left:50px">
									<a href="Download" id="xiazai">下载</a>
								</li>
								<li style="margin-left:50px">
									<a href="Discuss" id="forum">论坛</a>
								</li>
								<li style="margin-left:50px">
									<a href="AboutUs" id="about">关于</a>
								</li>
							</ul>

							<ul class="nav navbar-nav navbar-right" >
								<c:choose>
									<c:when test="${model.userAuthenticated}">
										<li class="dropdown" style="margin-left:50px">
									 <a href="Product" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
								 	${model.userIdentity.name}<span class="caret"></span></a>
									<ul class="dropdown-menu" role="menu">
									
										<li><a href="logout">登出</a></li>
									</ul>
								</li>
									</c:when>
									<c:otherwise>
									<li>
										<a href="register">注册</a>
									</li>
									<li >
										<a href="login">登录</a>
									</li>
									</c:otherwise>
								</c:choose>
							
								
							</ul>
							
							
							
						</div><!-- /.navbar-collapse -->
					</div><!-- /.container-fluid -->
				</nav>
			</div>
				
			</div>