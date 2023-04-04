<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript" src="js/header_renew2.js"></script>
	<link rel="stylesheet" type="text/css" href="css/header_renew2_fail.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>
	<header>
	
		<div id="logo_Wrap">
			<div id="moreView">
				<ul>
					<li><a href="Bulletin_Board_Notice.jsp">공지사항</a></li>
					<li><a href="Bulletin_Board_QnA.jsp">자주묻는 질문</a></li>
					<li><a href="Bulletin_Board_Policy.jsp">약관 및 정책</a></li>
				</ul>
			</div>
		
			<a href="Main_Index.jsp"><div class="logo logoup" id="logo"></div></a>
			<div id="logo_Menu">
				<nav>
					<ul id="Logo_MenuCont">
						<li><a href="#">내주변</a></li>
						<li style="cursor: pointer;">더보기</li>
						<li><a href="#">로그인</a></li>
						<li><div id="search_icon">
						<div class="search-wrapper">
						    <div class="input-holder">
						        <input type="text" class="search-input" placeholder="Type to search" />
						        <button class="search-icon" onclick="searchToggle(this, event);"><span></span></button>
						    </div>
				
						</div>
						</div></li>
					</ul>
					
				
					
						
					<div id="topMenu">
						<div id="hambukBtn">
							<span id="hambuk" class="material-symbols-outlined">menu</span>
						</div>
						<ul id="topMenuCont">
							<li><a href="#">전체메뉴</a></li>
							<li><a href="#">숙소</a></li>
							<li><a href="#">명소</a></li>
							<li><a href="#">전시·행사</a></li>
							<li><a href="#">마켓</a></li>
							<li><a href="#">함께하는 Tour </a></li>
							<li><a href="#">커뮤니티</a></li>
							
						</ul>
					</div>			
					
				</nav>
			</div>
		</div>
	</header>
	
	<div id="menuWrap2">
		<div id="menuCont2">
			<div id="menuTotal">
			
				<div id="accomT">
					<div><strong>숙소</strong></div>
					<div>
						<ul>
							<li><a href="#">호텔·리조트</a></li>
							<li><a href="#">펜션</a></li>
							<li><a href="#">홈스테이</a></li>
							<li><a href="#">캠핑·글램핑</a></li>
							<li><a href="#">기타</a></li>
						</ul>
					</div>
				</div>
					
					
					
				<div id="attracT">
					<div><Strong>명소</Strong></div>
					<div>
						<ul>
							<li><a href="#">서울</a></li>
							<li><a href="#">강원</a></li>
							<li><a href="#">부산</a></li>
							<li><a href="#">전라</a></li>
							<li><a href="#">제주</a></li>
						</ul>
					</div>
				</div>
					
					
					<div id="miceT">
						<div><Strong>전시·행사</Strong></div>
						<div>
							<ul >
								<li><a href="#">전시</a></li>
								<li><a href="#">뮤지컬 ·콘서트·연극</a></li>
								<li><a href="#">테마파크</a></li>
								<li><a href="#">레저</a></li>
								<li><a href="#">관람</a></li>
							</ul>
						</div>
					</div>
					
					
						
					<div id="marketT">
						<div><Strong>Market</Strong></div>
						<div>
							<ul>
								<li><a href="#">신상품</a></li>
								<li><a href="#">추천상품</a></li>
								<li><a href="#">구매후기</a></li>
								<li><a href="#">카테고리 목록</a></li>
							</ul>
						</div>
					</div>
					
					
					<div id="withTour">
						<div><Strong>함께하는TOUR</Strong></div>
						<div>
							<ul>
								<li><a href="#">함께하는TOUR</a></li>
							</ul>
						</div>
					</div>
					
					<div id="commuT">
						<div><Strong>커뮤니티</Strong></div>
						<div>
							<ul>
								<li>TourDiary</li>
								<li>1:1게시판</li>
								<li>리뷰</li>
								<li>자유게시판</li>
							</ul>
						</div>
					
					</div>
						
						
						
						
					</div>
		
				</div>
				
			</div>
	
	<div id="menuWrap">
	
		<div id="menuCont">
			<div id="accom" class="navmenuWrap">
				<ul id="accomCont">
					<li>호텔 리조트</li>
					<li>팬션</li>
					<li>홈스테이</li>
					<li>캠핑·글램핑</li>
					<li>기타</li>
				</ul>
			</div>
			
			
			<div id="attrac" class="navmenuWrap">
				<ul id="attracCont">
					<li>서울</li>
					<li>강원</li>
					<li>부산</li>
					<li>전라</li>
					<li>제주</li>
				</ul> 
			</div>
			
			<div id="mice" class="navmenuWrap">
				<ul id="miceCont">
					<li>전시</li>
					<li>뮤지컬 ·콘서트·연극</li>
					<li>테마파크</li>
					<li>레저</li>
					<li>관람</li>
				</ul>
			</div>
			
			<div id="commu" class="navmenuWrap">
				<ul id="commuCont">
					<li>자유게시판</li>
					<li>1:1문의</li>
					<li>리뷰</li>
					<li>TourDiary</li>
				</ul>
			</div>
			
		</div> 
	</div>
	
	
</body>
</html>