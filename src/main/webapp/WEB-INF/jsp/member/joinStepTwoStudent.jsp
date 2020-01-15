<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
    <script>

	  	$(document).ready(function() {
	  		commonPopupSet('addr');

	  		var chk = true;
	  		var chk2 = true;
	  		var chk3 = true;
	  		var chk4 = true;
	  		var chk5 = true;

	  		fnSetDaySelecteBox("birthDay");//day selectBox
	  		fnSetMonthSelecteBox("birthMonth");//day selectBox
	  		fnSetYearSelecteBox("birthYear");


	  		//user division
	  		if(fnNvlCheck("${param.userAuthCd}")) {
	  			chk = false;
	  		}

	  		console.log("userAuthCd="+"${param.userAuthCd}");

			if(fnNvlCheck("${param.emailNtceAgreeYn}")) {
	  			chk2 = false;
	  		}

			if(fnNvlCheck("${param.membTacAgreeYn}")) {
	  			chk3 = false;
	  		}

			if(fnNvlCheck("${param.privateInfoCollctAgreeYn}")) {
	  			chk4 = false;
	  		}

			if(fnNvlCheck("${param.infoProvdInfoAgreeYn}")) {
	  			chk5 = false;
	  		}


			if(!chk || !chk2 || !chk3 || !chk4 || !chk5) {//회원강비 스텝원에 값이 없을경우,join step on not info
				alertify.alert("<spring:message code="errors.wrong.approach.msg"/>", function (e){
					fnGoMain();
				});
			}

			//fnTestDefaultData();


		});


	  	function fnSave() {
			//사용자명,user name
			if($("#userNmKh").val() == "") {
				alertify.alert("<spring:message code="login.findId.errors.name"/>", function (e){
					$("#userNmKh").focus();
				});
				return false;
			}

			//사용자이메일,user email
			if (!fnCheckEmail($("#userEmail").val())) {
				alertify.alert("<spring:message code="login.stop.errors.email"/>", function (e){
					$("#userEmail").focus();
				});

				return false;
			}

			//이메일 중복체크,user email duplication check
			if ($("#userEmailDupYn").val() != "Y") {
				alertify.alert("<spring:message code="member.join.step.two.errors.msg2"/>", function (e){
					$("#userEmailBtn").focus();
				});

				return false;
			}

			//휴대푠번호 user cell phone check
			if ($("#userCell").val() == "") {
				alertify.alert("<spring:message code="login.stop.errors.cell"/>", function (e){
					$("#userCell").focus();
				});

				return false;
			}

			//휴대푠번호 중복체크,user cell phone duplication check
			if ($("#userCellDupYn").val() != "Y") {
				alertify.alert("<spring:message code="member.join.step.two.errors.msg3"/>", function (e){
					$("#userCellBtn").focus();
				});

				return false;
			}

			//본인인증 이메일,sms 선택여부,email,sms choice check
			if(!$("input:radio[name='confirmDiv']").is(":checked")) {
				alertify.alert("<spring:message code="member.join.step.two.errors.msg4"/>", function (e){
					$("input:radio[name='confirmDiv']").focus();
				});

				return false;
			}

			//인증번호 받았는지 확인,certify number check
			if ($("#certifyNo").val() == "") {
				alertify.alert("<spring:message code="member.join.step.two.errors.msg5"/>", function (e){
					$("#confirmDivBtn").focus();
				});

				return false;
			}

			//본인인증 확인,certify number check
			if($("#vfnNum").val() == "") {
				alertify.alert("<spring:message code="member.join.step.two.errors.msg6"/>", function (e){
					$("#vfnNum").focus();
				});

				return false;
			}

			//본인인증 확인,certify number check
			if ($("#vfnNumYn").val() != "Y") {
				alertify.alert("<spring:message code="member.join.step.two.errors.msg7"/>", function (e){
					$("#vfnNumBtn").focus();
				});

				return false;
			}

			//비밀번호,pwd check
			if($("#userPwd").val() == "") {
				alertify.alert("<spring:message code="login.errors.msg.pwd2"/>", function (e){
					$("#userPwd").focus();
				});

				return false;
			}


			//비밀번호 유효성,pwd validation
			if(!fnCheckPassword($("#userPwd").val())) {//validate pwd
				alertify.alert("<spring:message code="login.errors.msg.pwd"/>", function (e){
					$("#userPwd").val("");
					$("#userPwd").focus();
				});
				return false;
			}

			//비밀번호확인,pwd confirm check
			if($("#cfmPwd").val() == "") {
				alertify.alert("<spring:message code="login.errors.msg.pwd2"/>", function (e){
					$("#cfmPwd").focus();
				});

				return false;
			}

			//비밀번호 확인 체크,pwd,confirm pwd check
			if($("#userPwd").val() != $("#cfmPwd").val()) {
				alertify.alert("<spring:message code="login.errors.msg.pwdChg.notEqual"/>", function (e){
					$("#cfmPwd").focus();
				});

				return false;
			}

			//gender check
			if(!$("input:radio[name='genderCd']").is(":checked")) {
				alertify.alert("<spring:message code="member.join.step.two.errors.msg8"/>", function (e){
					$("input:radio[name='genderCd']").focus();
				});

				return false;
			}

			//birth check
			if($("#birthDay").val() == "") {
				alertify.alert("<spring:message code="member.join.step.two.errors.msg9"/>", function (e){
					$("#birthDay").focus();
				});

				return false;
			}

			//birth check
			if($("#birthMonth").val() == "") {
				alertify.alert("<spring:message code="member.join.step.two.errors.msg9"/>", function (e){
					$("#birthMonth").focus();
				});

				return false;
			}

			//birth check
			if($("#birthYear").val() == "") {
				alertify.alert("<spring:message code="member.join.step.two.errors.msg9"/>", function (e){
					$("#birthYear").focus();
				});

				return false;
			}

			$("#birth").val($("#birthYear").val()+$("#birthMonth").val()+$("#birthDay").val());

			console.log("birth="+$("#birth").val());

			//address check
			if($("#addrCd").val() == "") {
				alertify.alert("<spring:message code="member.join.step.two.errors.msg10"/>", function (e){
					$("#addrCdBtn").focus();
				});

				return false;
			}

			//address check
			if($("#addrDtl").val() == "") {
				alertify.alert("<spring:message code="member.join.step.two.errors.msg11"/>", function (e){
					$("#addrDtl").focus();
				});

				return false;
			}

			$.ajax({
				url: "${pageContext.request.contextPath}/member/joinProcessAjax.do",
				type: 'post',
				data: $("#frm").serialize(),
				datatype: 'json'
			})
			.done(function(data) {
				if (data.result.successYn == "Y") {
					fnGoJoinComplate();
				} else {
					var msg = "<spring:message code="member.join.step.three.errors.join.fail"/>";
					if(data.result.statCd == "01") {
						msg = "<spring:message code="member.join.step.two.errors.email.dup"/>";
					} else if(data.result.statCd == "02") {
						msg = "<spring:message code="member.join.step.two.errors.cell.dup"/>";
					}
					alertify.alert(msg);
				}

			})
			.fail(function(xhr, status, errorThrown) {
				alertify.alert("<spring:message code="errors.ajax.fail"/>");
			});

	  	}


	  	//인증번호 얻어오기,get certify number
	  	function fnCertifyNo() {

	  		if(!$("input:radio[name='confirmDiv']").is(":checked")) {
				alertify.alert("<spring:message code="member.join.step.two.errors.msg4"/>", function (e){
					$("input:radio[name='confirmDiv']").focus();
				});

				return false;
			}

	  		var val = $("input:radio[name='confirmDiv']").val();

			if (!fnCheckEmail($("#userEmail").val())) {
				alertify.alert("<spring:message code="login.stop.errors.email"/>", function (e){
					$("#userEmail").focus();
				});

				return false;
			}

			if ($("#userEmailDupYn").val() != "Y") {
				alertify.alert("<spring:message code="member.join.step.two.errors.msg2"/>", function (e){
					$("#userEmailBtn").focus();
				});

				return false;
			}


			if ($("#userCell").val() == "") {
				alertify.alert("<spring:message code="login.stop.errors.cell"/>", function (e){
					$("#userCell").focus();
				});

				return false;
			}

			if ($("#userCellDupYn").val() != "Y") {
				alertify.alert("<spring:message code="member.join.step.two.errors.msg3"/>", function (e){
					$("#userCellBtn").focus();
				});

				return false;
			}



	  		var data = {
	  			sendDivision: val,
	  			userEmail: $("#userEmail").val(),
	  			userCell: $("#userCell").val()
	  		}

	  		$.ajax({
	  			url: contextPath + "/common/getCertifyNoAjax.do",
	  			method: METHOD_POST,
	  			data: data,
	  			dataType: AJAX_DATA_TYPE_JSON
	  		})
	  		.done(function(data) {
	  			var msg = "<spring:message code="login.stop.msg.email"/>";//email
	  			if($("input:radio[name='confirmDiv']").val() == "S") {//sms
	  				msg = "<spring:message code="login.stop.msg.sms"/>";
	  			}

				alertify.alert(msg+"  " + "현재 이메일 sms 발송불가 인증번호는 "+data.result.certifyNo, function (e){

				});


	  			$("#certifyNo").val(data.result.certifyNo);
	  		})
	  		.fail(function(xhr, status, errorThrown) {
	  			alertify.alert("<spring:message code="errors.ajax.fail"/>");
	  		})
	  	}


	  	//본인인증 확인,certify confirm
	  	function fnCertifyConfirm() {
			if($("#vfnNum").val() == "") {
				alertify.alert("<spring:message code="member.join.step.two.errors.msg6"/>", function (e){
					$("#vfnNum").focus();
				});
				$("#vfnNumYn").val("N");
				return false;
			}

			if ($("#vfnNum").val() != $("#certifyNo").val()) {
				alertify.alert("<spring:message code="login.stop.errors.verification.fail"/>", function (e){
					$("#vfnNumBtn").focus();
				});
				$("#vfnNumYn").val("N");
				return false;
			}
			alertify.alert("<spring:message code="member.join.step.two.msg.certify.ok"/>");

			$("#vfnNumYn").val("Y");


	  	}


		function fnSetAddr(json) {
			//console.log("============json="+JSON.stringify(json));
			$("#addrFullNm").val(json.commonFullNm);
			$("#addrFullCd").val(json.commonFullCd);
			$("#addrDtl").val(json.commonFullNm);
			$("#addrCd").val(json.commonCd);
		}



	  	function fnTestDefaultData() {
	  		$("#userNmKh").val("권순택학생");
	  		$("#userNmEn").val("STUDENTKWON");
	  		$("#userEmail").val("student1@gmail.com");
	  		$("#userEmailDupYn").val("Y");
	  		$("#userCell").val("091962851");
	  		$("#userCellDupYn").val("Y");

	  		$('input:radio[name=confirmDiv]:input[value=E]').attr("checked", true);
	  		$("#vfnNum").val("123456");
	  		$("#certifyNo").val("123456");
	  		$("#vfnNumYn").val("Y");


	  		$("#userPwd").val("!Qwer1234");
	  		$("#cfmPwd").val("!Qwer1234");
	  		$('input:radio[name=genderCd]:input[value=GEN0000000001]').attr("checked", true);
	  		$("#birthDay").val("02");
	  		$("#birthMonth").val("02");
	  		$("#birthYear").val("2010");
	  		$("#birth").val("20190202");
	  		$("#addrDtl").val("street 315 de castle diamond");



	  	}

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
	       	<div id="contents" class="memberJoinStepTwo">
				<div class="signup_process">
					<ul class="clearfix">
					<li><span><spring:message code="member.join.msg.step"/></span></li>
					<li class="active"><span title="Current Status"><spring:message code="member.join.msg.step2"/></span></li>
					<li><span><spring:message code="member.join.msg.step3"/></span></li>
					</ul>
				</div>

				<div class="bbs_basic">
					<form id="frm" name="frm" action="${pageContext.request.contextPath}/member/joinProcessAjax.do" method="post">
						<input type="hidden" id="userAuthCd" name="userAuthCd" value="${param.userAuthCd}"/>
						<input type="hidden" id="emailNtceAgreeYn" name="emailNtceAgreeYn" value="${param.emailNtceAgreeYn}"/>
						<input type="hidden" id="membTacAgreeYn" name="membTacAgreeYn" value="${param.membTacAgreeYn}"/>
						<input type="hidden" id="privateInfoCollctAgreeYn" name="privateInfoCollctAgreeYn" value="${param.privateInfoCollctAgreeYn}"/>
						<input type="hidden" id="infoProvdInfoAgreeYn" name="infoProvdInfoAgreeYn" value="${param.infoProvdInfoAgreeYn}"/>
						<input type="hidden" id="vNumber" name="vNumber"/>
						<input type="hidden" id="addrCd" name="addrCd" value=""/>
						<input type="hidden" id="addrFullCd" name="addrFullCd" value=""/>
						<input type="hidden" id="addrFullNm" name="addrFullNm" value=""/>
						<input type="hidden" id="userEmailDupYn" name="userEmailDupYn"/>
						<input type="hidden" id="userCellDupYn" name="userCellDupYn"/>
						<input type="hidden" id="certifyNo" name="certifyNo"/>
						<input type="hidden" id="vfnNumYn" name="vfnNumYn"/>
						<input type="hidden" id="birth" name="birth"/>
						<fieldset>
							<legend>Write a post</legend>
							<h3 class="margin_b_0"><spring:message code="member.join.step.two.msg"/></h3>
							<div class="bbs_write_top table_unit"><span><span class="exactly y"><spring:message code="member.join.msg.required"/></span><spring:message code="member.join.msg.required"/></span></div>
							<table class="bbs_table write">
								<caption>Account info Write</caption>
								<colgroup>
									<col style="width:20%;" />
									<col style="width:80%;" />
								</colgroup>
								<tbody>
								<tr>
									<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <label for="userNmKh"><spring:message code="search.name"/></label></th>
									<td><input type="text" id="userNmKh" name="userNmKh" maxlength="20" /></td>
								</tr>
								<tr>
									<th scope="row"><span class="exactly"><spring:message code="member.join.msg.required"/></span> <label for="userNmEn"><spring:message code="member.join.step.two.msg.nm.eng"/></label></th>
									<td><input type="text" id="userNmEn" name="userNmEn" maxlength="50" /></td>
								</tr>
								<tr>
									<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <label for="userEmail"><spring:message code="login.stop.email"/></label></th>
									<td>
										<input type="text" id="userEmail" name="userEmail" maxlength="100"/>
										<button type="button" id="userEmailBtn" class="btn check noround" onclick="javascript:fnUserEmailDupChk('userEmail','userEmailDupYn');"><spring:message code="member.join.step.two.msg.duplication"/></button>
									</td>
								</tr>
								<tr>
									<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <label for="userCell"><spring:message code="login.findId.cell"/></label></th>
									<td>
										<input type="text" id="userCell" name="userCell" maxlength="15" onKeyPress="return fnCheckNumber(event);"/>
										<button type="button" id="userCellBtn" class="btn check noround" onclick="javascript:fnUserCellPhoneDupChk('userCell','userCellDupYn');"><spring:message code="member.join.step.two.msg.duplication"/></button>
									</td>
								</tr>
								<tr>
									<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="login.stop.btn.confirm"/></th>
									<td>
										<span class="bbs_input_box">
											<input type="radio" name="confirmDiv" id="confirmDiv_1" value="E" />
											<label for="confirmDiv_1"><spring:message code="login.stop.email"/></label>
										</span>
										<span class="bbs_input_box">
											<input type="radio" name="confirmDiv" id="confirmDiv_2" value="S"  />
											<label for="confirmDiv_2"><spring:message code="login.stop.sms"/></label>
										</span>
										<button type="button" id="confirmDivBtn" class="btn check noround" onclick="javascript:fnCertifyNo()"><spring:message code="login.stop.btn.confirm2"/></button>
									</td>
								</tr>
								<tr>
									<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <label for="vfnNum"><spring:message code="member.join.step.two.msg.confirm"/></label></th>
									<td>
										<input type="text" id="vfnNum" name="vfnNum" maxlength="6" placeHolder="<spring:message code="eduTrnng.msg7"/>"/>
										<button type="button" id="vfnNumBtn" class="btn check noround" onclick="javascript:fnCertifyConfirm()"><spring:message code="login.stop.btn.confirm2"/></button>
									</td>
								</tr>
								<tr>
									<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <label for="userPwd"><spring:message code="login.pwd"/></label></th>
									<td>
										<input type="password" id="userPwd" name="userPwd" maxlength="15"  />
										<p class="bbs_description"><spring:message code="login.pwd.over.msg2"/></p>
									</td>
								</tr>
								<tr>
									<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <label for="cfmPwd"><spring:message code="login.pwd.over.confirm.pwd"/></label></th>
									<td>
										<input type="password" id="cfmPwd" name="cfmPwd" maxlength="15" />
									</td>
								</tr>
								</tbody>
							</table>
							<!-- //bbs_table write -->
							<p class="warning small margin_b_30"><spring:message code="member.join.step.two.msg2"/></p>

							<h3><spring:message code="member.join.step.two.msg3"/></h3>
							<table class="bbs_table write">
								<caption>Persmnal Info Write</caption>
								<colgroup>
									<col style="width:20%;" />
									<col style="width:80%;" />
								</colgroup>
								<tbody>
								<tr>
									<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="member.join.step.two.msg4"/></th>
									<td>
										<span class="bbs_input_box">
											<input type="radio" name="genderCd" id="genderCd_1" value="GEN0000000001" />
											<label for="genderCd_1"><spring:message code="member.join.step.two.msg.man"/></label>
										</span>
										<span class="bbs_input_box">
											<input type="radio" name="genderCd" id="genderCd_2" value="GEN0000000002" />
											<label for="genderCd_2"><spring:message code="member.join.step.two.msg.woman"/></label>
										</span>
									</td>
								</tr>
								<tr>
									<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="member.join.step.two.msg5"/></th>
									<td>
										<span class="bbs_date">
											<select id="birthDay" name="birthDay" title="day">
												<option value=""><spring:message code="member.join.msg.choice"/></option>
											</select>
											<label for="birthDay"><spring:message code="member.join.step.two.msg.day"/></label>
										</span>
										<span class="bbs_date">
											<select id="birthMonth" name="birthMonth" title="month">
												<option value=""><spring:message code="member.join.msg.choice"/></option>
											</select>
											<label for="birthMonth"><spring:message code="member.join.step.two.msg.month"/></label>
										</span>
										<span class="bbs_date">
											<select id="birthYear" name="birthYear" title="year">
												<option value=""><spring:message code="member.join.msg.choice"/></option>
											</select>
											<label for="birthYear"><spring:message code="member.join.step.two.msg.year"/></label>
										</span>
									</td>
								</tr>
								<tr>
									<th scope="row"><span class="exactly"></span> <label for="nid"><spring:message code="member.join.step.two.msg6"/></label></th>
									<td><input type="text" id="nid" name="nid" maxlength="15" /></td>
								</tr>
								<tr>
									<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <label for="addrDtl"><spring:message code="member.join.step.two.msg7"/> <br /><spring:message code="member.join.step.two.msg8"/></label></th>
									<td>
										<div class="bbs_address">
											<button type="button" id="addrCdBtn" onclick="callback(fnSetAddr, 'addr')" class="btn srch noround popup_addr"><spring:message code="member.join.step.two.msg9"/></button>
											<span id="addrBasic"></span>
											<br />
											<input type="text" id="addrDtl" name="addrDtl" class="popAddr_input" maxlength="100"/>
										</div>
										<p class="bbs_description"><spring:message code="member.join.step.two.msg10"/></p>
									</td>
								</tr>
								</tbody>
							</table>
							<!-- //bbs_table write -->

							<div class="box_center">
								<a href="javascript:fnGoMain();" class="btn type2 margin_r_5"><spring:message code="member.join.btn.cancel"/></a>
								<input type="button" onclick="fnSave();" class="btn type1" value="<spring:message code="login.btn.signUp"/>" />
							</div>

						</fieldset>
					</form>
				</div>

			</div>
	    	<!-- //contents -->
	    </article>
	</main>
	<!-- //main.colgroup -->


