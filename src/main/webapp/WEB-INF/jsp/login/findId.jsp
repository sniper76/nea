<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
    <script src="${pageContext.request.contextPath}/js/pageLib/login/login.js"></script>
    <script>
		$(function() {


			$("#frm").ajaxForm({
				dataType : AJAX_DATA_TYPE_JSON,
				beforeSubmit : function(formData, $form, options) {

					//console.log("===========================userAuthCd="+$("#userAuthCd").val());
					if($("#userAuthCd").val() == USER_AUTH_CD_USER || $("#userAuthCd").val() == USER_AUTH_CD_STDIT) {//public,student user
						//console.log("============stopDiv="+$("#stopDiv").val());
						if($("#stopDiv").val() == "M") {//find mobile
							if ($("#mUserNm").val() == "") {
								alertify.alert("<spring:message code="login.findId.errors.name"/>", function (e){
									$("#mUserNm").focus();
								});

								return false;
							}

							if ($("#mUserCell").val() == "") {
								alertify.alert("<spring:message code="login.stop.errors.cell"/>", function (e){
									$("#mUserCell").focus();
								});

								return false;
							}

						} else {//find email
							if ($("#eUserNm").val() == "") {
								alertify.alert("<spring:message code="login.findId.errors.name"/>", function (e){
									$("#eUserNm").focus();
								});

								return false;
							}


							if (!fnCheckEmail($("#eUserEmail").val())) {
								alertify.alert("<spring:message code="login.stop.errors.email"/>", function (e){
									$("#eUserEmail").val("");
									$("#eUserEmail").focus();
								});

								return false;
							}
						}//end find email
					} else {//company trunc user
						if ($("#mngerNm").val() == "") {
							alertify.alert("<spring:message code="login.findId.errors.charge.name"/>", function (e){
								$("#mngerNm").focus();
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
						$("#findIdLayer").hide();
						$("#findIdLayer2").hide();

						$("#resultEmail").html(json.result.userEmail);//find id result open
						$("#findIdResult").show();


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
		});


		function fnSetStopDiv(val) {
			$("#stopDiv").val(val);
		}

		function fnSetDivUser(val,tablId) {
			$("#userAuthCd").val(val);
			fnHideTablAll();
			$("#"+tablId).addClass("on");
			$("#findIdResult").hide();//계정찾기 결과 레이어

			if(tablId == "tabLi1" || tablId == "tabLi2") {
				$("#findIdLayer").show();
				$("#findIdLayer2").hide();
			} else {
				$("#findIdLayer").hide();
				$("#findIdLayer2").show();
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
							<spring:message code="login.findId.title"/>
						</span>
					</h2>
				</div>
	      	</header>

	       	<div id="contents" class="findId">
				<div class="login_tab clearfix">
					<ul class="clearfix">
						<li id="tabLi1" class="on"><a onclick="fnSetDivUser(USER_AUTH_CD_USER,'tabLi1');"><spring:message code="member.join.msg.user.nm"/></a></li><!-- 현재 페이지 클래스 on 추가 -->
						<li id="tabLi2"><a onclick="fnSetDivUser(USER_AUTH_CD_STDIT,'tabLi2');"><spring:message code="member.join.msg.student.nm"/> / <spring:message code="member.join.msg.intern"/></a></li>
						<li id="tabLi3"><a onclick="fnSetDivUser(USER_AUTH_CD_CMPNY,'tabLi3');"><spring:message code="member.join.msg.company.nm"/></a></li>
						<li id="tabLi4"><a onclick="fnSetDivUser(USER_AUTH_CD_TRNCT,'tabLi4');"><spring:message code="member.join.msg.education.nm"/></a></li>
					</ul>
				</div>
				<form id="frm" name="frm" action="${pageContext.request.contextPath}/findIdProcessAjax.do" method="post">
				<div class="other_tab login_tab" id="findIdLayer" style="display:block">

					<input type="hidden" id="userAuthCd" name="userAuthCd" value="ROLE_USER"/>
					<input type="hidden" id="stopDiv" name="stopDiv" value="M"/>
					<div class="button_area">
						<button type="button" onclick="fnSetStopDiv('M');"><spring:message code="login.findId.msg.cell"/></button>
						<button type="button" onclick="fnSetStopDiv('E');"><spring:message code="login.findId.msg.email"/></button>
					</div>
					<div class="contents_area">
						<div class="other_contents">
							<p class="em_blue small">※ <spring:message code="login.findId.msg.cell2"/></p>
							<fieldset>
								<legend><spring:message code="login.findId.title"/></legend>
								<table class="table type2 title_left">
									<caption><spring:message code="login.btn.findId"/></caption>
									<colgroup>
										<col style="width:20%" />
										<col />
									</colgroup>
									<tbody>
									<tr>
										<th scope="row"><label for="mUserNm"><spring:message code="search.name"/></label></th>
										<td>
											<input type="text" id="mUserNm" name="mUserNm" maxlength="50" />
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="mUserCell"><spring:message code="login.findId.cell"/></label></th>
										<td>
											<input type="text" id="mUserCell" name="mUserCell" maxlength="15" onKeyPress="return fnCheckNumber(event);" />
										</td>
									</tr>
									</tbody>
								</table>
								<div class="box_center">
									<input type="submit" value="<spring:message code="login.findId.title"/>" class="btn type1 padding_l_50 padding_r_50" />
								</div>
							</fieldset>
						</div>
						<div class="other_contents">
							<p class="em_blue small">※ <spring:message code="login.findId.msg.email2"/></p>
							<fieldset>
								<legend><spring:message code="login.findId.title"/></legend>
								<table class="table type2 title_left">
									<caption>Find account</caption>
									<colgroup>
										<col style="width:20%" />
										<col />
									</colgroup>
									<tbody>
									<tr>
										<th scope="row"><label for="eUserNm"><spring:message code="search.name"/></label></th>
										<td>
											<input type="text" id="eUserNm" name="eUserNm" />
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="eUserEmail"><spring:message code="login.stop.email"/></label></th>
										<td>
											<input type="text" id="eUserEmail" name="eUserEmail" />
										</td>
									</tr>
									</tbody>
								</table>
								<div class="box_center">
									<input type="submit" value="<spring:message code="login.findId.title"/>" class="btn type1 padding_l_50 padding_r_50" />
								</div>
							</fieldset>

						</div>
					</div>

				</div>




				<div id="findIdLayer2" style="display:none">
					<p class="em_blue small"><spring:message code="login.findId.msg.comp"/></p>


					<fieldset>
						<legend><spring:message code="login.btn.findId"/></legend>
						<table class="table type2 title_left">
							<caption><spring:message code="login.btn.findId"/></caption>
							<colgroup>
								<col style="width:20%" />
								<col />
							</colgroup>
							<tbody>
							<tr>
								<th scope="row"><label for="mngerNm"><spring:message code="login.findId.msg.charge"/></label></th>
								<td>
									<input type="text" id="mngerNm" name="mngerNm" maxlength="30"/>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="regNum"><spring:message code="login.findId.msg.bisNo"/></label></th>
								<td>
									<input type="text" id="regNum" name="regNum" maxlength="30"/>
								</td>
							</tr>
							</tbody>
						</table>
						<div class="box_center">
							<input type="submit" value="<spring:message code="login.findId.title"/>" class="btn type1 padding_l_50 padding_r_50" />
						</div>
					</fieldset>

				</div>
				</form>



				<!-- find id result layer -->
				<div id="findIdResult" style="display:none">
					<div class="em_red margin_b_20"><spring:message code="login.findId.result.msg"/></div>

					<div class="box type3 login_find">
						<div class="box_wrap">
							<p><spring:message code="login.findId.result.msg2"/> <strong id="resultEmail">Hon******@*****.com</strong></p>
						</div>
					</div>
					<div class="box_center">
						<a href="javascript:fnGoLogin();" class="btn type2 padding_l_50 padding_r_50 margin_r_5"><spring:message code="login.title"/></a>
						<a href="javascript:fnGoFindPwd();" class="btn type1"><spring:message code="login.btn.forgetPwd"/></a>
					</div>
				</div>
				<!-- //find id result layer -->

			</div>
	    	<!-- //contents -->
	    </article>
	</main>
	<!-- //main.colgroup -->
