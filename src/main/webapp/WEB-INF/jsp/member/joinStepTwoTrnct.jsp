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



	  		//user division
	  		if(fnNvlCheck("${param.userAuthCd}")) {
	  			chk = false;
	  		}

	  		//console.log("userAuthCd="+"${param.userAuthCd}");

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
			//회사명,company name
			if($("#insttNmKh").val() == "") {
				alertify.alert("<spring:message code="member.join.step.two.trnct.errors.msg"/>", function (e){
					$("#insttNmKh").focus();
				});
				return false;
			}

			//회사명 조직유형,company type
			if($("#insttTypeCd").val() == "") {
				alertify.alert("<spring:message code="member.join.step.two.trnct.errors.msg2"/>", function (e){
					$("#insttTypeCd").focus();
				});
				return false;
			}


			//address check
			if($("#insttAddrCd").val() == "") {
				alertify.alert("<spring:message code="member.join.step.two.trnct.errors.msg3"/>", function (e){
					$("#insttAddrCd").focus();
				});

				return false;
			}

			//address check
			if($("#insttAddrDtl").val() == "") {
				alertify.alert("<spring:message code="member.join.step.two.trnct.errors.msg3"/>", function (e){
					$("#insttAddrDtl").focus();
				});

				return false;
			}

			//담당자명,charge name
			if($("#insttMngerNm").val() == "") {
				alertify.alert("<spring:message code="member.join.step.two.compnay.errors.msg6"/>", function (e){
					$("#insttMngerNm").focus();
				});
				return false;
			}
			$("#userNmKh").val($("#insttMngerNm").val());



			//사용자이메일,user email
			if (!fnCheckEmail($("#insttEmail").val())) {
				alertify.alert("<spring:message code="login.stop.errors.email"/>", function (e){
					$("#insttEmail").focus();
				});

				return false;
			}

			//이메일 중복체크,user email duplication check
			if ($("#insttEmailDupYn").val() != "Y") {
				alertify.alert("<spring:message code="member.join.step.two.errors.msg2"/>", function (e){
					$("#insttEmailBtn").focus();
				});

				return false;
			}
			$("#userEmail").val($("#insttEmail").val());

			//휴대푠번호 user cell phone check
			if ($("#insttCell").val() == "") {
				alertify.alert("<spring:message code="login.stop.errors.cell"/>", function (e){
					$("#insttCell").focus();
				});

				return false;
			}

			//휴대푠번호 중복체크,user cell phone duplication check
			if ($("#insttCellDupYn").val() != "Y") {
				alertify.alert("<spring:message code="member.join.step.two.errors.msg3"/>", function (e){
					$("#insttCellBtn").focus();
				});

				return false;
			}
			$("#userCell").val($("#insttCell").val());

