<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<title>Co-Out</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="resources/css/main.css" />
		<link rel="stylesheet" href="style.css" type="text/css">
		<link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
		
			<style>
			body{
				background-size: 100% 100%;
				color: black;
				text-align: center;
				font-family: 'Do Hyeon', sans-serif;
			}
			
			a:link {
				color: black;
				text-decoration: none;
			}
			
			a:visited {
				color: black;
				text-decoration: none;
			}
			
			#login_form {
				font-color: black;
				opacity: 0.8;
				border-radius: 10px;
				width: 400px;
				padding: 10px;
				height: 80px;
				text-align: center;
				position:center;
				
			}
			
			#login {
			
				opacity: 1.0;
				color: black;
				bottom: 10px;
				left: 50px;
			}
			
			#find {
			
				opacity: 1.0;
				color: black;
				bottom: 10px;
				right: 50px;
			}
			
	</style>
	</head>
	
	<body>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	<script>
		const login = () => {
			let userId = $('input[name=userId]').val();
			let userPw = $('input[name=userPw]').val();

			let values = {
				'userId': userId,
				'userPw': userPw
			};

			console.log(values);

			axios.post('http://localhost:8098/login', values)
					.then(res => {
						console.log(res);
						alert('로그인 성공!');
					})
					.catch(err => {
						console.log(err);
						alert('로그인 실패!');
					});
		}
	</script>
		<!-- Header -->
			<header id="header" class="alt">
				<div class="inner">
					<h1>Corona Out</h1>
						<p>COVID-19 맞춤형 병원/선별 진료소 예약 서비스</p>
				</div>
			</header>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Banner -->
					<section id="intro" class="main">
						<span class="icon fa-diamond major"></span>
						<h2>Login</h2>
						<center>
						<div id="login_form" class="main">
						<form>
							<table>
								<tr>
									<td>ID :</td>
									<td><input type="text" name="userId"></td>
								</tr>
								<tr>
									<td>PASSWORD :</td>
									<td><input type="password" name="userPw"></td>
								</tr>
								<tr>
									<td><input type="button" value="login" onclick="login()"></td>
									<td><input type="button" value="join" onclick="location.href='/join'"></td>
								</tr>
								<tr><td><input type="button" value="Hospital" onclick="location.href='/hospitalList'"></td></tr>
							</table>
				
						</form>
					</div>
					</center>
					</section>

				

				<!-- CTA -->
					<section id="cta" class="main special">
						<h2>Capstone Project</h2>
						<P>Team   :   Lee Chang Myeong   /   Yoo Hyun Suk   /   Yun I Jin</p>
						<ul class="actions">
							<li><a href="#" class="button big">Move Up</a></li>
						</ul>
					</section>

				<!-- Main -->
				<!--
					<section id="main" class="main">
						<header>
							<h2>Lorem ipsum dolor</h2>
						</header>
						<p>Fusce malesuada efficitur venenatis. Pellentesque tempor leo sed massa hendrerit hendrerit. In sed feugiat est, eu congue elit. Ut porta magna vel felis sodales vulputate. Donec faucibus dapibus lacus non ornare. Etiam eget neque id metus gravida tristique ac quis erat. Aenean quis aliquet sem. Ut ut elementum sem. Suspendisse eleifend ut est non dapibus. Nulla porta, neque quis pretium sagittis, tortor lacus elementum metus, in imperdiet ante lorem vitae ipsum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Etiam eget neque id metus gravida tristique ac quis erat. Aenean quis aliquet sem. Ut ut elementum sem. Suspendisse eleifend ut est non dapibus. Nulla porta, neque quis pretium sagittis, tortor lacus elementum metus, in imperdiet ante lorem vitae ipsum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>
					</section>
				-->

				<!-- Footer -->
					<footer id="footer">
						<ul class="icons">
							<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
							<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
							<li><a href="#" class="icon fa-linkedin"><span class="label">LinkedIn</span></a></li>
							<li><a href="#" class="icon fa-envelope"><span class="label">Email</span></a></li>
						</ul>
						<p class="copyright">&copy; 팀 2-14</p>
					</footer>

			</div>

		<!-- Scripts -->
		<script src="../static/js/jquery.min.js" type="text/javascript"></script>
		<script src="../static/js/skel.min.js" type="text/javascript"></script>
		<script src="../static/js/util.js" type="text/javascript"></script>
		<script src="../static/js/main.js" type="text/javascript"></script>

	</body>
</html>