<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
    <script>

	  	$(document).ready(function() {
	  		commonPopupSet('addr');

		});

	  	function fnSave() {
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
				url: contextPath + "/cpes/compny/member/modifyProcessAjax.do",
				type: 'post',
				data: $("#frm").serialize(),
				datatype: 'json'
			})
			.done(function(data) {
				if (data.result.successYn == "Y") {
					alertify.alert("<spring:message code="counsel.msg.update.ok"/>");

				} else {
	 				var msg = "<spring:message code="login.findId.no.data"/>";
					if(data.result.statCd == "03") {
						msg = "<spring:message code="errors.ajax.fail"/>";
					}
					alertify.alert(msg);
				}
			})
			.fail(function(xhr, status, errorThrown) {
				alertify.alert("<spring:message code="errors.ajax.fail"/>");
			});

	  	}





		function fnSetAddr(json) {
			//console.log("============json="+JSON.stringify(json));
			$("#addrFullNm").val(json.commonFullNm);
			$("#addrFullCd").val(json.commonFullCd);
			$("#addrDtl").val(json.commonFullNm);
			$("#addrCd").val(json.commonCd);
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
						<span><spring:message code="mypage.compny.member.title"/></span>
					</h2>
				</div>
	      	</header>

	       	<div id="contents" class="compnyMemberModify">

				<div class="bbs_basic">
					<form id="frm" name="frm" action="${pageContext.request.contextPath}/cpes/compny/member/modifyProcessAjax.do" method="post">
						<input type="hidden" id="addrCd" name="addrCd" value="${result.addrCd}"/>
						<input type="hidden" id="addrFullCd" name="addrFullCd" value="${result.addrFullCd}"/>
						<input type="hidden" id="addrFullNm" name="addrFullNm" value="${result.addrFullNm}"/>
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
										<td>${result.compnyNm}</td>
									</tr>

									<tr>
										<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <label for="compnyTypeCd"><spring:message code="member.join.step.two.compnay.msg"/>/<spring:message code="member.join.step.two.compnay.msg3"/></label></th>
										<td>
											<span class="bbs_date">
												<select id="compnyTypeCd" name="compnyTypeCd">
													<c:forEach var="commCd" items="${resultList}" varStatus="status">
														<option value="${commCd.dtlCd}" <c:if test="${result.compnyTypeCd == commCd.dtlCd}">selected</c:if> >${commCd.cdNm}</option>
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
										<td><input type="text" id="regNum" name="regNum" value="${result.regNum}" maxlength="100"/></td>
									</tr>
									<tr>
										<th scope="row"><span class="exactly"></span> <label for="patentNum"><spring:message code="member.join.step.two.compnay.msg4"/></label></th>
										<td><input type="text" id="patentNum" name="patentNum" value="${result.patentNum}" maxlength="100" /></td>
									</tr>
									<tr>
										<th scope="row"><span class="exactly"></span> <spring:message code="member.join.step.two.compnay.msg8"/></th>
										<td>
											<span class="bbs_input_box">
												<input type="radio" name="ownerNationCd" id="ownerNationCd_1" value="NAT0000000102" <c:if test="${result.ownerNationCd == 'NAT0000000102'}">checked</c:if> />
												<label for="ownerNationCd_1">Cambodia</label>
											</span>
											<span class="bbs_input_box">
												<input type="radio" name="ownerNationCd" id="ownerNationCd_2" <c:if test="${result.ownerNationCd != 'NAT0000000102'}">checked</c:if> />
												<label for="ownerNationCd_2"><spring:message code="member.join.step.two.compnay.msg5"/></label>
											</span>
											<span class="bbs_date">
												<label for="otherNationCd" class="skip">Sector</label>
												<select id="otherNationCd" name="otherNationCd" title="Sector">
													<option value=""><spring:message code="member.join.msg.choice"/></option>
													<c:forEach var="commCd" items="${resultList2}" varStatus="status">
														<option value="${commCd.dtlCd}" <c:if test="${result.ownerNationCd != 'NAT0000000102' and result.ownerNationCd == commCd.dtlCd}">selected</c:if> >${commCd.cdNm}</option>
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
												<input type="text" id="addrDtl" name="addrDtl" class="popAddr_input" maxlength="100" value="${result.addrDtl}"/>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row"><span class="exactly"></span> <label for="mainJobPercent"><spring:message code="member.join.step.two.compnay.msg9"/></label></th>
										<td><input type="text" id="mainJobPercent" name="mainJobPercent" maxlength="3" value="${result.mainJobPercent}" onKeyPress="return fnCheckNumber2(event);"/> %</td>
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
										<td><input type="text" id="mngerNm" name="mngerNm" maxlength="20" value="${result.mngerNm}"/></td>
									</tr>
									<tr>
										<th scope="row"><span class="exactly"><spring:message code="member.join.msg.required"/></span> <label for="mngerPosition"><spring:message code="member.join.step.two.compnay.msg12"/></label></th>
										<td><input type="text" id="mngerPosition" name="mngerPosition" maxlength="30" value="${result.mngerPosition}"/></td>
									</tr>
									<tr>
										<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="login.stop.email"/></th>
										<td>${result.mngerEmail}</td>
									</tr>
									<tr>
										<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="login.findId.cell"/></th>
										<td>${result.mngerCell}</td>
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
										<td><input type="text" id="mngerTel" name="mngerTel" onKeyPress="return fnCheckNumber(event);" maxlength="15" value="${result.mngerTel}"/></td>
									</tr>
									<tr>
										<th scope="row"><span class="exactly"></span> <label for="compnyFax"><spring:message code="member.join.step.two.compnay.msg14"/></label></th>
										<td><input type="text" id="compnyFax" name="compnyFax" onKeyPress="return fnCheckNumber(event);" maxlength="15" value="${result.mngerTel}"/></td>
									</tr>
									<tr>
										<th scope="row"><span class="exactly"></span> <label for="compnyWebsite"><spring:message code="member.join.step.two.compnay.msg15"/></label></th>
										<td><input type="text" id="compnyWebsite" name="compnyWebsite" maxlength="100" value="${result.compnyWebsite}"/></td>
									</tr>
									<tr>
										<th scope="row"><span class="exactly"></span> <label for="compnyFacebook">Facebook page</label></th>
										<td><input type="text" id="compnyFacebook" name="compnyFacebook" maxlength="100" value="${result.compnyFacebook}"/></td>
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
										<td><input type="text" id="subMngerNm" name="subMngerNm" value="${result.subMngerNm}" maxlength="20"/></td>
									</tr>
									<tr>
										<th scope="row"><span class="exactly"><spring:message code="member.join.msg.required"/></span> <label for="subMngerPosition"><spring:message code="member.join.step.two.compnay.msg12"/></label></th>
										<td><input type="text" id="subMngerPosition" name="subMngerPosition" value="${result.subMngerPosition}" maxlength="30"/></td>
									</tr>
									<tr>
										<th scope="row"><span class="exactly"><spring:message code="member.join.msg.required"/></span> <label for="subMngerEmail"><spring:message code="login.stop.email"/></label></th>
										<td>
											<input type="text" id="subMngerEmail" name="subMngerEmail" value="${result.subMngerEmail}" maxlength="100"/>
										</td>
									</tr>
									<tr>
										<th scope="row"><span class="exactly"><spring:message code="member.join.msg.required"/></span> <label for="subMngerCell"><spring:message code="login.findId.cell"/></label></th>
										<td>
											<input type="text" id="subMngerCell" name="subMngerCell" value="${result.subMngerCell}" maxlength="15" onKeyPress="return fnCheckNumber(event);"/>

										</td>
									</tr>
								</tbody>
							</table>

							<div class="box_center">
								<a href="javascript:void(0);" onclick="fnResetForm();" class="btn type2 margin_r_5"><spring:message code="login.findPwd.btn.cancel"/></a>
								<input type="button" class="btn type1" onClick="fnSave();" value="<spring:message code="button.save"/>" />
							</div>
						</fieldset>
					</form>
				</div>

			</div>
	    	<!-- //contents -->
	    </article>
	</main>
	<!-- //main.colgroup -->

