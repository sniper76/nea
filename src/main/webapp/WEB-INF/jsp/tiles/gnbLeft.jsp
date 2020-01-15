<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<body id="sub01" class="side_type">
<div class="accessibility">
    <a href="#container">Contents shortcut</a>
</div>

<hr />

<div id="wrapper">
<header id="header">
    <div class="wrap header_wrap">
		<h1 class="logo">
			<a href="${pageContext.request.contextPath}/index.do">
				<img src="${pageContext.request.contextPath}/images/common/logo.png" alt="NEA logo" />
				<span class="cont">
					<strong>ទីភ្នាក់ងារជាតិមុខរបរ និងការងារ</strong>
					<span>Ministry of Labour and Vocational Training</span>
				</span>
			</a>
		</h1>
		<div class="header_top clearfix"><!-- 로그인 되었을 때 아래 주석으로 교체 -->
            <ul class="clearfix">
				<sec:authorize access="isAnonymous()">
					<li><a href="javascript:fnGoLogin();" class="login"><spring:message code="login.title"/></a></li>
	            	<li><a href="javascript:fnGoRegister();" class="register"><spring:message code="login.btn.signUp"/></a></li>
				</sec:authorize>

				<sec:authorize access="hasAnyRole('ROLE_USER,ROLE_STDIT')">
					<li><a href="${pageContext.request.contextPath}/cpes/private/member/main.do"><spring:message code="gnb.menu.member.title"/></a></li>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_CMPNY')">
					<li><a href="${pageContext.request.contextPath}/cpes/compny/vacancy/list.do"><spring:message code="gnb.menu.member.title"/></a></li>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_TRNCT')">
					<li><a href="${pageContext.request.contextPath}/cpes/instt/eduTrnng/list.do"><spring:message code="gnb.menu.member.title"/></a></li>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
		       		<li><a href="javascript:void(0);" onclick="fnLogout();" class="logout"><spring:message code="gnb.menu.member.title2"/></a></li>
		        </sec:authorize>


            </ul>
			<button type="button" class="language">Change language open</button>
	        <div class="language_box">
	        	<ul>
		            <li><a href="${pageContext.request.contextPath}/index.do?lang=en">English</a></li>
		            <li><a href="${pageContext.request.contextPath}/index.do?lang=kh">Khmer</a></li>
	            </ul>
	        </div>
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
						<li><a href="${pageContext.request.contextPath}/vacancy/index.do"><spring:message code="vacancy.search.msg3"/></a>
						<li><a href="${pageContext.request.contextPath}/vacancy/internDtlSearch.do"><spring:message code="vacancy.search.msg4"/></a>
						<li><a href="${pageContext.request.contextPath}/vacancy/partTimeDtlSearch.do"><spring:message code="vacancy.search.msg5"/></a>
						<li><a href="${pageContext.request.contextPath}/vacancy/popularCompny.do"><spring:message code="jobseeker.vacancy.popular.company.ttl04"/></a>
						<li><a href="${pageContext.request.contextPath}/vacancy/popularCompnyWeek.do"><spring:message code="jobseeker.vacancy.popular.company.ttl05"/></a>
						<li><a href="${pageContext.request.contextPath}/vacancy/popularCompnyMonth.do"><spring:message code="jobseeker.vacancy.popular.company.ttl02"/></a>
						<li><a href="${pageContext.request.contextPath}/vacancy/popularVacancy.do"><spring:message code="compny.popular.msg2"/></a>
<!-- 						<li><a href="">Job Search</a>
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
						<li><a href="">Search by Category</a></li> -->
					</ul>
				</div>
			</li>
			<li class="depth1"><a href="" class="tit">EMPLOYER</a>
				<div class="depth2">
					<ul class="clearfix">
						<sec:authorize access="hasRole('ROLE_CMPNY')">
							<li><a href="${pageContext.request.contextPath}/cpes/compny/hrSearch/hrSearchForm.do">Job Seeker Search</a>
							<li><a href="${pageContext.request.contextPath}/cpes/compny/stditSearch/stditSearchForm.do">Student/Intern Search</a>
						</sec:authorize>
