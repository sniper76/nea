<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
    <script src="${pageContext.request.contextPath}/js/pageLib/login/login.js"></script>
    <script>
		$(function() {
			//alert("${param.userAuthCd}");
		});
	</script>


	<main class="colgroup" id="colgroup">
		<article>
	    	<header class="sub_head">
				<div class="sub_title">
					<h2><span><spring:message code="login.lock.title"/></span></h2>
				</div>
	      	</header>

	       	<div id="contents" class="loginLock">
				<div class="confirm_box type02">
					<div class="box_wrap">
						<div class="title_box">
							<div class="cont"><spring:message code="login.lock.msg1" /></div>
						</div>
						<div class="cont_box">
							<p class="cont"><strong class="em_b_blue"><spring:message code="login.lock.msg2"/></strong> <spring:message code="login.lock.msg3"/><br /><spring:message code="login.lock.msg4"/></p>
							<p class="put em_blue">※<spring:message code="login.lock.msg5"/>(<a href="tel:023884692" class="mobile_phone em_b_blue"><spring:message code="login.lock.phoneNo"/></a>) <spring:message code="login.lock.msg6"/></p>
						</div>
					</div>
				</div>

				<div class="box_center">
					<input type="hidden" id="userAuthCd" name="userAuthCd" value="${param.userAuthCd}"/>
					<a href="javascript:fnGoMain();" class="btn type2 padding_l_40 padding_r_40 margin_r_5"><spring:message code="login.lock.btn.main"/></a>
					<a href="javascript:fnGoFindPwd();" class="btn type1"><spring:message code="login.lock.btn.release"/></a>
				</div>
			</div>
	    	<!-- //contents -->
	    </article>
	</main>
	<!-- //main.colgroup -->
