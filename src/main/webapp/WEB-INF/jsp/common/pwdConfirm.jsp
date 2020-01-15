<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
    <script>
    	$(document).ready(function() {

    	});

		function fnResetForm() {
		    $('#frm')[0].reset();
		}

		function fnPwdConfirm() {
			if($("#userPwd").val() == "") {
				alertify.alert("<spring:message code="login.errors.msg.pwd2"/>", function (e){
					$("#userPwd").focus();
				});

				return false;
			}

			$.ajax({
				url: contextPath + "/cpes/all/pwdConfirmAjax.do",
				type: 'post',
				data: $("#frm").serialize(),
				datatype: 'json'
			})
			.done(function(data) {
				if (data.result.successYn == "Y") {
					var $form = $('<form></form>');
					var url = contextPath;

					if("<c:out value="${DIV_ROLE}"/>" == "ROLE_USER") {
						url = url + "/cpes/private/member/modify.do";
					} else if("<c:out value="${DIV_ROLE}"/>" == "ROLE_CMPNY") {
						url = url + "/cpes/compny/member/modify.do";
					}else if("<c:out value="${DIV_ROLE}"/>" == "ROLE_TRNCT") {
						url = url + "/cpes/instt/member/modify.do";
					}

					$form.attr('action', url);
					$form.attr('method', 'post');
					$form.appendTo('body');

					var cond = "<input type=\"hidden\" name=\"condCertNo\" value=\""+data.result.message+"\">";

					$form.append(cond);
					$form.submit();

				} else {
	 				var msg = "<spring:message code="login.findId.no.data"/>";

	 				if(data.result.statCd == "03") {
						msg = "<spring:message code="security.errors.BadCredentials"/>";
					} else {
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
						<span><spring:message code="login.pwd.over.confirm.pwd"/></span>
					</h2>
				</div>
	      	</header>

	       	<div id="contents" class="memberPwdConfirm">
				<div class="bbs_basic">
					<section class="box_wrap">
						<div class="contents_box">
							<form id="frm" name="frm" method="post">
								<fieldset>
								<!-- 	<legend>Confirm New Password</legend> -->
									<p class="em_blue small">※ <spring:message code="mypage.private.member.title3"/></p>
									<table class="table">
										<caption>Confirm New Password</caption>
										<colgroup>
											<col style="width:30%" />
											<col />
										</colgroup>
										<tbody>
										<tr>
											<th scope="row"><label for="userPwd"><spring:message code="login.pwd"/></label></th>
											<td>
												<input type="password" id="userPwd" name="userPwd" maxlength="20"/>
											</td>
										</tr>
										</tbody>
									</table>
									<div class="bbs_btn_wrap type2">
										<div class="bbs_center">
											<input type="button" onclick="fnPwdConfirm();" value="<spring:message code="login.stop.btn.confirm2"/>" class="bbs_btn type01">
											<button type="button" class="bbs_btn type02" onclick="fnResetForm();"><spring:message code="login.findPwd.btn.cancel"/></button>
										</div>
									</div>
								</fieldset>
							</form>
						</div>
				<!-- 		<button type="button" class="close">close of popup</button> -->
					</section>
				</div>
			</div>
	    	<!-- //contents -->
	    </article>
	</main>
	<!-- //main.colgroup -->