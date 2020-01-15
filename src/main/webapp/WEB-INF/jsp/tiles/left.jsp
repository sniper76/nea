<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!-- Sidebar -->
<div id="container">
	<div id="lnb">
		<form id="leftMenuForm" name="leftMenuForm" method="post">
		</form>
		<button type="button" class="lnb_btn">side menu hide and show</button>
		<nav class="lnb_menu">
			<h2 class="skip">Side Menu</h2>
			<div class="lnb_title">
				<strong>User Management</strong>
			</div>
			<ul class="dep1">
			<li><a href="">Member Management</a>
				<ul class="dep2">
				<li><a href="">계정정보</a>
					<ul class="dep3">
					<li><a href="javascript:void(0);" onClick="fnGoPrivtModify();">개인정보 수정</a></li>
					<li><a href="">lnb_depth3</a></li>
					<li><a href="">lnb_depth3</a></li>
					<li><a href="">lnb_depth3</a></li>
					<li><a href="" target="_blank" title="New Window" class="link">lnb_depth3</a></li><!-- 새창으로 링크 될 경우 클래스 link 추가 -->
					</ul>
				</li>
				<li><a href="">lnb_depth2</a></li>
				<li><a href="">lnb_depth2</a>
					<ul class="dep3">
					<li><a href="">lnb_depth3</a></li>
					<li><a href="">lnb_depth3</a></li>
					<li><a href="">lnb_depth3</a></li>
					<li><a href="">lnb_depth3</a></li>
					<li><a href="" target="_blank" title="New Window" class="link">lnb_depth3</a></li><!-- 새창으로 링크 될 경우 클래스 link 추가 -->
					</ul>
				</li>
				<li><a href="">lnb_depth2</a></li>
				<li><a href="" target="_blank" title="New Window" class="link">lnb_depth2</a></li><!-- 새창으로 링크 될 경우 클래스 link 추가 -->
				</ul>
			</li>
			<li><a href="">Job Seeker</a>
				<ul class="dep2">
				<li><a href="">lnb_depth2</a></li>
				<li><a href="">lnb_depth2</a></li>
				<li><a href="">lnb_depth2</a></li>
				<li><a href="">lnb_depth2</a></li>
				<li><a href="">lnb_depth2</a></li>
				</ul>
			</li>
			<li><a href="">Student/Intern</a>
				<ul class="dep2">
				<li><a href="">lnb_depth2</a></li>
				<li><a href="">lnb_depth2</a></li>
				<li><a href="">lnb_depth2</a></li>
				<li><a href="">lnb_depth2</a></li>
				<li><a href="">lnb_depth2</a></li>
				</ul>
			</li>
			<li><a href="">Employer</a></li>
			<li><a href="">Training Institution</a></li>
			</ul>
			<script>
				//<![CDATA[
				jQuery(function(){
					lnb_menu(1,3,1);//첫번째 1depth , 두 번째 2depth 활성화 , 세 번째 3depth 활성화
				});
				//]]>
			</script>
		</nav>
		<!-- //lnb_menu -->
	</div>
	<!-- //lnb -->

	<main class="colgroup" id="colgroup">
		<article>
			<header class="sub_head">
				<div class="sub_title"><h2>User Status</h2></div>
				<div class="path">
					<span class="home">User Mgmt.</span>
					<span>User Mgmt.</span>
					<strong>User Status</strong>
				</div>
				<div class="sub_tab_menu">
					<ul class="clearfix">
						<li><a href="">Tab Menu</a></li>
						<li class="on"><a href="">Tab Menu</a></li>
						<li><a href="">Tab Menu</a></li>
						<li><a href="">Tab Menu</a></li>
					</ul>
				</div>
			</header>

			<div id="contents">
