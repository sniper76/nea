<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<body id="sub01">
<div class="accessibility">
    <a href="#container">Contents shortcut</a>
</div>

<hr />

<div id="wrapper">
<header id="header">
    <div class="wrap header_wrap">
		<h1 class="logo">
			<a href="/">
				<img src="/images/common/logo.png" alt="NEA logo" />
				<span class="cont">
					<strong>ទីភ្នាក់ងារជាតិមុខរបរ និងការងារ</strong>
					<span>Ministry of Labour and Vocational Training</span>
				</span>
			</a>
		</h1>
		<div class="header_top clearfix"><!-- 로그인 되었을 때 아래 주석으로 교체 -->
            <ul class="clearfix">
			<li><a href="javascript:fnGoLogin();" class="login"><spring:message code="login.title"/></a></li>
            <li><a href="javascript:fnGoRegister();" class="register"><spring:message code="login.btn.signUp"/></a></li>
            <!-- <li><a href="" class="mypage">My page</a></li>
            <li><a href="" class="logout">Logout</a></li> -->
            </ul>
			<a href="" class="language">Change language</a>
        </div>
		<!-- //header_top -->
    </div>
	<div class="search_box">
		<div class="wrap search_wrap">
			<button type="button" class="search_open">Search Open</button>
			<div class="search">
				<h2 class="skip">Search</h2>
				<form method="post">
					<fieldset>
						<legend>Search</legend>
						<label for="total_search" class="skip">input the search</label>
						<input type="search" id="total_search" placeholder="input the search keyword" />
						<input type="submit" value="search" />
					</fieldset>
				</form>
			</div>
			<button type="button" class="search_close">Search Closed</button>
		</div>
	</div>
    <!-- //search_box -->
	<div class="mask"><div class="wrap"></div></div>
</header>
<!-- //header -->

<hr />

<nav id="gnb_box">
	<div class="wrap">
		<h2 class="skip">Global Navigation Bar</h2>
		<button type="button" class="gnb_open">Global Navigation Open</button>
		<div id="gnb">
			<ul class="clearfix">
			<li class="depth1"><a href="" class="tit">JOB SEEKER</a>
				<div class="depth2">
					<ul class="clearfix">
					<li><a href="">Job Search</a>
						<div class="depth3">
							<ul class="clearfix">
							<li><a href="">depth3</a></li>
							<li><a href="">depth3</a></li>
							<li><a href="">depth3</a></li>
							<li><a href="">depth3</a></li>
							</ul>
						</div>
					</li>
					<li><a href="">Detailed Search</a>
						<div class="depth3">
							<ul class="clearfix">
							<li><a href="">depth3</a></li>
							<li><a href="">depth3</a></li>
							<li><a href="">depth3</a></li>
							<li><a href="">depth3</a></li>
							<li><a href="">depth3</a></li>
							<li><a href="">depth3</a></li>
							<li><a href="">depth3</a></li>
							</ul>
						</div>
					</li>
					<li><a href="">Search by Category</a></li>
					</ul>
				</div>
			</li>
			<li class="depth1"><a href="" class="tit">EMPLOYER</a>
				<div class="depth2">
					<ul class="clearfix">
					<li><a href="">Job Seeker Search</a></li>
					<li><a href="">Detail Search</a></li>
					<li><a href="">Search by Category</a></li>
					</ul>
				</div>
			</li>
			<li class="depth1"><a href="" class="tit">COUNSELING</a>
				<div class="depth2">
					<ul class="clearfix">
					<li><a href="">Career Exploration</a></li>
					<li><a href="">Jbo Supports Training</a></li>
					<li><a href="">Register Counselling</a></li>
					<li><a href="">Popular Counseling</a></li>
					</ul>
				</div>
			</li>
			<li class="depth1"><a href="" class="tit">TRAINING</a>
				<div class="depth2">
					<ul class="clearfix">
					<li><a href="">All Programs / Scholarship</a></li>
					</ul>
				</div>
			</li>
			<li class="depth1"><a href="" class="tit">JOB FAIR</a>
				<div class="depth2">
					<ul class="clearfix">
					<li><a href="">Job Fair</a></li>
					</ul>
				</div>
			</li>
			<li class="depth1"><a href="" class="tit">INTRO/INFO</a>
				<div class="depth2">
					<ul class="clearfix">
					<li><a href="">User Support</a></li>
					<li><a href="">Labour Market Research and Publication</a></li>
					<li><a href="">NEA Introduction</a></li>
					</ul>
				</div>
			</li>
			</ul>
		</div>
		<div class="gnb_other">
			<div class="sitemap"><a href="">Site Map</a></div>
			<ul class="gnb_sns clearfix">
			<li><a href="https://goo.gl/maps/HJRg65GkPSk" target="_blank" title="new window">NEA google map</a></li>
			<li><a href="https://www.facebook.com/neakhmer/" target="_blank" title="new window">NEA facebook</a></li>
			<li><a href="https://www.youtube.com/user/neagovkh" target="_blank" title="new window">NEA youtube</a></li>
			</ul>
		</div>
		<button type="button" class="gnb_close">Global Navigation Closed</button>
	</div>
</nav>
<!-- //gnb -->
<div id="container">
    <div class="wrap clearfix">
        <div id="side">
            <nav class="side_menu clearfix">
                <h2 class="skip">Sub menu</h2>
				<a href="" class="home">Go to main page</a>
                <div class="side_box"><!-- 1차메뉴 -->
                    <button>Intro/Info</button>
                    <div class="side_cont">
                        <ul class="clearfix">
                        <li><a href="" class="on">1depth</a></li><!-- 현재 페이지 클래스 on 추가 -->
                        <li><a href="">1depth</a></li>
                        <li><a href="">1depth</a></li>
                        <li><a href="">1depth</a></li>
                        </ul>
                    </div>
                </div>
                <div class="side_box"><!-- 2차메뉴 -->
                    <button>NEA Introduction</button>
                    <div class="side_cont">
                        <ul class="clearfix">
                        <li><a href="">2depth</a></li>
                        <li><a href="">2depth</a></li>
                        <li><a href="">2depth</a></li>
						<li><a href="" class="on">2depth</a></li><!-- 현재 페이지 클래스 on 추가 -->
                        </ul>
                    </div>
                </div>
				<div class="side_box"><!-- 3차메뉴 없을 경우 안 보이게 -->
                    <button>Job Center Info</button>
                    <div class="side_cont">
                        <ul class="clearfix">
                        <li><a href="" class="on">3depth</a></li><!-- 현재 페이지 클래스 on 추가 -->
                        <li><a href="">3depth</a></li>
                        <li><a href="">3depth</a></li>
                        <li><a href="">3depth</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- //side_menu -->
        </div>
        <!-- //side -->
