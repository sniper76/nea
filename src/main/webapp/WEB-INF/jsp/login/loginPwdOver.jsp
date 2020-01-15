<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
    <script src="${pageContext.request.contextPath}/js/pageLib/login/login.js"></script>
    <script>
		$(function() {
			if("${param.userEmail}" == "" || "${param.userEmail}" == null) {//잘못된 접근(직업 url치고 들어왔는경우 처리)It's a wrong approach
				alertify.alert("<spring:message code="errors.wrong.approach.msg"/>", function (e){
					fnGoMain();
				});
			}

			$("#chgPwdForm").ajaxForm({
				dataType : AJAX_DATA_TYPE_JSON,
				beforeSubmit : function(formData, $form, options) {
					if($("#curPwd").val() == "") {
						alertify.alert("<spring:message code="login.errors.msg.pwd2"/>", function (e){
							$("#curPwd").focus();
						});

						return false;
					}

					if($("#newPwd").val() == "") {
						alertify.alert("<spring:message code="login.errors.msg.pwd2"/>", function (e){
							$("#newPwd").focus();
						});

						return false;
					}

					if($("#curPwd").val() == $("#newPwd").val() ) {
						alertify.alert("<spring:message code="login.errors.msg.pwd4"/>", function (e){
							$("#newPwd").val("");
							$("#newPwd").focus();
						});

						return false;
					}

					if(!fnCheckPassword($("#newPwd").val())) {//validate pwd
						alertify.alert("<spring:message code="login.errors.msg.pwd"/>", function (e){
							$("#newPwd").val("");
							$("#newPwd").focus();
						});
						return false;
					}



					if($("#cfmPwd").val() == "") {
						alertify.alert("<spring:message code="login.errors.msg.pwd2"/>", function (e){
							$("#cfmPwd").focus();
						});

						return false;
					}


					if($("#newPwd").val() != $("#cfmPwd").val()) {
						alertify.alert("<spring:message code="login.errors.msg.pwdChg.notEqual"/>", function (e){
							$("#cfmPwd").focus();
						});

						return false;
					}

				},
				success : function(json, statusText, xhr, $form) {
					if (json.result.successYn == "Y") {
						fnGoMain();
					} else {
						alertify.alert("<spring:message code="login.errors.msg.pwd3"/>");
					}
				},
				error : function(xhr) {
					alertify.alert("<spring:message code="errors.ajax.fail"/>");
				}
			});
		});
	</script>
	<main class="colgroup" id="colgroup">
		<article>
	    	<header class="sub_head">
				<div class="sub_title">
					<h2><span><spring:message code="login.pwd.over.title"/></span></h2>
				</div>
	      	</header>

	       	<div id="contents" class="loginPwdOver">
				<br /><br />
				<div class="line"></div>
				<strong class="em_b_orange"><spring:message code="login.pwd.over.title"/></strong>
				<div class="line"></div>
				<br />

				<div class="box type2 icon change_pass">
					<div class="box_wrap">
						<p>You have not changed your password more than 3 months. <br />Please register your password by <span class="em_point">combining 8-15 characters with capital and small letters,<br /> number, and special characters (!$$%)</span></p>
					</div>
				</div>
				<!-- <div class="box">
					<div class="box_wrap">
						<p class="blt"><spring:message code="login.pwd.over.msg1"/> <br /><spring:message code="login.pwd.over.msg2"/></p>
					</div>
				</div> -->
				<form id="chgPwdForm" name="chgPwdForm" method="post" action="${pageContext.request.contextPath}/pwdChangeAjax.do">
					<input type="hidden" id="userEmail" name="userEmail" value="${param.userEmail}"/>
					<fieldset>
						<legend></legend>
						<table class="table type2 title_left">
							<caption>Quarterly Password Change</caption>
							<colgroup>
								<col style="width:20%" />
								<col />
							</colgroup>
							<tbody>
							<tr>
								<th scope="row"><label for="curPwd"><spring:message code="login.pwd.over.cur.pwd"/></label></th>
								<td>
									<input type="password" id="curPwd" name="curPwd" maxlength="15"/>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="newPwd"><spring:message code="login.pwd.over.new.pwd"/></label></th>
								<td>
									<input type="password" id="newPwd" name="newPwd" maxlength="15"/>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="cfmPwd"><spring:message code="login.pwd.over.confirm.pwd"/></label></th>
								<td>
									<input type="password" id="cfmPwd" name="cfmPwd" maxlength="15"/>
								</td>
							</tr>
							</tbody>
						</table>
						<div class="box_center">
							<a href="javascript:fnGoMain();" class="btn type2 margin_r_5"><spring:message code="login.pwd.over.btn.later"/></a>
							<input type="submit" value="<spring:message code="login.pwd.over.btn.now"/>" class="btn type1" />
						</div>
					</fieldset>
				</form>
			</div>
	    	<!-- //contents -->
	    </article>
	</main>
	<!-- //main.colgroup -->