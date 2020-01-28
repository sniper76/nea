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
	                <li class="on"><a href="javascript:void(0);" onclick="fnTablChange('VISION', this);">Vision/Mission</a></li>
	                <li><a href="javascript:void(0);" onclick="fnTablChange('GROUP', this);">Organization/Structure</a></li>
	            </ul>
			</div>
			<div class="sub_title">
				<h2><span>About NEA</span></h2>
			</div>
		</header>
		<div id="contents" class="neaVision">
			<div class="misstion_box">
				<h3>Mission</h3>
				<ul class="bu type3">
				<li>Provides effective basic employment services, such as matching job seekers and vacancies to optimize the labor market</li>
				<li>Gather information, analyze and disseminate labor market information as the basis for effective employment services and inform policy makers in providing education, training, skills and development.</li>
				<li>Promote the integration of labor force skills with market needs</li>
				</ul>
				<div class="img_box"><img src="${pageContext.request.contextPath}/images/contents/misstion_img.png" alt="mission image" /></div>
			</div>
			<!-- //misstion_box -->

			<div class="direction_box">
				<h3>Direction</h3>
				<p class="point">To achieve this vision, the NEA has laid out the following two main objectives:</p>
				<ul class="clearfix">
				<li>
					<div class="contents_box">
						<p class="cont">Enhance quality and efficiency of service delivery and employment services to meet the needs of service users</p>
					</div>
				</li>
				<li>
					<div class="contents_box">
						<p class="cont">Strengthen the mechanism of dissemination and development of labor market information system</p>
					</div>
				</li>
				</ul>
			</div>
			<!-- //direction_box -->

		</div>
		<!-- //contents -->
	</article>
</main>
<!-- //main.colgroup -->
