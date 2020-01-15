<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
