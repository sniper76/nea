<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
    <script>

	  	$(document).ready(function() {
	  		//errors.wrong.approach.msg
	  		if(fnNvlCheck("${param.joinYn}")) {
	  			alertify.alert("<spring:message code="errors.wrong.approach.msg"/>", function (e){
					fnGoMain();
				});
	  		}

	  		//console.log("userAuthCd="+"${param.userAuthCd}");

		});
  	</script>
	<main class="colgroup" id="colgroup">
		<article>
	    	<header class="sub_head">
				<div class="sub_title">
					<h2>
						<span>
							<c:choose>
								<c:when test="${param.userAuthCd == 'ROLE_USER'}"><spring:message code="member.join.msg.user.nm"/></c:when>
								<c:when test="${param.userAuthCd == 'ROLE_STDIT'}"><spring:message code="member.join.msg.student.nm"/>/<spring:message code="member.join.msg.intern"/></c:when>
								<c:when test="${param.userAuthCd == 'ROLE_CMPNY'}"><spring:message code="member.join.msg.company.nm"/></c:when>
								<c:when test="${param.userAuthCd == 'ROLE_TRNCT'}"><spring:message code="member.join.msg.education.nm"/></c:when>
								<c:otherwise><spring:message code="member.join.msg.user.nm"/></c:otherwise>
							</c:choose>
							<spring:message code="login.btn.signUp"/>
						</span>
					</h2>
				</div>
	      	</header>
	       	<div id="contents" class="memberJoinStepThree">
				<div class="signup_process">
					<ul class="clearfix">
					<li><span><spring:message code="member.join.msg.step"/></span></li>
					<li><span><spring:message code="member.join.msg.step2"/></span></li>
					<li class="active"><span title="Current Status"><spring:message code="member.join.msg.step3"/></span></li>
					</ul>
				</div>

				<div class="confirm_box">
					<div class="box_wrap">
						<div class="title_box">
							<div class="title">Dear ${param.userNmKh}.</div>
							<div class="cont"><spring:message code="member.join.step.three.msg"/></div>
						</div>
						<div class="cont_box">
							<p class="cont"><spring:message code="member.join.step.three.msg2"/> <br /><spring:message code="member.join.step.three.msg3"/></p>
						</div>
						<div class="put_box">
							<a href="tel:${telNo}" class="call mobile_phone"><spring:message code="member.join.step.three.msg4"/></a>
						</div>
					</div>
				</div>

				<div class="box_center">
					<a href="javascript:fnGoMain();" class="btn type2 padding_l_40 padding_r_40"><spring:message code="login.lock.btn.main"/></a>
				</div>

			</div>
	    	<!-- //contents -->
	    </article>
	</main>
	<!-- //main.colgroup -->



