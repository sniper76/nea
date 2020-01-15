<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
    <script>
    	$(document).ready(function() {
			fnJoinInfo();//회원가입 안내정보,member join infomation
			//fnJoinStepOne(USER_AUTH_CD_USER);//일반사용자 회원약간 동의,public user agree

		});


		function fnJoinInfo() {
			$.ajax({
				url: contextPath + "/member/joinInfoAjax.do",
				method: METHOD_POST,
				dataType: AJAX_DATA_TYPE_HTML
			})
			.done(function(data) {
				$("#joinInfo").html(data);
			})
			.fail(function(xhr, status, errorThrown) {
				alertify.alert("<spring:message code="errors.ajax.fail"/>");
			})
		}


		function fnJoinStepOne(val) {
			$("#userAuthCd").val(val);
			$("#frm").submit();
			/* url = contextPath + "/member/joinStepOneAjax.do";

			$.ajax({
				url: url,
				data: {userAuthCd:val},
				method: METHOD_POST,
				dataType: AJAX_DATA_TYPE_HTML
			})
			.done(function(data) {
				$("#joinStepOne").html(data);
				$("#userAuthCd").val(val);
			})
			.fail(function(xhr, status, errorThrown) {
				alertify.alert("<spring:message code="errors.ajax.fail"/>");
			}) */
		}

	</script>
	<main class="colgroup" id="colgroup">
		<article>
	    	<header class="sub_head">
				<div class="sub_title">
					<h2>
						<span><spring:message code="login.btn.signUp"/></span>
					</h2>
				</div>
	      	</header>

	       	<div id="contents" class="memberJoin">
				<form id="frm" name="frm" action="${pageContext.request.contextPath}/member/joinStepOne.do" method="post">
					<input type="hidden" id="userAuthCd" name="userAuthCd" value="ROLE_USER" />
				</form>
				<!-- 회원가입 상단 정보 -->
				<div id="joinInfo"></div>
				<!-- //회원가입 상단 정보 -->

				<!-- 1단계  약관동의,one step-->
		<!-- 		<div id="joinStepOne"></div> -->
				<!-- //1단계  약관동의,one step-->

			</div>
	    	<!-- //contents -->
	    </article>
	</main>
	<!-- //main.colgroup -->