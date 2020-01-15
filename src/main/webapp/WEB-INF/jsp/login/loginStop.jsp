<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
    <script src="${pageContext.request.contextPath}/js/pageLib/login/login.js"></script>
    <script>
		$(function() {
			//alert("${param.userEmail}");

			if("${param.userEmail}" == "" || "${param.userEmail}" == null) {//잘못된 접근(직업 url치고 들어왔는경우 처리)It's a wrong approach
				alertify.alert("<spring:message code="errors.wrong.approach.msg"/>", function (e){
					fnGoMain();
				});
			}


			$("#frm").ajaxForm({
				dataType : 'json',
				beforeSubmit : function(formData, $form, options) {
					if($("#stopDiv").val() == "S") {
						if ($("#userCell").val() == "") {
							alertify.alert("<spring:message code="login.stop.errors.cell"/>", function (e){
								$("#userCell").focus();
							});

							return false;
						}
					} else {
						if (!fnCheckEmail($("#userEmail").val())) {
							alertify.alert("<spring:message code="login.stop.errors.email"/>", function (e){
								$("#userEmail").val("");
								$("#userEmail").focus();
							});

							return false;
						}
					}

				},
				success : function(json, statusText, xhr, $form) {
					if (json.result.successYn == "Y") {
						alert("=====현재 이메일,sms발송 불가 인증번호="+json.result.certify);
						$("#vNumber").val(json.result.certify);

						var alertMsg = "<spring:message code="login.stop.msg.sms"/>";
						if(json.result.stopDiv == "E") {
							alertMsg = "<spring:message code="login.stop.msg.email"/>";
						}

						alertify.alert(alertMsg, function (e){
							$("#stopChoice").hide();
							$("#stopResult").show();
						});


					} else {
						if(json.statCd == "01") {//비밀번호오류 pwd fail
							alertify.alert("<spring:message code="errors.ajax.fail"/>");
						}
					}
				},
				error : function(xhr) {
					alertify.alert("<spring:message code="errors.ajax.fail"/>");
				}
			});


			//stop user released process
			$("#frm2").ajaxForm({
				dataType : 'json',
				beforeSubmit : function(formData, $form, options) {

					if ($("#vfnNum").val() == "") {
						alertify.alert("<spring:message code="login.stop.msg.verification"/>", function (e){
							$("#vfnNum").focus();
						});

						return false;
					}

					if ($("#vfnNum").val() != $("#vNumber").val()) {
						alertify.alert("<spring:message code="login.stop.errors.verification.fail"/>", function (e){
							$("#vfnNum").val("");
							$("#vfnNum").focus();
						});

						return false;
					}

				},
				success : function(json, statusText, xhr, $form) {
					if (json.result.successYn == "Y") {
						fnGoMain();
					} else {
						alertify.alert("<spring:message code="errors.ajax.fail"/>");
					}
				},
				error : function(xhr) {
					alertify.alert("<spring:message code="errors.ajax.fail"/>");
				}
			});

		});


		//sms,email divistion
		function fnSetStopDiv(val) {
			$("#stopDiv").val(val);
		}
	</script>
	<main class="colgroup" id="colgroup">
		<article>
	    	<header class="sub_head">
				<div class="sub_title">
					<h2><span><spring:message code="login.stop.title"/></span></h2>
				</div>
	      	</header>

	       	<div id="contents" class="loginStop">
				<div class="confirm_box type03 margin_b_40">
					<div class="box_wrap">
						<div class="title_box">
							<div class="cont"><spring:message code="login.stop.msg1"/></div>
							<div class="put"><spring:message code="login.stop.msg2"/></div>
						</div>
						<div class="cont_box">
							<p class="cont"><spring:message code="login.stop.msg3"/><br/><spring:message code="login.stop.msg4"/></p>
						</div>
					</div>
				</div>

				<!-- 인증선택 영역 -->
				<div id="stopChoice">
					<h3><spring:message code="login.stop.msg5"/></h3>
					<div class="tab_menu count2 action">
					    <ul class="clearfix">
					        <li class="on"><a href="#tab_contents1" onclick="fnSetStopDiv('S');"><spring:message code="login.stop.sms"/></a></li>
					        <li><a href="#tab_contents2" onclick="fnSetStopDiv('E');"><spring:message code="login.stop.email"/></a></li>
					    </ul>
					</div>
					<div class="verification_box">
						<form name="frm" id="frm" action="${pageContext.request.contextPath}/loginCertifyAjax.do" method="post">
						<input type="hidden" id="stopDiv" name="stopDiv" value="S"/>
						<div class="box_wrap">
							<div id="tab_contents1" class="tab_contents">

									<fieldset>
										<legend><spring:message code="login.findId.cell"/></legend>
										<label for="userCell"><spring:message code="login.findId.cell"/></label>
										<input type="text" id="userCell" name="userCell" maxlength="15" onKeyPress="return fnCheckNumber(event);"/>
										<button type="submit" class="btn check noround"><spring:message code="login.stop.btn.confirm"/></button>
									</fieldset>

							</div>
							<!-- //tab_contents -->

							<div id="tab_contents2" class="tab_contents">

									<fieldset>
										<legend><spring:message code="login.stop.email"/></legend>
										<label for="userEmail"><spring:message code="login.stop.email"/></label>
										<input type="text" id="userEmail" name="userEmail" maxlength="100" />
										<button type="submit" class="btn check noround"><spring:message code="login.stop.btn.confirm"/></button>
									</fieldset>

							</div>
							<!-- //tab_contents -->
						</div>
						</form>
					</div>
				</div>

				<!-- 인증번호 입력 영역 -->
				<div id="stopResult" style="display:none">
					<h3><spring:message code="login.stop.msg.verification"/></h3>
					<div class="verification_box type02">
						<div class="box_wrap">
							<form name="frm2" id="frm2" action="${pageContext.request.contextPath}/loginStopProcessAjax.do" method="post">
								<input type="hidden" id="vNumber" name="vNumber"/>
								<input type="hidden" id="userEmail2" name="userEmail2" value="${param.userEmail}"/>
								<fieldset>
									<legend>Verification by mobile</legend>
									<label for="Verification_num"><spring:message code="login.stop.msg.verification2"/></label>
									<input type="text" id="vfnNum" name="vfnNum" maxlength="6" />
									<button type="submit" class="btn check noround"><spring:message code="login.stop.btn.confirm2"/></button>
								</fieldset>
							</form>
						</div>
					</div>
				</div>

			</div>
	    	<!-- //contents -->
	    </article>
	</main>
	<!-- //main.colgroup -->