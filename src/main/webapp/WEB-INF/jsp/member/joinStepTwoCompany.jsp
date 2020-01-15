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
			//회사명,company name
			if($("#compnyNm").val() == "") {
				alertify.alert("<spring:message code="member.join.step.two.compnay.errors.msg"/>", function (e){
					$("#compnyNm").focus();
				});
				return false;
			}

			//회사명 조직유형,company type
			if($("#compnyTypeCd").val() == "") {
				alertify.alert("<spring:message code="member.join.step.two.compnay.errors.msg2"/>", function (e){
					$("#compnyTypeCd").focus();
				});
				return false;
			}

			//회사명 조직유형,company type
			if($("#sector").val() == "") {
				alertify.alert("<spring:message code="member.join.step.two.compnay.errors.msg3"/>", function (e){
					$("#sector").focus();
				});
				return false;
			}

			//회사명 조직유형,company type
			if($("#subSector").val() == "") {
				alertify.alert("<spring:message code="member.join.step.two.compnay.errors.msg3"/>", function (e){
					$("#subSector").focus();
				});
				return false;
			}


			var st = $(":input:radio[name=ownerNationCd]:checked").val();

			if(st != "NAT0000000102") {//캄보디아가 아니면,not cambodia
				//회사명 조직유형,company type
				if($("#otherNationCd").val() == "") {
					alertify.alert("<spring:message code="member.join.step.two.compnay.errors.msg5"/>", function (e){
						$("#otherNationCd").focus();
					});
					return false;
				}
			}

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

			//담당자명,charge name
			if($("#mngerNm").val() == "") {
				alertify.alert("<spring:message code="member.join.step.two.compnay.errors.msg6"/>", function (e){
					$("#mngerNm").focus();
				});
				return false;
			}
			$("#userNmKh").val($("#mngerNm").val());



			//사용자이메일,user email
			if (!fnCheckEmail($("#mngerEmail").val())) {
				alertify.alert("<spring:message code="login.stop.errors.email"/>", function (e){
					$("#mngerEmail").focus();
				});

				return false;
			}

			//이메일 중복체크,user email duplication check
			if ($("#mngerEmailDupYn").val() != "Y") {
				alertify.alert("<spring:message code="member.join.step.two.errors.msg2"/>", function (e){
					$("#mngerEmailBtn").focus();
				});

				return false;
			}
			$("#userEmail").val($("#mngerEmail").val());

			//휴대푠번호 user cell phone check
			if ($("#mngerCell").val() == "") {
				alertify.alert("<spring:message code="login.stop.errors.cell"/>", function (e){
					$("#mngerCell").focus();
				});

				return false;
			}

			//휴대푠번호 중복체크,user cell phone duplication check
			if ($("#mngerCellDupYn").val() != "Y") {
				alertify.alert("<spring:message code="member.join.step.two.errors.msg3"/>", function (e){
					$("#mngerCellBtn").focus();
				});

				return false;
			}
			$("#userCell").val($("#mngerCell").val());

			//console.log("================userNmKh="+$("#userNmKh").val());
			//console.log("================userCell="+$("#userCell").val());
			//console.log("================userEmail="+$("#userEmail").val());

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

			if($("#compnyWebsite").val() != "" && !fnValidUrl($("#compnyWebsite").val())) {
				alertify.alert("<spring:message code="member.join.step.two.compnay.errors.msg7"/>", function (e){
					$("#compnyWebsite").focus();
				});
				return false;
			}

			if($("#compnyFacebook").val() != "" && !fnValidUrl($("#compnyFacebook").val())) {
				alertify.alert("<spring:message code="member.join.step.two.compnay.errors.msg8"/>", function (e){
					$("#compnyFacebook").focus();
				});
				return false;
			}

			if($("#subMngerEmail").val() !="") {
				if (!fnCheckEmail($("#subMngerEmail").val())) {
					alertify.alert("<spring:message code="login.stop.errors.email"/>", function (e){
						$("#subMngerEmail").focus();
					});

					return false;
				}
			}

			$.ajax({
				url: "${pageContext.request.contextPath}/member/joinCompanyProcessAjax.do",
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



			if (!fnCheckEmail($("#mngerEmail").val())) {
				alertify.alert("<spring:message code="login.stop.errors.email"/>", function (e){
					$("#mngerEmail").focus();
				});

				return false;
			}

			if ($("#mngerEmailDupYn").val() != "Y") {
				alertify.alert("<spring:message code="member.join.step.two.errors.msg2"/>", function (e){
					$("#mngerEmailBtn").focus();
				});

				return false;
			}


			if ($("#mngerCell").val() == "") {
				alertify.alert("<spring:message code="login.stop.errors.cell"/>", function (e){
					$("#mngerCell").focus();
				});

				return false;
			}

			if ($("#mngerCellDupYn").val() != "Y") {
				alertify.alert("<spring:message code="member.join.step.two.errors.msg3"/>", function (e){
					$("#mngerCellBtn").focus();
				});

				return false;
			}




	  		var data = {
	  			sendDivision: val,
	  			userEmail: $("#mngerEmail").val(),
	  			userCell: $("#mngerCell").val()
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
	  		$("#compnyNmKh").val("캄보디아회사");
	  		$("#compnyNmEn").val("cambodia compnay");
	  		$("#compnyTypeCd").val("ETP0000000006");
	  		$("#mngerEmail").val("company1@gmail.com");
	  		$("#mngerEmailDupYn").val("Y");
	  		$("#mngerCell").val("01210100");
	  		$("#mngerCellDupYn").val("Y");
	  		$("#regNum").val("123156789");
	  		$("#patentNum").val("123156789");
	  		$("#addrCd").val("1234567");
	  		$("#addrDtl").val("street 315 de castle diamond");
	  		$("#mainJobPercent").val("10");
	  		$("#mngerNm").val("반니");
	  		$("#mngerPosition").val("매니저");


	  		$('input:radio[name=confirmDiv]:input[value=E]').attr("checked", true);
	  		$("#vfnNum").val("123456");
	  		$("#certifyNo").val("123456");
	  		$("#vfnNumYn").val("Y");


	  		$("#userPwd").val("!Qwer1234");
	  		$("#cfmPwd").val("!Qwer1234");


	  		$("#mngerTel").val("01010101");
	  		$("#compnyFax").val("01010102");
	  		$("#compnyWebsite").val("http://www.google.com");
	  		$("#compnyFacebook").val("http://www.facebook.com");
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
					<form id="frm" name="frm" action="${pageContext.request.contextPath}/member/joinCompanyProcessAjax.do" method="post">
						<input type="hidden" id="userAuthCd" name="userAuthCd" value="${param.userAuthCd}"/>
						<input type="hidden" id="emailNtceAgreeYn" name="emailNtceAgreeYn" value="${param.emailNtceAgreeYn}"/>
						<input type="hidden" id="membTacAgreeYn" name="membTacAgreeYn" value="${param.membTacAgreeYn}"/>
						<input type="hidden" id="privateInfoCollctAgreeYn" name="privateInfoCollctAgreeYn" value="${param.privateInfoCollctAgreeYn}"/>
						<input type="hidden" id="infoProvdInfoAgreeYn" name="infoProvdInfoAgreeYn" value="${param.infoProvdInfoAgreeYn}"/>
						<input type="hidden" id="vNumber" name="vNumber"/>
						<input type="hidden" id="addrCd" name="addrCd" value=""/>
						<input type="hidden" id="addrFullCd" name="addrFullCd" value=""/>
						<input type="hidden" id="addrFullNm" name="addrFullNm" value=""/>
						<input type="hidden" id="mngerEmailDupYn" name="mngerEmailDupYn"/>
						<input type="hidden" id="mngerCellDupYn" name="mngerCellDupYn"/>
						<input type="hidden" id="certifyNo" name="certifyNo"/>
						<input type="hidden" id="vfnNumYn" name="vfnNumYn"/>
						<input type="hidden" id="userEmail" name="userEmail"/>
						<input type="hidden" id="userCell" name="userCell"/>
						<input type="hidden" id="userNmKh" name="userNmKh"/>
						<fieldset>
							<legend>Write a post</legend>
							<h3 class="margin_b_0"><spring:message code="mypage.compny.profile.title10"/></h3>
							<div class="bbs_write_top table_unit"><span><span class="exactly y"><spring:message code="member.join.msg.required"/></span><spring:message code="member.join.msg.required"/></span></div>
							<table class="bbs_table write">
								<caption>Account info Write</caption>
								<colgroup>
									<col style="width:20%;" />
									<col style="width:80%;" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <label for="compnyNmKh"><spring:message code="member.join.step.two.compnay.msg"/>/<spring:message code="member.join.step.two.compnay.msg2"/></label></th>
										<td><input type="text" id="compnyNmKh" name="compnyNmKh" maxlength="100" /></td>
									</tr>
									<tr>
										<th scope="row"><span class="exactly"></span> <label for="compnyNmEn"><spring:message code="member.join.step.two.compnay.msg"/>/<spring:message code="member.join.step.two.compnay.msg2"/> (<spring:message code="member.join.step.two.msg.nm.eng"/>)</label></th>
										<td><input type="text" id="compnyNmEn" name="compnyNmEn" maxlength="100" /></td>
									</tr>
									<tr>
										<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <label for="compnyTypeCd"><spring:message code="member.join.step.two.compnay.msg"/>/<spring:message code="member.join.step.two.compnay.msg3"/></label></th>
										<td>
											<span class="bbs_date">
												<select id="compnyTypeCd" name="compnyTypeCd">
													<option value=""><spring:message code="member.join.msg.choice"/></option>
													<c:forEach var="commCd" items="${resultList}" varStatus="status">
														<option value="${commCd.dtlCd}">${commCd.cdNm}</option>
													</c:forEach>

												</select>
											</span>
										</td>
									</tr>

									<!-- 아직 정의 안됨 부문-->
									<tr>
										<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="member.join.step.two.compnay.msg7"/></th>
										<td>
											<span class="bbs_date">
												<label for="sector" class="skip">Sector</label>
												<select id="sector" name="sector" title="sector">
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
												</select>
											</span>
											<span class="bbs_date">
												<label for="subSector" class="skip">Sub Sector</label>
												<select id="subSector" name="subSector" title="subSector">
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
												</select>
											</span>
										</td>
									</tr>
									<tr>
										<th scope="row"><span class="exactly"></span> <label for="regNum"><spring:message code="login.findId.msg.bisNo"/></label></th>
										<td><input type="text" id="regNum" name="regNum" maxlength="100"/></td>
									</tr>
									<tr>
										<th scope="row"><span class="exactly"></span> <label for="patentNum"><spring:message code="member.join.step.two.compnay.msg4"/></label></th>
										<td><input type="text" id="patentNum" name="patentNum" maxlength="100"/></td>
									</tr>
									<tr>
										<th scope="row"><span class="exactly"></span> <spring:message code="member.join.step.two.compnay.msg8"/></th>
										<td>
											<span class="bbs_input_box">
												<input type="radio" name="ownerNationCd" id="ownerNationCd_1" checked="true" value="NAT0000000102"/>
												<label for="ownerNationCd_1">Cambodia</label>
											</span>
											<span class="bbs_input_box">
												<input type="radio" name="ownerNationCd" id="ownerNationCd_2" />
												<label for="ownerNationCd_2"><spring:message code="member.join.step.two.compnay.msg5"/></label>
											</span>
											<span class="bbs_date">
												<label for="otherNationCd" class="skip">Sector</label>
												<select id="otherNationCd" name="otherNationCd" title="Sector">
													<option value=""><spring:message code="member.join.msg.choice"/></option>
													<c:forEach var="commCd" items="${resultList2}" varStatus="status">
														<option value="${commCd.dtlCd}">${commCd.cdNm}</option>
													</c:forEach>
												</select>
											</span>
										</td>
									</tr>
									<tr>
										<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <label for="addrDtl"><spring:message code="member.join.step.two.compnay.msg6"/></label></th>
										<td>
											<div class="bbs_address">
												<button type="button" id="addrCdBtn" onclick="callback(fnSetAddr, 'addr')" class="btn srch noround popup_addr"><spring:message code="member.join.step.two.msg9"/></button>
												<span id="addrBasic"></span>
												<br />
												<input type="text" id="addrDtl" name="addrDtl" class="popAddr_input" maxlength="100"/>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row"><span class="exactly"></span> <label for="mainJobPercent"><spring:message code="member.join.step.two.compnay.msg9"/></label></th>
										<td><input type="text" id="mainJobPercent" name="mainJobPercent" maxlength="3" onKeyPress="return fnCheckNumber2(event);"/> %</td>
									</tr>
								</tbody>
							</table>
							<!-- //bbs_table write -->

							<h3><spring:message code="mypage.compny.vacancy.msg7"/></h3>
							<p class="em_blue small">※ <spring:message code="mypage.compny.vacancy.msg8"/><br/><spring:message code="mypage.compny.vacancy.msg9"/></p>
							<table class="bbs_table write">
								<caption>Persmnal Info Write</caption>
								<colgroup>
									<col style="width:20%;" />
									<col style="width:80%;" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <label for="mngerNm"><spring:message code="member.join.step.two.compnay.msg11"/></label></th>
										<td><input type="text" id="mngerNm" name="mngerNm" maxlength="20" /></td>
									</tr>
									<tr>
										<th scope="row"><span class="exactly"><spring:message code="member.join.msg.required"/></span> <label for="mngerPosition"><spring:message code="member.join.step.two.compnay.msg12"/></label></th>
										<td><input type="text" id="mngerPosition" name="mngerPosition" maxlength="30" /></td>
									</tr>
									<tr>
										<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <label for="mngerEmail"><spring:message code="login.stop.email"/></label></th>
										<td>
											<input type="text" id="mngerEmail" name="mngerEmail" maxlength="100"/>
											<button type="button" id="mngerEmailBtn" class="btn check noround" onclick="javascript:fnUserEmailDupChk('mngerEmail','mngerEmailDupYn');"><spring:message code="member.join.step.two.msg.duplication"/></button>
										</td>
									</tr>
									<tr>
										<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <label for="mngerCell"><spring:message code="login.findId.cell"/></label></th>
										<td>
											<input type="text" id="mngerCell" name="mngerCell" maxlength="15" onKeyPress="return fnCheckNumber(event);"/>
											<button type="button" id="mngerCellBtn" class="btn check noround" onclick="javascript:fnUserCellPhoneDupChk('mngerCell','mngerCellDupYn');"><spring:message code="member.join.step.two.msg.duplication"/></button>
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

							<h3><spring:message code="mypage.compny.vacancy.msg10"/></h3>
							<table class="bbs_table write">
								<caption>Persmnal Info Write</caption>
								<colgroup>
									<col style="width:20%;" />
									<col style="width:80%;" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><span class="exactly"></span> <label for="mngerTel"><spring:message code="member.join.step.two.compnay.msg13"/></label></th>
										<td><input type="text" id="mngerTel" name="mngerTel" onKeyPress="return fnCheckNumber(event);" maxlength="15"/></td>
									</tr>
									<tr>
										<th scope="row"><span class="exactly"></span> <label for="compnyFax"><spring:message code="member.join.step.two.compnay.msg14"/></label></th>
										<td><input type="text" id="compnyFax" name="compnyFax" onKeyPress="return fnCheckNumber(event);" maxlength="15"/></td>
									</tr>
									<tr>
										<th scope="row"><span class="exactly"></span> <label for="compnyWebsite"><spring:message code="member.join.step.two.compnay.msg15"/></label></th>
										<td><input type="text" id="compnyWebsite" name="compnyWebsite" maxlength="100"/></td>
									</tr>
									<tr>
										<th scope="row"><span class="exactly"></span> <label for="compnyFacebook">Facebook page</label></th>
										<td><input type="text" id="compnyFacebook" name="compnyFacebook" maxlength="100"/></td>
									</tr>
								</tbody>
							</table>
							<!-- //bbs_table write -->

							<h3><spring:message code="mypage.compny.vacancy.msg11"/></h3>
							<table class="bbs_table write">
								<caption>Persmnal Info Write</caption>
								<colgroup>
									<col style="width:20%;" />
									<col style="width:80%;" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><span class="exactly"><spring:message code="member.join.msg.required"/></span> <label for="subMngerNm"><spring:message code="member.join.step.two.compnay.msg11"/></label></th>
										<td><input type="text" id="subMngerNm" name="subMngerNm" maxlength="20"/></td>
									</tr>
									<tr>
										<th scope="row"><span class="exactly"><spring:message code="member.join.msg.required"/></span> <label for="subMngerPosition"><spring:message code="member.join.step.two.compnay.msg12"/></label></th>
										<td><input type="text" id="subMngerPosition" name="subMngerPosition" maxlength="30"/></td>
									</tr>
									<tr>
										<th scope="row"><span class="exactly"><spring:message code="member.join.msg.required"/></span> <label for="subMngerEmail"><spring:message code="login.stop.email"/></label></th>
										<td>
											<input type="text" id="subMngerEmail" name="subMngerEmail" maxlength="100"/>
										</td>
									</tr>
									<tr>
										<th scope="row"><span class="exactly"><spring:message code="member.join.msg.required"/></span> <label for="subMngerCell"><spring:message code="login.findId.cell"/></label></th>
										<td>
											<input type="text" id="subMngerCell" name="subMngerCell" maxlength="15" onKeyPress="return fnCheckNumber(event);"/>

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

