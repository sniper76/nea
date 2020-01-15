<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
    <script>

	  	$(document).ready(function() {


			if("<c:out value="${dataExistYn}"/>" == "N") {//데이터가 존재하지않음
				alertify.alert("<spring:message code="info.nodata.msg"/>", function (e){
					fnGoMain();
				});
				return false;
			}

			commonPopupSet('addr');


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


			if($("#insttWebsite").val() != "" && !fnValidUrl($("#insttWebsite").val())) {
				alertify.alert("<spring:message code="member.join.step.two.compnay.errors.msg7"/>", function (e){
					$("#insttWebsite").focus();
				});
				return false;
			}

			$.ajax({
				url: contextPath + "/cpes/instt/member/modifyProcessAjax.do",
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
			$("#insttAddrDtl").val(json.commonFullNm);
			$("#insttAddrCd").val(json.commonCd);
			$("#insttAddrFullNm").val(json.commonFullNm);
			$("#insttAddrFullCd").val(json.commonFullCd);
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
						<span><spring:message code="mypage.instt.member.title"/></span>
					</h2>
				</div>
	      	</header>
	       	<div id="contents" class="insttMemberModify">

				<div class="bbs_basic">
					<form id="frm" name="frm" action="${pageContext.request.contextPath}/cpes/instt/member/modifyProcessAjax.do" method="post">
						<input type="hidden" id="insttAddrCd" name="insttAddrCd" value="${result.insttAddrCd}"/>
						<input type="hidden" id="insttAddrFullNm" name="insttAddrFullNm" value="${result.insttAddrFullNm}"/>
						<input type="hidden" id="insttAddrFullCd" name="insttAddrFullCd" value="${result.insttAddrFullCd}"/>
						<input type="hidden" id="insttSeq" name="insttSeq" value="${result.insttSeq}"/>
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
									<td><input type="text" id="insttNmKh" name="insttNmKh" maxlength="150" value="${result.insttNmKh}"/></td>
								</tr>
								<tr>
									<th scope="row"><span class="exactly"></span> <label for="insttNmEn"><spring:message code="member.join.step.two.trnct.msg"/> (<spring:message code="member.join.step.two.msg.nm.eng"/>)</label></th>
									<td><input type="text" id="insttNmEn" name="insttNmEn" maxlength="150" value="${result.insttNmEn}"/></td>
								</tr>
								<tr>
									<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <label for="insttTypeCd"><spring:message code="member.join.step.two.trnct.msg2"/></label></th>
									<td>
										<span class="bbs_date">
											<select id="insttTypeCd" name="insttTypeCd">
												<c:forEach var="data" items="${insttTypeCd}" varStatus="status">
													<option value="${data.dtlCd}" <c:if test="${result.insttTypeCd == data.dtlCd}">selected</c:if> >${data.cdNm}</option>
												</c:forEach>
											</select>
										</span>
									</td>
								</tr>
								<tr>
									<th scope="row"><span class="exactly"></span> <label for="insttRegNum"><spring:message code="member.join.step.two.trnct.msg4"/></label></th>
									<td><input type="text" id="insttRegNum" name="insttRegNum" maxlength="100" value="${result.insttRegNum}"/></td>
								</tr>
								<tr>
									<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <label for="insttAddrDtl"><spring:message code="member.join.step.two.trnct.msg5"/></label></th>
									<td>
										<div class="bbs_address">
											<button type="button" id="insttAddrCdBtn" onclick="callback(fnSetAddr, 'addr')" class="btn srch noround popup_addr"><spring:message code="member.join.step.two.msg9"/></button>
											<span id="addrBasic"></span>
											<br />
											<input type="text" id="insttAddrDtl" name="insttAddrDtl" class="popAddr_input" maxlength="100" value="${result.insttAddrDtl}"/>
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
									<td><input type="text" id="insttMngerNm" name="insttMngerNm" maxlength="50" value="${result.insttMngerNm}" /></td>
								</tr>
								<tr>
									<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <label for="insttEmail"><spring:message code="login.stop.email"/></label></th>
									<td>${result.insttEmail}</td>
								</tr>
								<tr>
									<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <label for="insttCell"><spring:message code="login.findId.cell"/></label></th>
									<td>${result.insttCell}</td>
								</tr>
								<tr>
									<th scope="row"><span class="exactly"></span> <label for="insttOfficeTel"><spring:message code="member.join.step.two.trnct.msg6"/></label></th>
									<td><input type="text" id="insttOfficeTel" name="insttOfficeTel" onKeyPress="return fnCheckNumber(event);" maxlength="15" value="${result.insttOfficeTel}"/></td>
								</tr>
								<tr>
									<th scope="row"><span class="exactly"></span> <label for="insttWebsite"><spring:message code="member.join.step.two.compnay.msg15"/></label></th>
									<td><input type="text" id="insttWebsite" name="insttWebsite" maxlength="100" value="${result.insttWebsite}"/></td>
								</tr>

								</tbody>
							</table>
							<!-- //bbs_table write -->


							<div class="box_center">
								<a href="javascript:void(0);" onClick="fnResetForm();" class="btn type2 margin_r_5"><spring:message code="login.findPwd.btn.cancel"/></a>
								<input type="button" class="btn type1" onclick="fnSave();" value="<spring:message code="button.save"/>" />
							</div>

						</fieldset>
					</form>
				</div>

			</div>
	    	<!-- //contents -->
	    </article>
	</main>
	<!-- //main.colgroup -->

