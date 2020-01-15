<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
    <script src="${pageContext.request.contextPath}/js/pageLib/login/login.js"></script>
    <script>
		$(function() {
			if("<c:out value="${param.userAuthCd}"/>" == USER_AUTH_CD_USER) {
				fnSetDivUser(USER_AUTH_CD_USER,"tabLi1");
			} else if("<c:out value="${param.userAuthCd}"/>" == USER_AUTH_CD_STDIT) {
				fnSetDivUser(USER_AUTH_CD_STDIT,"tabLi2");
			} else if("<c:out value="${param.userAuthCd}"/>" == USER_AUTH_CD_CMPNY) {
				fnSetDivUser(USER_AUTH_CD_CMPNY,"tabLi3");
			} else if("<c:out value="${param.userAuthCd}"/>" == USER_AUTH_CD_TRNCT) {
				fnSetDivUser(USER_AUTH_CD_TRNCT,"tabLi4");
			} else {
				fnSetDivUser(USER_AUTH_CD_USER,"tabLi1");
			}



			$("#frm").ajaxForm({
				dataType : AJAX_DATA_TYPE_JSON,
				beforeSubmit : function(formData, $form, options) {

					if($("#userAuthCd").val() == USER_AUTH_CD_USER || $("#userAuthCd").val() == USER_AUTH_CD_STDIT) {//public,student user

						if ($("#userNm").val() == "") {
							alertify.alert("<spring:message code="login.findId.errors.name"/>", function (e){
								$("#userNm").focus();
							});

							return false;
						}

						if ($("#userEmail").val() == "") {
							alertify.alert("<spring:message code="login.errors.msg.id"/>", function (e){
								$("#userEmail").focus();
							});

							return false;
						}


					} else {//company trunc user
						if ($("#mngerNm").val() == "") {
							alertify.alert("<spring:message code="login.findId.errors.charge.name"/>", function (e){
								$("#mngerNm").focus();
							});

							return false;
						}

						if ($("#userEmail2").val() == "") {
							alertify.alert("<spring:message code="login.errors.msg.id"/>", function (e){
								$("#userEmail2").focus();
							});

							return false;
						}

						if ($("#regNum").val() == "") {
							alertify.alert("<spring:message code="login.findId.errors.regNum"/>", function (e){
								$("#regNum").focus();
							});

							return false;
						}
					}

				},
				success : function(json, statusText, xhr, $form) {
					if (json.result.successYn == "Y") {
						$("#findPwdLayer").hide();
						$("#findPwdLayer2").hide();
						alert("=====현재 이메일,sms발송 불가 인증번호="+json.result.certify);
						$("#vNumber").val(json.result.certify);

						if($("#userAuthCd").val() == USER_AUTH_CD_USER || $("#userAuthCd").val() == USER_AUTH_CD_STDIT) {//public,student user
							$("#userEmail3").val($("#userEmail").val());
						} else {
							$("#userEmail3").val($("#userEmail2").val());
						}
						$("#findPwdResult").show();


					} else {
						if(json.result.statCd == "01") {//no data
							alertify.alert("<spring:message code="login.findId.no.data"/>");
						}
					}

				},
				error : function(xhr) {
					alertify.alert("<spring:message code="errors.ajax.fail"/>");
				}
			});




			$("#chgPwdForm").ajaxForm({
				dataType : AJAX_DATA_TYPE_JSON,
				beforeSubmit : function(formData, $form, options) {
					if($("#vfnNum").val() == "") {
						alertify.alert("<spring:message code="login.stop.msg.verification"/>", function (e){
							$("#vfnNum").focus();
						});

						return false;
					}

					if($("#vfnNum").val() != $("#vNumber").val()) {
						alertify.alert("<spring:message code="login.stop.errors.verification.fail"/>", function (e){
							$("#vfnNum").val("");
							$("#vfnNum").focus();
						});

						return false;
					}

					if($("#newPwd").val() == "") {
						alertify.alert("<spring:message code="login.errors.msg.pwd2"/>", function (e){
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
						alertify.alert("<spring:message code="login.findPwd.msg3"/>", function (e){
							fnGoMain();
						});
					} else {
						alertify.alert("<spring:message code="login.errors.msg.pwd3"/>");
					}
				},
				error : function(xhr) {
					alertify.alert("<spring:message code="errors.ajax.fail"/>");
				}
			});

		});


		function fnSetStopDiv(val) {
			$("#stopDiv").val(val);
		}


		function fnRestFindPwd() {
			$("#vfnNum").val("");
			$("#newPwd").val("");
			$("#cfmPwd").val("");
		}

		function fnSetDivUser(val,tablId) {
			$("#userAuthCd").val(val);
			fnHideTablAll();
			$("#"+tablId).addClass("on");
			$("#findPwdResult").hide();//계정찾기 결과 레이어

			if(tablId == "tabLi1" || tablId == "tabLi2") {
				$("#findPwdLayer").show();
				$("#findPwdLayer2").hide();
			} else {
				$("#findPwdLayer").hide();
				$("#findPwdLayer2").show();
			}

		}

		function fnHideTablAll() {
			$("#tabLi1").removeClass("on");
			$("#tabLi2").removeClass("on");
			$("#tabLi3").removeClass("on");
			$("#tabLi4").removeClass("on");
		}

	</script>

	<main class="colgroup" id="colgroup">
		<article>
	    	<header class="sub_head">
				<div class="sub_title">
					<h2>
						<span>
							<spring:message code="login.btn.forgetPwd"/>
						</span>
					</h2>
				</div>
	      	</header>

	       	<div id="contents" class="findPwd">
				<div class="login_tab clearfix">
					<ul class="clearfix">
						<li id="tabLi1"><a onclick="fnSetDivUser(USER_AUTH_CD_USER,'tabLi1');"><spring:message code="member.join.msg.user.nm"/></a></li><!-- 현재 페이지 클래스 on 추가 -->
						<li id="tabLi2"><a onclick="fnSetDivUser(USER_AUTH_CD_STDIT,'tabLi2');"><spring:message code="member.join.msg.student.nm"/> / <spring:message code="member.join.msg.intern"/></a></li>
						<li id="tabLi3"><a onclick="fnSetDivUser(USER_AUTH_CD_CMPNY,'tabLi3');"><spring:message code="member.join.msg.company.nm"/></a></li>
						<li id="tabLi4"><a onclick="fnSetDivUser(USER_AUTH_CD_TRNCT,'tabLi4');"><spring:message code="member.join.msg.education.nm"/></a></li>
					</ul>
				</div>
				<form id="frm" name="frm" action="${pageContext.request.contextPath}/findPwdProcessAjax.do" method="post">
				<input type="hidden" id="userAuthCd" name="userAuthCd" value="${param.userAuthCd}"/>
				<div id="findPwdLayer" style="display:none">
					<fieldset>
						<legend>login.btn.forgetPwd</legend>
						<table class="table type2 title_left">
							<caption>Find account</caption>
							<colgroup>
								<col style="width:20%" />
								<col />
							</colgroup>
							<tbody>
							<tr>
								<th scope="row"><label for="userNm"><spring:message code="search.name"/></label></th>
								<td>
									<input type="text" id="userNm" name="userNm" maxlength="30" />
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="userEmail"><spring:message code="search.id"/></label></th>
								<td>
									<input type="text" id="userEmail" name="userEmail"  maxlength="100"/>
								</td>
							</tr>
							</tbody>
						</table>
						<div class="login_choose">
							<p class="em_blue small">※ <spring:message code="login.findPwd.msg"/> </p>
							<div>
								<input type="radio" id="stopDiv" name="stopDiv" value="M" checked="true" />
								<label for="stopDiv" class="margin_r_10"><spring:message code="login.findId.cell"/></label>
								<input type="radio" id="stopDiv2" name="stopDiv" value="E" />
								<label for="stopDiv2"><spring:message code="login.stop.email"/></label>
							</div>
						</div>
						<div class="box_center">
							<input type="submit" value="<spring:message code="login.btn.forgetPwd"/>" class="btn type1 padding_l_50 padding_r_50" />
						</div>
					</fieldset>
				</div>


				<div id="findPwdLayer2" style="display:none">
					<p class="em_blue small">※ <spring:message code="login.findId.msg.comp"/></p>
						<fieldset>
							<legend>Find account</legend>
							<table class="table type2 title_left">
								<caption>Find account</caption>
								<colgroup>
									<col style="width:20%" />
									<col />
								</colgroup>
								<tbody>
								<tr>
									<th scope="row"><label for="mngerNm"><spring:message code="login.findId.msg.charge"/></label></th>
									<td>
										<input type="text" id="mngerNm" name="mngerNm" maxlength="30" />
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="userEmail2"><spring:message code="search.id"/></label></th>
									<td>
										<input type="text" id="userEmail2" name="userEmail2"  maxlength="100"/>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="regNum"><spring:message code="login.findId.msg.bisNo"/></label></th>
									<td>
										<input type="text" id="regNum" name="regNum" maxlength="30" />
									</td>
								</tr>
								</tbody>
							</table>
							<div class="login_choose">
								<p class="em_blue small">※ <spring:message code="login.findPwd.msg"/>  </p>
								<div>
									<input type="radio" id="stopDiv3" name="stopDiv2" value="M" checked="true" />
									<label for="stopDiv" class="margin_r_10"><spring:message code="login.findId.cell"/></label>
									<input type="radio" id="stopDiv4" name="stopDiv2" value="E" />
									<label for="stopDiv2"><spring:message code="login.stop.email"/></label>
								</div>
							</div>
							<div class="box_center">
								<input type="submit" value="<spring:message code="login.btn.forgetPwd"/>" class="btn type1 padding_l_50 padding_r_50" />
							</div>
						</fieldset>

				</div>
				</form>


				<!-- find passwprd result -->
				<div id="findPwdResult" style="display:none">
					<div class="box type2 icon change_pass">
						<div class="box_wrap">
							<p><spring:message code="login.findPwd.msg2"/>  <br /><span class="em_point"><spring:message code="login.pwd.over.msg2"/></span></p>
						</div>
					</div>
					<!-- <div class="box">
						<div class="box_wrap">
							<p class="blt"><spring:message code="login.findPwd.msg2"/> <br /><spring:message code="login.errors.msg.pwd"/></p>
						</div>
					</div> -->

					<form name="chgPwdForm" id="chgPwdForm" action="${pageContext.request.contextPath}/findPwdChangeAjax.do" method="post">
					<input type="hidden" id="vNumber" name="vNumber"/>
					<input type="hidden" id="userEmail3" name="userEmail3"/>
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
								<th scope="row"><label for="vfnNum"><spring:message code="login.stop.msg.verification2"/></label></th>
								<td>
									<input type="text" id="vfnNum" name="vfnNum" maxlength="6" />
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="newPwd"><spring:message code="login.pwd.over.new.pwd"/></label></th>
								<td>
									<input type="password" id="newPwd" name="newPwd" maxlength="15" />
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
							<input type="submit" value="<spring:message code="login.findPwd.btn.change"/>" class="btn type2 margin_r_5" />
							<input type="button" onclick="fnRestFindPwd();" value="<spring:message code="login.findPwd.btn.cancel"/>" class="btn type1" />
						</div>
					</fieldset>
					</form>
				</div>
				<!-- //find passwprd result -->


			</div>
	    	<!-- //contents -->
	    </article>
	</main>
	<!-- //main.colgroup -->