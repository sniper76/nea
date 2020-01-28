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
	                <li class="on"><a ref="javascript:void(0);" onclick="fnTablChange('INTRO', this);">NEA Information</a></li><!-- 현재 페이지 클래스 on 추가 -->
	                <li><a href="javascript:void(0);" onclick="fnTablChange('VISION', this);">Vision/Mission</a></li>
	                <li><a href="javascript:void(0);" onclick="fnTablChange('GROUP', this);">Organization/Structure</a></li>
	            </ul>
			</div>
			<div class="sub_title">
				<h2><span>About NEA</span></h2>
			</div>
		</header>
		<div id="contents" class="neaIntro">

			<div class="about_nea">
				<div class="top_box">
					<span class="title">About THE</span>
					<div class="cont"><span>N</span>ATIONAL <span>E</span>MPLOYMENT <span>A</span>GENCY</div>
				</div>
				<div class="contents_box">
					<h3>Introduction</h3>
					<p class="margin_b_20">The Royal Government of Cambodia under the wise and wise leadership of Samdech Akka Moha Sena Padei Techo HUN SEN , Prime Minister of the Kingdom of Cambodia, has been paying close attention to the development of the employment and employment sectors. Upgrading and optimizing the labor market as highlighted in the political program as well as in the "Strategic Rectangular Strategy for the Growth of Employment, Equity and Efficiency in Cambodia Phase 3 The National Strategic Development Plan 2014-2018, in particular, is based on Strategy 3, which covers the private sector and employment, as well as the strategy of the Ministry of Labor and Vocational Training. The profession has identified five strategic priorities, including the National Employment Agency (NEA) The third priority strategy is "development of employment and employment".</p>
					<p>As a tool for contributing to the implementation of the above policies as well as public administration reform with the aim of improving public service delivery and in response to the wishes of the people National Employment and Employment (NCDD) »Sub-Decree 67 ANK dated 27 April 2009 Special Operating Agency, which has the role and responsibility to provide employment services and job market information in a convenient, high quality and efficient way to job seekers, employers, trainingproviders. NEA  is under the jurisdiction of the National Training Board headed by H. E. Dr. Ith Samheng, Minister of Labour and Vocational Training. Apart from that, NEA is also a Designated Statistical Unit of the National Training Board by Sub-Decree no. 117 ANKR.BK dated 13 September 2010 on the Collection and Compilation of Labour Market Information which has its roles and esponsibilities to gather, compile and publicly disseminate labour market information as a convenient and single source of information in electronic and paper formats.</p>
				</div>
				<div class="list_box">
					<h3>Leaders</h3>
					<ul class="clearfix">
					<li>
						<div class="box_cont">
							<div class="img_box"><img src="${pageContext.request.contextPath}/images/contents/about_nea_img01.png" alt="His Excellency Dr. Ith Sam Heng image" /></div>
							<div class="cont_box">
								<strong class="name">His Excellency Dr. Ith Sam Heng,</strong>
								<p class="cont">Minister of Labor and Vocational Training, <br />chaired the National Training Committee</p>
							</div>
						</div>
					</li>
					<li>
						<div class="box_cont">
							<div class="img_box"><img src="${pageContext.request.contextPath}/images/contents/about_nea_img02.png" alt="HE Dr. Pich Sophoan image" /></div>
							<div class="cont_box">
								<strong class="name">HE Dr. Pich Sophoan,</strong>
								<p class="cont">Secretary of State, Ministry of Labor and Vocational <br />Training and Vice Chairman of the National Training  Committee</p>
							</div>
						</div>
					</li>
					<li>
						<div class="box_cont">
							<div class="img_box"><img src="${pageContext.request.contextPath}/images/contents/about_nea_img03.png" alt="H.E Hay Hunleng image" /></div>
							<div class="cont_box">
								<strong class="name">H.E Hay Hunleng</strong>
								<p class="cont">Director of National Employment Agency and Member <br />of National Training Committee</p>
							</div>
						</div>
					</li>
					</ul>
				</div>

				<div class="contents_box">
					<h3>Roles and duties</h3>
					<p class="point">In general, the NCAC has the following roles and duties:</p>
					<ul class="bu type3">
					<li>Facilitates and sets up a "job forum" mechanism that involves job seekers, employers and education providers, technical and vocational professionals to exchange information, consult and act in response to labor market conditions.</li>
					<li>Providing job seekers and job market information for job seekers, employers, employers, professional educators and the public to access information effectively and openly.</li>
					<li>Study and develop the labor market information system in line with current and future socio-economic developments</li>
					<li>Promote job market information, job and technical and vocational skills through the NCAC website and other media</li>
					<li>Cooperate with Ministries, Government institutions, development partners, civil society organizations and private enterprises in need of labor and technical and professional skills to make recommendations to the National Training Committee</li>
					<li>Provides specific data on labor market information to facilitate the Royal Government's access to accurate human and labor market development plans to achieve poverty reduction strategies through technical and vocational education and employment. Provide job opportunities to the people.</li>
					</ul>
				</div>
			</div>
			<!-- //about_nea -->

		</div>
		<!-- //contents -->
	</article>
</main>
<!-- //main.colgroup -->
