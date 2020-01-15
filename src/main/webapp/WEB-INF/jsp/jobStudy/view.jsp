<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
    <script>
    	$(document).ready(function() {

    	});



	</script>
	<main class="colgroup" id="colgroup">
		<article>
	    	<header class="sub_head">
				<div class="sub_title">
					<h2>
						<span><spring:message code="mypage.compny.vacancy.msg12"/></span>
					</h2>
				</div>
	      	</header>

	       	<div id="contents" class="studyView">
				설명:${result.expln} <br/>
				카테고리:${result.cateNm} <br/>

<div class="dictionary_detail">
	<div class="title_area">
					<form id="frm" name="frm" action="${pageContext.request.contextPath}/jobStudy/list.do" method="post">
						<input type="hidden" id="condSeq" name="condSeq" value="${param.condSeq}"/>
						<input type="hidden" id="condText" name="condText" value="${param.condText}"/>
						<input type="hidden" id="condType" name="condType" value="${param.condType}"/>
					</form>
		<h3 class="title">${result.iscoNm}</h3>
		<div class="cont">
			<span>${result.fullPath}</span>
		</div>
	</div>
	<div class="contents_area">
		<div class="contents_item">
			<div class="title_box">
				<h4 class="title">Tasks to be completed</h4>
			</div>
			<div class="contents_box">
				<div class="list_box">
					<ul>
					<li>Evaluate and manage information</li>
					<li>Evaluate and manage information</li>
					<li>Evaluate and manage information</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- //contents_item -->

		<div class="contents_item">
			<div class="title_box">
				<h4 class="title">Tasks to be completed</h4>
			</div>
			<div class="contents_box">
				<div class="list_box">
					<ul>
					<li>Evaluate and manage information</li>
					<li>Evaluate and manage information</li>
					<li>Evaluate and manage information</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- //contents_item -->

		<div class="contents_item">
			<div class="title_box">
				<h4 class="title">What do agricultural scientists do?</h4>
			</div>
			<div class="contents_box">
				<div class="cont_box">
					<p>Generally, agricultural  scientists research about the plants and animals in the natural environment in which they lives. <br />The research can be conducted in the laboratory or  in the natural environment directly.</p>
				</div>
			</div>
		</div>
		<!-- //contents_item -->

		<div class="contents_item">
			<div class="title_box">
				<h4 class="title">Education and training</h4>
			</div>
			<div class="contents_box">
				<div class="cont_box">
					<p>Agricultural scientists should study a number of major subjects since high school, such as foreign languages, math, biology, physics. <br />Also, you should learn some basic computer skills and other programs.</p>
				</div>
			</div>
		</div>
		<!-- //contents_item -->

		<div class="contents_item">
			<div class="title_box">
				<h4 class="title">Should understand</h4>
			</div>
			<div class="contents_box">
				<div class="cont_box">
					<p>School subjects : Biology and Chemistry <br />Minimum education level :  Bachelor's degree <br />More information should be read for similar specialties : Agribusiness technicians, agricultural engineers, breeding technicians and soil quality technicians.</p>
				</div>
			</div>
		</div>
		<!-- //contents_item -->

		<div class="contents_item">
			<div class="img_list">
				<ul class="clearfix">
				<li>
					<div class="box_img">
						<div class="inner">
							<img src="../../images/template/wait.jpg" alt=" image" />
							<span class="img_zoom"><a href="../../images/template/wait.jpg" target="_blank" title="New window open">View larger image</a></span>
						</div>
					</div>
				</li>
				<li>
					<div class="box_img">
						<div class="inner">
							<img src="../../images/template/wait.jpg" alt=" image" />
							<span class="img_zoom"><a href="../../images/template/wait.jpg" target="_blank" title="New window open">View larger image</a></span>
						</div>
					</div>
				</li>
				<li>
					<div class="box_img">
						<div class="inner">
							<img src="../../images/template/wait.jpg" alt=" image" />
							<span class="img_zoom"><a href="../../images/template/wait.jpg" target="_blank" title="New window open">View larger image</a></span>
						</div>
					</div>
				</li>
				</ul>
			</div>
		</div>
		<!-- //contents_item -->
	</div>
</div>
<!-- //dictionary_detail -->

<div class="bbs_btn_wrap clearfix">
	<div class="bbs_center">
		<a href="javascript:void(0);" onclick="fnGoList('frm');" class="bbs_btn list"><spring:message code="button.list"/></a>
	</div>
</div>
<!-- //bbs_btn_wrap -->

                </div>
			</div>

	    	<!-- //contents -->
	    </article>
	</main>
	<!-- //main.colgroup -->