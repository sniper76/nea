<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
    <script>
    	$(document).ready(function() {

    	});


		function fnWithdrawal() {
			if(!$("input:checkbox[name='agree']").is(":checked")) {
				alertify.alert("<spring:message code="mypage.private.member.errors.msg"/>", function (e){
					$("input:checkbox[name='agree']").focus();
				});

				return false;
			}

			if($("#userPwd").val() == "") {
				alertify.alert("<spring:message code="login.errors.msg.pwd2"/>", function (e){
					$("#userPwd").focus();
				});

				return false;
			}



			alertify.confirm("<spring:message code="mypage.private.member.errors.msg2"/>", function (e) {
				if (e) {
					$.ajax({
						url: contextPath + "/cpes/all/withdrawalProcessAjax.do",
						type: 'post',
						data: $("#frm").serialize(),
						datatype: 'json'
					})
					.done(function(data) {
						if (data.result.successYn == "Y") {
							alertify.alert("<spring:message code="mypage.private.member.errors.msg3"/>", function (e){
								fnGoMain();
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
			});
		}


		function fnResetForm() {
		    $('#frm')[0].reset();
		}
	</script>
	<main class="colgroup" id="colgroup">
		<article>
	    	<header class="sub_head">
				<div class="sub_title">
					<h2>
						<span><spring:message code="mypage.private.member.title6"/></span>
					</h2>
				</div>
	      	</header>

	       	<div id="contents" class="memberWithdrawal">
			<form id="frm" name="frm" method="post" action="${pageContext.request.contextPath}/withdrawalProcessAjax.do">
				<fieldset>
					<legend>Withdrawal</legend>
					<div class="box type2 icon withdrawal">
						<div class="box_wrap">
							<strong class="title"><spring:message code="mypage.private.member.title7"/></strong>
							<ul class="bu type2">
							<li><spring:message code="mypage.private.member.title8"/></li>
							<li><spring:message code="mypage.private.member.title9"/></li>
							</ul>
						</div>
					</div>
					<div class="agree_box margin_b_30">
						<span>
							<input type="checkbox" id="agree" name="agree" value="Y">
							<label for="agree"><spring:message code="mypage.private.member.title10"/></label>
						</span>
					</div>
					<p class="em_blue small">※<spring:message code="mypage.private.member.title11"/></p>
					<table class="bbs_table title_left">
						<caption>Withdrawal</caption>
						<colgroup>
							<col style="width:20%" />
							<col />
						</colgroup>
						<tbody>
						<tr>
							<th scope="row"><spring:message code="login.id"/></th>
							<td>${userEmail}</td>
						</tr>
						<tr>
							<th scope="row"><label for="userPwd"><spring:message code="login.pwd"/></label></th>
							<td>
								<input type="password" id="userPwd" name="userPwd" maxlength="15"/>
							</td>
						</tr>
						</tbody>
					</table>
					<div class="bbs_btn_wrap">
						<div class="bbs_center">
							<a href="javascript:void(0)" onclick="fnResetForm();" class="bbs_btn type02 padding_l_30 padding_r_30 margin_r_5"><spring:message code="login.findPwd.btn.cancel"/></a>
							<input type="button" onclick="fnWithdrawal();" value="<spring:message code="mypage.private.member.title12"/>" class="bbs_btn type01" />
						</div>
					</div>
				</fieldset>
			</form>
			</div>
	    	<!-- //contents -->
	    </article>
	</main>
	<!-- //main.colgroup -->