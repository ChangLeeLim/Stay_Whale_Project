<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="vo.HomeStayBean" %>
<%
	HomeStayBean homestay = (HomeStayBean)request.getAttribute("homestay");
	String detail = homestay.getDetail();
	detail = detail.replace("\r\n", "<br>");
    detail = detail.replace("\n", "<br>");
    detail = detail.replace("\r", "<br>");
    
    String imglist = homestay.getAcc_picture();
    String[] imglists = imglist.split(",");
    
    /*for (String img : imglists) {
      out.println(img + "<br>");
    }*/
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>STAY WHALE</title>

	<link rel="stylesheet" type="text/css" href="css/homestay_detail.css"><!--※css파일 맞는걸로 수정 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script src="js/homestay_detail.js"></script><!--※js파일 맞는걸로 수정 -->
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String id = (String)session.getAttribute("id");
	%>
	<%
		if(id == null) {
	%>
		<jsp:include page="Header_Login_Fail.jsp" >
			<jsp:param name="id" value="<%= id%>"/>
		</jsp:include>
	<%
	} else {
	%>
		<jsp:include page="Header_Login_Success.jsp"/>
	<%
	}
	%>
<div class="section_wrap"></div>

<h1 class="airbnb_name"><%=homestay.getAcc_name() %></h1>
<div class="airbnb_infor"><span>★4.77</span><span>(166) </span><span><%=homestay.getSite_1() %>, </span><span><%=homestay.getSite_2() %>, </span><span><%=homestay.getLocation() %> </span></div>

<div class="airbnb_img">
<div class="airbnb_img_main"><img src="image/<%=imglists[0]%>"></div>
<div class="airbnb_img_sub"><img src="image/<%=imglists[1] %>"></div><div class="airbnb_img_sub"><img src="image/<%=imglists[2] %>"></div><div class="airbnb_img_sub" style="padding-top:10px;"><img src="image/<%=imglists[3] %>"></div><div class="airbnb_img_sub" style="padding-top:10px;"><img src="image/<%=imglists[4] %>"></div>

</div>

<section class="detail_main">
<div class="detail_left">
<div>
<div class="title"><h1><%=homestay.getHost() %>님이 호스팅하는 <%=homestay.getTheme() %></h1>
<span>최대인원 <%=homestay.getStandard_amount() %>명·침실<%=homestay.getBedroom_count() %>개·침대<%=homestay.getBed_count() %>개·욕실<%=homestay.getBathroom_count() %>개</span></div>

<div class="fix"><h1>에어커버</h1>
<span>모든 예약에는 호스트가 예약을 취소하거나 숙소 정보가 정확하지 않은 경우 또는 체크인에 문제가 있는 상황에 대비한 무료 보호 프로그램이 포함됩니다.</span></div>

<div class="detail"><%= detail %></div>

<div class="facility"><h1>숙소 편의시설</h1>
<span><%=homestay.getFacility_name() %></span></div>
</div>
</div>

<div class="detail_right">
<div class="reserve">
<div class="price"><%=homestay.getPrice2() %>원/박</div>
<div class="rating">★4.77(166)</div>

<div class="chk_table">
<div class="chk_in">체크인<br/><input type="text" name="from" id="from" class="datepicker" style="cursor: ponter" placeholder="select a check-in date"></div>
<div class="chk_out">체크아웃<br/><input type="text" name="to" id="to" class="datepicker" style="cursor: ponter" placeholder="select a check-out date"></div>
<div class="chk_guest">인원1명</div>
</div>

<div class="reserve_btn"><button type="button" class='custom-btn btn-3'><span>예약하기</span></button></div>
<div class="reserve_infor">예약 확정 전에는 요금이 청구되지 않습니다.</div>
<div class="total_price">총 합계 = (가격)x(일수)</div>

</div>
</div>
</section>

<div>
<div class="airbnb_review"><span>후기</span><span>(후기 목록)</span></div>

<div class="hosting_location"><span>호스팅 지역</span><span>(맵 지도)</span></div>
</div>






















<input type='text' name='airbnbnum' class='airbnbnum' value='reg_num_a' hidden/>

<jsp:include page="footer.jsp"/>
</body>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css"/>
</html>