/* 					console.log("================userNmKh="+$("#userNmKh").val());
			console.log("================userCell="+$("#userCell").val());
			console.log("================userEmail="+$("#userEmail").val()); */

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


			//비밀번호확인,pwd confirm check
			if($("#insttOfficeTel").val() == "") {
				alertify.alert("<spring:message code="member.join.step.two.trnct.errors.msg4"/>", function (e){
					$("#insttOfficeTel").focus();
				});

				return false;
			}

			if($("#insttWebsite").val() != "" && !fnValidUrl($("#insttWebsite").val())) {
				alertify.alert("<spring:message code="member.join.step.two.compnay.errors.msg7"/>", function (e){
					$("#insttWebsite").focus();
				});
				return false;
			}

			$.ajax({
				url: "${pageContext.request.contextPath}/member/joinInstitutionProcessAjax.do",
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

	  		var confirmDivVal = $("input:radio[name='confirmDiv']").val();



			if (!fnCheckEmail($("#insttEmail").val())) {
				alertify.alert("<spring:message code="login.stop.errors.email"/>", function (e){
					$("#insttEmail").focus();
				});

				return false;
			}

			if ($("#insttEmailDupYn").val() != "Y") {
				alertify.alert("<spring:message code="member.join.step.two.errors.msg2"/>", function (e){
					$("#insttEmailBtn").focus();
				});

				return false;
			}


			if ($("#insttCell").val() == "") {
				alertify.alert("<spring:message code="login.stop.errors.cell"/>", function (e){
					$("#insttCell").focus();
				});

				return false;
			}

			if ($("#insttCellDupYn").val() != "Y") {
				alertify.alert("<spring:message code="member.join.step.two.errors.msg3"/>", function (e){
					$("insttCellBtn").focus();
				});

				return false;
			}




	  		var data = {
	  			sendDivision: confirmDivVal,
	  			userEmail: $("#insttEmail").val(),
	  			userCell: $("#insttCell").val()
	  		}

	  		$.ajax({
	  			url: contextPath + "/common/getCertifyNoAjax.do",
	  			method: METHOD_POST,
	  			data: data,
	  			dataType: AJAX_DATA_TYPE_JSON
	  		})
	  		.done(function(data) {
	  			var msg = "<spring:message code="login.stop.msg.email"/>";//email
	  			if(confirmDivVal == "S") {//sms
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
			$("#insttAddrDtl").val(json.commonFullNm);
			$("#insttAddrCd").val(json.commonCd);
			$("#insttAddrFullNm").val(json.commonFullNm);
			$("#insttAddrFullCd").val(json.commonFullCd);
		}




	  	function fnTestDefaultData() {
	  		$("#insttNmKh").val("교육기관");
	  		$("#insttNmEn").val("cambodia working ducation center");
	  		$("#insttTypeCd").val("ITC0000000001");
	  		$("#insttRegNum").val("123156789");
	  		$("#insttMngerNm").val("기관담당자");

	  		$("#insttEmail").val("educationTrnct@gmail.com");
	  		$("#insttEmailDupYn").val("Y");
	  		$("#insttCell").val("82000111");
	  		$("#insttCellDupYn").val("Y");


	  		$("#insttAddrCd").val("1234567");
	  		$("#insttAddrDtl").val("street 315 de castle diamond");





	  		$('input:radio[name=confirmDiv]:input[value=E]').attr("checked", true);
	  		$("#vfnNum").val("123456");
	  		$("#certifyNo").val("123456");
	  		$("#vfnNumYn").val("Y");
	  		$("#userPwd").val("!Qwer1234");
	  		$("#cfmPwd").val("!Qwer1234");
	  		$("#insttOfficeTel").val("02000111");
	  		$("#insttWebsite").val("http://www.google.com");

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
					<form id="frm" name="frm" action="${pageContext.request.contextPath}/member/joinInstitutionProcessAjax.do" method="post">
						<input type="hidden" id="userAuthCd" name="userAuthCd" value="${param.userAuthCd}"/>
						<input type="hidden" id="emailNtceAgreeYn" name="emailNtceAgreeYn" value="${param.emailNtceAgreeYn}"/>
						<input type="hidden" id="membTacAgreeYn" name="membTacAgreeYn" value="${param.membTacAgreeYn}"/>
						<input type="hidden" id="privateInfoCollctAgreeYn" name="privateInfoCollctAgreeYn" value="${param.privateInfoCollctAgreeYn}"/>
						<input type="hidden" id="infoProvdInfoAgreeYn" name="infoProvdInfoAgreeYn" value="${param.infoProvdInfoAgreeYn}"/>
						<input type="hidden" id="vNumber" name="vNumber"/>
						<input type="hidden" id="insttAddrCd" name="insttAddrCd" value=""/>
						<input type="hidden" id="insttAddrFullNm" name="insttAddrFullNm" value=""/>
						<input type="hidden" id="insttAddrFullCd" name="insttAddrFullCd" value=""/>
						<input type="hidden" id="insttEmailDupYn" name="insttEmailDupYn"/>
						<input type="hidden" id="insttCellDupYn" name="insttCellDupYn"/>
						<input type="hidden" id="certifyNo" name="certifyNo"/>
						<input type="hidden" id="vfnNumYn" name="vfnNumYn"/>
						<input type="hidden" id="userEmail" name="userEmail"/>
						<input type="hidden" id="userCell" name="userCell"/>
						<input type="hidden" id="userNmKh" name="userNmKh"/>
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
									<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <label for="insttNmKh"><spring:message code="member.join.step.two.trnct.msg"/></label></th>
									<td><input type="text" id="insttNmKh" name="insttNmKh" maxlength="150" /></td>
								</tr>
								<tr>
									<th scope="row"><span class="exactly"></span> <label for="insttNmEn"><spring:message code="member.join.step.two.trnct.msg"/> (<spring:message code="member.join.step.two.msg.nm.eng"/>)</label></th>
									<td><input type="text" id="insttNmEn" name="insttNmEn" maxlength="150" /></td>
								</tr>
								<tr>
									<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <label for="insttTypeCd"><spring:message code="member.join.step.two.trnct.msg2"/></label></th>
									<td>
										<span class="bbs_date">
											<select id="insttTypeCd" name="insttTypeCd">
												<option value=""><spring:message code="member.join.msg.choice"/></option>
												<c:forEach var="commCd" items="${resultList}" varStatus="status">
													<option value="${commCd.dtlCd}">${commCd.cdNm}</option>
												</c:forEach>
											</select>
										</span>
									</td>
								</tr>
								<tr>
									<th scope="row"><span class="exactly"></span> <label for="insttRegNum"><spring:message code="member.join.step.two.trnct.msg4"/></label></th>
									<td><input type="text" id="insttRegNum" name="insttRegNum" maxlength="100" /></td>
								</tr>
								<tr>
									<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <label for="insttAddrDtl"><spring:message code="member.join.step.two.trnct.msg5"/></label></th>
									<td>
										<div class="bbs_address">
											<button type="button" id="insttAddrCdBtn" onclick="callback(fnSetAddr, 'addr');" class="btn srch noround popup_addr"><spring:message code="member.join.step.two.msg9"/></button>
											<span id="addrBasic"></span>
											<br />
											<input type="text" id="insttAddrDtl" name="insttAddrDtl" class="popAddr_input" maxlength="100"/>
										</div>
									</td>
								</tr>
								</tbody>
							</table>
							<!-- //bbs_table write -->

							<h3><spring:message code="member.join.step.two.compnay.msg10"/></h3>
							<table class="bbs_table write">
								<caption>Persmnal Info Write</caption>
								<colgroup>
									<col style="width:20%;" />
									<col style="width:80%;" />
								</colgroup>
								<tbody>
								<tr>
									<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <label for="insttMngerNm"><spring:message code="member.join.step.two.compnay.msg11"/></label></th>
									<td><input type="text" id="insttMngerNm" name="insttMngerNm" maxlength="50" /></td>
								</tr>
								<tr>
									<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <label for="insttEmail"><spring:message code="login.stop.email"/></label></th>
									<td>
										<input type="text" id="insttEmail" name="insttEmail" maxlength="100"/>
										<button type="button" id="insttEmailBtn" class="btn check noround" onclick="javascript:fnUserEmailDupChk('insttEmail','insttEmailDupYn');"><spring:message code="member.join.step.two.msg.duplication"/></button>
									</td>
								</tr>
								<tr>
									<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <label for="insttCell"><spring:message code="login.findId.cell"/></label></th>
									<td>
										<input type="text" id="insttCell" name="insttCell" maxlength="15" onKeyPress="return fnCheckNumber(event);"/>
										<button type="button" id="insttCellBtn" class="btn check noround" onclick="javascript:fnUserCellPhoneDupChk('insttCell','insttCellDupYn');"><spring:message code="member.join.step.two.msg.duplication"/></button>
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
								<tr>
									<th scope="row"><span class="exactly"></span> <label for="insttOfficeTel"><spring:message code="member.join.step.two.trnct.msg6"/></label></th>
									<td><input type="text" id="insttOfficeTel" name="insttOfficeTel" onKeyPress="return fnCheckNumber(event);" maxlength="15"/></td>
								</tr>
								<tr>
									<th scope="row"><span class="exactly"></span> <label for="insttWebsite"><spring:message code="member.join.step.two.compnay.msg15"/></label></th>
									<td><input type="text" id="insttWebsite" name="insttWebsite" maxlength="100"/></td>
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

