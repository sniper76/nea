<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.text.*" %>
<%@ page import="ony.framework.util.DateUtil"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
<script>
	$(document).ready(function() {

	});
	function fnTablChange(div, obj) {
		var classStr = $(obj).parent().attr("class");

		if(classStr != "on") {
    		if(div == "INTRO") {
    			document.location.href = contextPath+"/info/neaIntro.do";
    		} else if(div == "VISION") {
    			document.location.href = contextPath+"/info/neaVision.do";
    		} else if(div == "GROUP") {
    			document.location.href = contextPath+"/info/neaGroup.do";
    		}
		}
	}
</script>

 <main class="colgroup" id="colgroup">
	<article>
		<header class="sub_head">
			<div class="sub_tab_menu count3"><!-- 클래스 count2 ~ count5 까지 -->
	            <ul class="clearfix">
	                <li><a ref="javascript:void(0);" onclick="fnTablChange('INTRO', this);">NEA Information</a></li><!-- 현재 페이지 클래스 on 추가 -->
	                <li><a href="javascript:void(0);" onclick="fnTablChange('VISION', this);">Vision/Mission</a></li>
	                <li class="on"><a href="javascript:void(0);" onclick="fnTablChange('GROUP', this);">Organization/Structure</a></li>
	            </ul>
			</div>
			<div class="sub_title">
				<h2><span>About NEA</span></h2>
			</div>
		</header>
		<div id="contents" class="neaGroup">
			<div class="organization_box">
				<div class="top_box">
					<p>The NAC's structure is divided into two main sections: Back Office and Front Office. <br />Back Office Management and Support refers to the four core divisions of the NEA's 16 core offices, which include:</p>
				</div>
				<div class="list_box">
					<ul class="clearfix">
					<li class="dep1">
						<div class="contents_box">
							<div class="title_box">
								<strong class="title">Administration and Finance</strong>
							</div>
							<div class="cont_box">
								<ul>
								<li>A. Office of Administration and Personnel</li>
								<li>B. Finance Office</li>
								<li>C. Procurement Office</li>
								<li>D. Knowledge Management Office</li>
								<li>E. Work Center Management Office</li>
								</ul>
							</div>
						</div>
					</li>
					<li class="dep1">
						<div class="contents_box">
							<div class="title_box">
								<strong class="title">Planning and Cooperation Division</strong>
							</div>
							<div class="cont_box">
								<ul>
								<li>A. Planning and Evaluation Office</li>
								<li>B. Office of Cooperation</li>
								<li>C. Project Management Office</li>
								</ul>
							</div>
						</div>
					</li>
					<li class="dep1">
						<div class="contents_box">
							<div class="title_box">
								<strong class="title">Information System Management</strong>
							</div>
							<div class="cont_box">
								<ul>
								<li>A. Database Management Office</li>
								<li>B. Computer System Development Office</li>
								<li>C. Website Development Management Office</li>
								<li>D. Online Advertising and Social Media Offices</li>
								</ul>
							</div>
						</div>
					</li>
					<li class="dep1">
						<div class="contents_box">
							<div class="title_box">
								<strong class="title">Information Collection and Distribution Divisio</strong>
							</div>
							<div class="cont_box">
								<ul>
								<li>A. Collection and Public Relations Office</li>
								<li>B. Advertising Event Management Office</li>
								<li>C. The Labor Market Research, Analysis and Prediction Office</li>
								<li>D. office, job market, job and occupation</li>
								<li>E. Publishing Office</li>
								</ul>
							</div>
						</div>
					</li>
					</ul>
				</div>
				<div class="put_box">
					<ul>
					<li>The Front Office is a work hub that provides direct access to service users and will be set up in every capital city in the Kingdom of Cambodia to bring services closer to you. <br />Use local and comprehensive services.</li>
					<li>The structure of the NCAC, chaired by a Chairman, consists of a number of advisors and vice-presidents, as necessary, overseeing the four areas and the Labor Center</li>
					</ul>
				</div>

				<h3>The structure of the National Employment Agency</h3>
				<div class="box_img margin_t_40 margin_b_40">
					<div class="inner">
						<img src="${pageContext.request.contextPath}/images/contents/organization_img.png" alt=" image" />
						<span class="img_zoom"><a href="${pageContext.request.contextPath}/images/contents/organization_img.png" target="_blank" title="New window open">View larger image</a></span>
					</div>
				</div>

				<h3>Service delivery</h3>
				<p class="point">Based on the vision, mission and goals outlined above, NAC provides employment services and labor market information to all users in the framework of the Kingdom of Cambodia, free of charge and in one convenient place through the options. Two are:</p>
				<div class="organization_box_inner_box">
					<div class="box_wrap">
						<ul class="bu type3">
						<li>
							<div class="cont_box">
								<strong class="title">Web site</strong>
								<a href="http://www.nea.gov.kh/" target="_blank" title="new window open" class="blank cont">www.nea.gov.kh</a>
							</div>
						</li>
						<li>
							<div class="cont_box">
								<strong class="title">Sociol Network</strong>
								<a href="http://www.facebook.com/neakhmer/" target="_blank" title="new window open" class="blank cont">www.facebook.com/neakhmer</a>
							</div>
						</li>
						</ul>
					</div>
				</div>
				<div class="bottom_box">
					<span>Direct service through Career Centers to be established across 25 provinces</span>
					<a href="${pageContext.request.contextPath}/jobcenter/list.do" class="btn noround">Job Center</a>
				</div>
			</div>
			<!-- //organization_box -->

		</div>
		<!-- //contents -->
	</article>
</main>
<!-- //main.colgroup -->
