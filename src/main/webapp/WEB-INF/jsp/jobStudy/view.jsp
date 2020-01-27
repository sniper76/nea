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
				<h4 class="title"><spring:message code="counsel.msg.title"/></h4>
			</div>
			<div class="contents_box">
				<div class="list_box">
					<ul>
						<li><c:out value="${result.titleNm }" /></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- //contents_item -->

		<div class="contents_item">
			<div class="title_box">
				<h4 class="title"><spring:message code="jobStudy.occupInc"/></h4>
			</div>
			<div class="contents_box">
				<div class="list_box">
					<ul>
					<li><c:out value="${result.occupIncNm }" /></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="contents_item">
			<div class="title_box">
				<h4 class="title"><spring:message code="jobStudy.occupExc"/></h4>
			</div>
			<div class="contents_box">
				<div class="list_box">
					<ul>
					<li><c:out value="${result.occupExcNm }" /></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="contents_item">
			<div class="title_box">
				<h4 class="title"><spring:message code="jobStudy.note"/></h4>
			</div>
			<div class="contents_box">
				<div class="list_box">
					<ul>
					<li><c:out value="${result.noteNm }" /></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="contents_item">
			<div class="title_box">
				<h4 class="title"><spring:message code="jobStudy.def"/></h4>
			</div>
			<div class="contents_box">
				<div class="list_box">
					<ul>
					<li><c:out value="${result.defNm }" /></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="contents_item">
			<div class="title_box">
				<h4 class="title"><spring:message code="jobStudy.task"/></h4>
			</div>
			<div class="contents_box">
				<div class="list_box">
					<ul>
					<li><c:out value="${result.taskNm }" /></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="contents_item">
			<div class="title_box">
				<h4 class="title"><spring:message code="jobStudy.duties"/></h4>
			</div>
			<div class="contents_box">
				<div class="list_box">
					<ul>
					<li><c:out value="${result.dutiesNm }" /></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="contents_item">
			<div class="title_box">
				<h4 class="title"><spring:message code="jobStudy.skill"/></h4>
			</div>
			<div class="contents_box">
				<div class="list_box">
					<ul>
					<li><c:out value="${result.skillNm }" /></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="contents_item">
			<div class="title_box">
				<h4 class="title"><spring:message code="jobStudy.responsibilities"/></h4>
			</div>
			<div class="contents_box">
				<div class="list_box">
					<ul>
					<li><c:out value="${result.responsibilitiesNm }" /></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="contents_item">
			<div class="title_box">
				<h4 class="title"><spring:message code="jobStudy.eduTrnng"/></h4>
			</div>
			<div class="contents_box">
				<div class="list_box">
					<ul>
					<li><c:out value="${result.eduTrnngNm }" /></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="contents_item">
			<div class="title_box">
				<h4 class="title"><spring:message code="jobStudy.highEdu"/></h4>
			</div>
			<div class="contents_box">
				<div class="list_box">
					<ul>
					<li><c:out value="${result.highEduNm }" /></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="contents_item">
			<div class="title_box">
				<h4 class="title"><spring:message code="jobStudy.majorStudy"/></h4>
			</div>
			<div class="contents_box">
				<div class="list_box">
					<ul>
					<li><c:out value="${result.majorStudyNm }" /></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="contents_item">
			<div class="title_box">
				<h4 class="title"><spring:message code="jobStudy.skillRelatedExp"/></h4>
			</div>
			<div class="contents_box">
				<div class="list_box">
					<ul>
					<li><c:out value="${result.skillRelatedExpNm }" /></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- //contents_item -->

		<div class="contents_item">
			<div class="title_box">
				<h4 class="title"><spring:message code="jobStudy.jobCateCd"/></h4>
			</div>
			<div class="contents_box">
				<div class="cont_box">
					<p><c:out value="${result.jobCateNm }" /></p>
				</div>
			</div>
		</div>
		<!-- //contents_item -->

		<!-- <div class="contents_item">
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
		</div> -->
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