<!-- 						<li><a href="">Detail Search</a></li>
						<li><a href="">Search by Category</a></li> -->
					</ul>
				</div>
			</li>
			<li class="depth1"><a href="" class="tit">COUNSELING</a>
				<div class="depth2">
					<ul class="clearfix">
						<sec:authorize access="hasAnyRole('ROLE_USER,ROLE_STDIT')">
							<li><a href="javascript:void(0);" onclick="fnGoCounsel('CTG0000000001');"><spring:message code="gnb.menu.counsel.title"/></a></li>
							<li><a href="javascript:void(0);" onclick="fnGoCounsel('CTG0000000002');"><spring:message code="gnb.menu.counsel.title2"/></a></li>
							<li><a href="javascript:void(0);" onclick="fnGoCounsel('CTG0000000003');"><spring:message code="gnb.menu.counsel.title3"/></a></li>
							<li><a href="javascript:void(0);" onclick="fnGoCounsel('CTG0000000004');"><spring:message code="gnb.menu.counsel.title4"/></a></li>
							<li><a href="javascript:void(0);" onclick="fnGoCounsel('CTG0000000005');"><spring:message code="gnb.menu.counsel.title5"/></a></li>
						</sec:authorize>
						<li><a href="javascript:void(0);" onclick="fnGoBulletin('c248c26f223b11ea8e118cec4b8e345c');"><spring:message code="eduTrnng.msg3"/></a></li>
						<li><a href="${pageContext.request.contextPath}/cpes/all/counsel/list.do"><spring:message code="counsel.msg.oneAndOne.title"/></a></li>
						<li><a href="${pageContext.request.contextPath}/jobStudy/list.do"><spring:message code="mypage.compny.vacancy.msg12"/></a></li>
					</ul>
				</div>
			</li>
			<li class="depth1"><a href="" class="tit">TRAINING</a>
				<div class="depth2">
					<ul class="clearfix">
<%-- 						<li>
							<a href="javascript:void(0);" onclick="fnGoEduTrnng();"><spring:message code="mypage.instt.eduTrnng.title26"/> </a>
						</li>
						<li>
							<a href="javascript:void(0);" onclick="fnGoEduTrnngArea();"><spring:message code="eduTrnng.msg2"/> </a>
						</li> --%>
						<li>
							<a href="javascript:void(0);" onclick="fnGoNeaEduTrnng();"><spring:message code="eduTrnng.free.search.title8"/></a>
						</li>
						<li>
							<a href="javascript:void(0);" onclick="fnGoEduTrnngByUrl('/eduTrnng/eduTrnngFreeList.do');"><spring:message code="mypage.instt.eduTrnng.title26"/>/<spring:message code="eduTrnng.msg"/></a>
						</li>
						<li>
							<a href="javascript:void(0);" onclick="fnGoEduTrnngByUrl('/eduTrnng/eduTrnngLocList.do');"><spring:message code="eduTrnng.msg2"/></a>
						</li>
						<li>
							<a href="javascript:void(0);" onclick="fnGoEduTrnngByUrl('/eduTrnng/eduTrnngSoftSkillList.do');"><spring:message code="eduTrnng.free.search.title5"/></a>
						</li>
						<li>
							<a href="javascript:void(0);" onclick="fnGoEduTrnngByUrl('/instt/insttList.do');"><spring:message code="eduTrnng.free.search.title7"/></a>
						</li>
					</ul>
				</div>
			</li>
			<li class="depth1"><a href="" class="tit">JOB FAIR</a>
				<div class="depth2">
					<ul class="clearfix">
						<li><a href="${pageContext.request.contextPath}/jobFair/typeList.do"><spring:message code="eduTrnng.msg8"/></a></li>
						<li><a href="${pageContext.request.contextPath}/jobFair/locList.do"><spring:message code="eduTrnng.free.search.title4"/></a></li>
						<li><a href="${pageContext.request.contextPath}/jobFair/applyList.do"><spring:message code="menu.jobfair.apply"/></a></li>
						<li><a href="${pageContext.request.contextPath}/jobFair/jobFairList.do"><spring:message code="menu.jobfair"/></a></li>
					</ul>
				</div>
			</li>
			<li class="depth1"><a href="" class="tit">INFOMATION</a>
				<div class="depth2">
					<ul class="clearfix">
						<li><a href="${pageContext.request.contextPath}/jobcenter/list.do"><spring:message code="jobcenter.list.title1"/></a></li>
						<li><a href="javascript:void(0);" onclick="fnGoBulletin('b187374dfedb11e9abf28cec4b8e345c');"><spring:message code="gnb.menu.bulletin.title"/></a></li>
						<li><a href="javascript:void(0);" onclick="fnGoBulletin('02c86065fedc11e9abf28cec4b8e345c');"><spring:message code="gnb.menu.bulletin.title2"/></a></li>
						<li><a href="javascript:void(0);" onclick="fnGoBulletin('c65b17dffedb11e9abf28cec4b8e345c');"><spring:message code="gnb.menu.bulletin.title3"/></a></li>
						<li><a href="javascript:void(0);" onclick="fnGoBulletin('d64eb1fdfedb11e9abf28cec4b8e345c');"><spring:message code="gnb.menu.bulletin.title4"/></a></li>
						<li><a href="javascript:void(0);" onclick="fnGoBulletin('f011c695fedb11e9abf28cec4b8e345c');"><spring:message code="gnb.menu.bulletin.title5"/></a></li>
						<li><a href="${pageContext.request.contextPath}/community/list.do">Community</a>
						<li><a href="${pageContext.request.contextPath}/info/lmi.do"><spring:message code="info.lmi.tt01" /></a>
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

