<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="css/header.css">
	<script type="text/javascript" src="js/header.js"></script>
</head>
<body>
	<header>
		<div id="logo_Wrap">
			<a href="Main_Index.jsp"><div class="logo logoup" id="logo"></div></a>
			<div class="logo_Menu">
				<nav>
					<ul>
						<li><button type="button"><a href="#"><img src="image/search_icon.png"></a></button></li>
						<li><button type="button"><a href="#"><img src="image/reservation_icon.png"></a></button></li>
						<li><button type="button"><a href="#"><div><b>내 주변</b></div></a></button></li>
						<li><button type="button"><a href="Login.jsp"><div><b>로그인</b></div></a></button></li>
						<li class="more"><button type="button"><a href="#"><img src="image/add_icon.png"></a></button>
						<ul class="announcement">
							<li><a href="Bulletin_Board_Notice.jsp">공지사항</a></li>
							<!-- <li><a href="Bulletin_Board_Event.jsp">이벤트</a></li> -->
							<li><a href="Bulletin_Board_QnA.jsp">자주 묻는 질문</a></li>
							<!-- <li><a href="Bulletin_Board.jsp">1:1 문의</a></li> -->
							<li><a href="Bulletin_Board_Policy.jsp">약관 및 정책</a></li>
						</ul>
						</li>
						<li><button type="button"><a href="#"><img src="image/profile_icon.png"></a></button></li>
					</ul>
				</nav>
			</div>
		</div>
	</header>
</body>
</html>