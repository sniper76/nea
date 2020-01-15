<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>National Employment Agency Internal Portal</title>
</head>
<body>

	<main class="colgroup" id="colgroup">
		<article>
			<header class="sub_head">
				<div class="sub_tab_menu count4"><!-- 클래스 count2 ~ count5 까지 -->
					<ul class="clearfix">
				    	<li><a href="">All</a></li><!-- 현재 페이지 클래스 on 추가 -->
				        <li class="on"><a href="">Category</a></li>
				        <li><a href="">Category</a></li>
				        <li><a href="">Category</a></li>
				 	</ul>
				</div>
				<div class="sub_title">
					<h2><span>에러 페이지</span></h2>
				</div>
           </header>

			<div id="error">
				<div class="error_box">
					<div class="box_wrap">
						<div class="title_box">
							<strong class="title">“Sorry, the page you <span class="em_point">requested was not found</span>.”</strong>
							<p class="cont">Maybe the page has moved or the URL is incorrect.</p>
						</div>
						<div class="cont_box">
							<p class="cont">Sorry for your inconvenience <br />Contact us and we will try to point you in the right direction.</p>
						</div>
						<div class="put_box">
							<a href="" class="error_btn">GO TO MAIN</a>
						</div>
					</div>
				</div>
			</div>
		<!-- //error_box -->
		</article>
	</main>
</body>
</html>