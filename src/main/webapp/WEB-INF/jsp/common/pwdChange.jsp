<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>

    <script>
    	$(document).ready(function() {

    	});

		function fnResetForm() {
		    $('#frm')[0].reset();
		}

		function fnPwdChange() {
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

			$.ajax({
				url: contextPath + "/cpes/all/pwdChangeProcessAjax.do",
				type: 'post',
				data: $("#frm").serialize(),
				datatype: 'json'
			})
			.done(function(data) {
				if (data.result.successYn == "Y") {
					alertify.alert("<spring:message code="login.pwdsearch.pwdupdate.success"/>", function (e){
						if("<c:out value="${DIV_ROLE}"/>" == "ROLE_USER") {
							location.href = contextPath + "/cpes/private/member/main.do";
						} else if("<c:out value="${DIV_ROLE}"/>" == "ROLE_CMPNY") {
							location.href = contextPath + "/cpes/compny/member/main.do";
						} else if("<c:out value="${DIV_ROLE}"/>" == "ROLE_TRNCT") {
							location.href = contextPath + "/cpes/instt/member/main.do";
						}

					});

				} else {

					if(data.result.statCd == "01") {
						alertify.alert("<spring:message code="login.findId.no.data"/>");
					} else if(data.result.statCd == "03") {
						alertify.alert("<spring:message code="login.errors.msg.pwd3"/>");
					} else  {
						alertify.alert("<spring:message code="errors.ajax.fail"/>");
					}

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
						<span><spring:message code="mypage.private.member.title4"/></span>
					</h2>
				</div>
	      	</header>

	       	<div id="contents" class="memberPwdChange">
				<div class="box type2 icon change_pass">
					<div class="box_wrap">
						<p><spring:message code="login.pwd.over.msg2"/> <br /><spring:message code="mypage.private.member.title5"/></p>
					</div>
				</div>
				<form id="frm" name="frm" method="post" action="${pageContext.request.contextPath}/pwdChangeAjax.do">
					<fieldset>
						<legend>Change Password</legend>
						<table class="bbs_table title_left">
							<caption>Change Password</caption>
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
						<div class="bbs_btn_wrap">
							<div class="bbs_center">
								<a href="javascript:void(0)" onclick="fnResetForm();" class="bbs_btn type02 margin_r_5"><spring:message code="login.findPwd.btn.cancel"/></a>
								<input type="button" onclick="fnPwdChange();" value="<spring:message code="login.findPwd.btn.change"/>" class="bbs_btn type01" />
							</div>
						</div>
					</fieldset>
				</form>
			</div>
	    	<!-- //contents -->
	    </article>
	</main>
	<!-- //main.colgroup -->