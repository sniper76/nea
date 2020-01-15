<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
    <script>
    	$(document).ready(function() {
			if("<c:out value="${userExistYn}"/>" == "N") {//사용자가 존재하지않음
				alertify.alert("<spring:message code="login.findId.no.data"/>", function (e){
					fnGoMain();
				});
				return false;
			}

			//이미 구직신청 함
			<c:if test="${!empty result}">
				alertify.alert("<spring:message code="mypage.private.jobsk.title22"/>", function (e){
					fnGoMain();
				});
			</c:if>

			//대표이력서가 없는경우
			<c:if test="${empty result2}">
				alertify.alert("<spring:message code="mypage.private.jobsk.title23"/>", function (e){
					location.href = contextPath + "/cpes/private/resume/list.do";
				});
			</c:if>

    	});

    	function fnSave() {
			if(!$("input:radio[name='nowWorkYn']").is(":checked")) {
				alertify.alert("<spring:message code="mypage.private.jobsk.errors.msg"/>", function (e){
					$("input:radio[name='nowWorkYn']").focus();
				});

				return false;
			}

			if(!$("input:radio[name='urgentJobseekYn']").is(":checked")) {
				alertify.alert("<spring:message code="mypage.private.jobsk.errors.msg2"/>", function (e){
					$("input:radio[name='urgentJobseekYn']").focus();
				});

				return false;
			}

			$.ajax({
				url: contextPath + "/cpes/private/jobsk/writeProcessAjax.do",
				type: 'post',
				data: $("#frm").serialize(),
				datatype: 'json'
			})
			.done(function(data) {
				if (data.result.successYn == "Y") {
					if("${param.pageDiv}" == "INDEX") {
						fnGoMoveUrl("frm","${pageContext.request.contextPath}/cpes/private/jobsk/index.do");
					} else {
						fnGoMoveUrl("frm","${pageContext.request.contextPath}/cpes/private/jobsk/list.do");
					}
				} else {
	 				var msg = "<spring:message code="login.findId.no.data"/>";
					if(data.result.statCd == "02") {
						msg = "<spring:message code="errors.ajax.fail"/>";
					}
					alertify.alert(msg);
				}
			})
			.fail(function(xhr, status, errorThrown) {
				alertify.alert("<spring:message code="errors.ajax.fail"/>");
			});

    	}


	</script>
	<main class="colgroup" id="colgroup">
		<article>
	    	<header class="sub_head">
				<div class="sub_title">
					<h2>
						<span><spring:message code="mypage.private.jobsk.title"/></span>
					</h2>
				</div>
	      	</header>

	       	<div id="contents" class="jobskWrite">
			<form id="frm" name="frm"  method="post">
				<input type="hidden" id="resumeSeq" name="resumeSeq" value="${result2.resumeSeq}"/>
				<input type="hidden" id="resumeTitle" name="resumeTitle" value="${result2.resumeTitle}"/>
				<fieldset>
					<legend>Job application</legend>
					<div class="job_srch_info">
						<div class="title_box">
							<h3><spring:message code="mypage.private.jobsk.title2"/></h3>
							<p><spring:message code="mypage.private.jobsk.title3"/> <br /><spring:message code="mypage.private.jobsk.title4"/></p>
						</div>
						<div class="contents_box">
							<div class="list_box">
								<ul class="clearfix">
									<li>
										<div class="cont_box">
											<strong class="title"><spring:message code="mypage.private.jobsk.title24"/></strong>
											<span class="cont">
												<input type="radio" name="nowWorkYn" id="nowWorkYn_01" value="Y" />
												<label for="nowWorkYn_01"><spring:message code="compny.vacancy.msg.title13"/></label>
												<input type="radio" name="nowWorkYn" id="nowWorkYn_02" value="N" />
												<label for="nowWorkYn_02"><spring:message code="compny.vacancy.msg.title14"/></label>
											</span>
										</div>
									</li>
									<li>
										<div class="cont_box">
											<strong class="title"><spring:message code="mypage.private.jobsk.title25"/></strong>
											<span class="cont">
												<input type="radio" name="urgentJobseekYn" id="urgentJobseekYn_01" value="Y" />
												<label for="urgentJobseekYn_01"><spring:message code="compny.vacancy.msg.title13"/></label>
												<input type="radio" name="urgentJobseekYn" id="urgentJobseekYn_02" value="N" />
												<label for="urgentJobseekYn_02"><spring:message code="compny.vacancy.msg.title14"/></label>
											</span>
										</div>
									</li>
									<li>
										<div class="cont_box">
											<strong class="title"><spring:message code="mypage.private.jobsk.title26"/></strong>
											<span class="cont">
												<p class="text">${result2.resumeTitle}</p>
												<span class="btn_box"><a href="${pageContext.request.contextPath}/cpes/private/resume/list.do" class="bbs_btn small noround"><spring:message code="mypage.private.jobsk.title27"/></a></span>
											</span>
										</div>
									</li>
								</ul>
							</div>

						</div>
					</div>
					<div class="bbs_btn_wrap clearfix">
						<div class="bbs_center">
							<input type="button" onclick="fnSave();" class="bbs_btn type06" value="<spring:message code="mypage.private.jobsk.title12"/>" />
						</div>
					</div>
				</fieldset>
			</form>
			</div>
	    	<!-- //contents -->
	    </article>
	</main>
	<!-- //main.colgroup -->