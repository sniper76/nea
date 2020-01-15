<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
    <script>
    	$(document).ready(function() {

	  		fnSetDaySelecteBox("birthDay","${result.birthDay}");//day selectBox
	  		fnSetMonthSelecteBox("birthMonth","${result.birthMonth}");//day selectBox
	  		fnSetYearSelecteBox("birthYear","${result.birthYear}");

	  		commonPopupSet('addr');
    	});

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


		function fnSave() {
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


			$.ajax({
				url: contextPath + "/cpes/private/member/modifyProcessAjax.do",
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
	</script>
	<main class="colgroup" id="colgroup">
		<article>
	    	<header class="sub_head">
				<div class="sub_title">
					<h2>
						<span><spring:message code="mypage.private.member.title"/></span>
					</h2>
				</div>
	      	</header>

	       	<div id="contents" class="memberModify">
				<div class="bbs_basic">
					<form id="frm" name="frm" action="${pageContext.request.contextPath}/cpes/privt/member/modifyProcessAjax.do" method="post">
						<input type="hidden" id="addrCd" name="addrCd" value="${result.addrCd}"/>
						<input type="hidden" id="addrFullCd" name="addrFullCd" value="${result.addrFullCd}"/>
						<input type="hidden" id="addrFullNm" name="addrFullNm" value="${result.addrFullNm}"/>
						<input type="hidden" id="birth" name="birth" value="${result.birth}"/>
						<fieldset>
							<legend>Write a post</legend>

							<h3 class="margin_b_0"><spring:message code="member.join.step.two.msg"/></h3>
							<div class="bbs_write_top table_unit"><span><span class="exactly y"><spring:message code="member.join.msg.required"/></span><spring:message code="member.join.msg.required"/></span></div>
							<table class="bbs_table write margin_b_30">
								<caption>Account info View</caption>
								<colgroup>
									<col style="width:20%;" />
									<col style="width:80%;" />
								</colgroup>
								<tbody>
								<tr>
									<th scope="row"><span class="exactly"></span> <spring:message code="search.name"/></th>
									<td>${result.userNm} </td>
								</tr>
								<tr>
									<th scope="row"><span class="exactly"></span> <spring:message code="member.join.step.two.msg4"/></th>
									<td>${result.genderNm}</td>
								</tr>
								<tr>
									<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="login.stop.email"/></th>
									<td>${result.userEmail}</td>
								</tr>
								<tr>
									<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="login.findId.cell"/></th>
									<td>${result.userCell}</td>
								</tr>
								</tbody>
							</table>
							<!-- //bbs_table write -->

							<h3><spring:message code="mypage.private.member.title2"/></h3>
							<table class="bbs_table write">
								<caption>Persmnal Info Modify</caption>
								<colgroup>
									<col style="width:20%;" />
									<col style="width:80%;" />
								</colgroup>
								<tbody>
								<tr>
									<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="member.join.step.two.msg5"/></th>
									<td>
										<span class="bbs_date">
											<select id="birthDay" name="birthDay" title="day">
												<option value=""><spring:message code="member.join.msg.choice"/></option>
											</select>
											<label for="date_day"><spring:message code="member.join.step.two.msg.day"/></label>
										</span>
										<span class="bbs_date">
											<select id="birthMonth" name="birthMonth" title="month">
												<option value=""><spring:message code="member.join.msg.choice"/></option>
											</select>
											<label for="date_month"><spring:message code="member.join.step.two.msg.month"/></label>
										</span>
										<span class="bbs_date">
											<select id="birthYear" name="birthYear" title="year">
												<option value=""><spring:message code="member.join.msg.choice"/></option>
											</select>
											<label for="date_year"><spring:message code="member.join.step.two.msg.year"/></label>
										</span>
									</td>
								</tr>
								<tr>
									<th scope="row"><span class="exactly"></span> <label for="id_number"><spring:message code="member.join.step.two.msg6"/></label></th>
									<td><input type="text" id="nid" name="nid" maxlength="15" value="${result.nid}" /></td>
								</tr>
								<tr>
									<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <label for="current_add"><spring:message code="member.join.step.two.msg7"/> <br /><spring:message code="member.join.step.two.msg8"/></label></th>
									<td>
										<div class="bbs_address">
											<button type="button" id="addrCdBtn" onclick="callback(fnSetAddr, 'addr')" class="btn srch noround popup_addr"><spring:message code="member.join.step.two.msg9"/></button>
											<span id="addrBasic"></span>
											<br />
											<input type="text" id="addrDtl" name="addrDtl" class="popAddr_input" maxlength="100" value="${result.addrDtl}"/>
										</div>
										<p class="bbs_description"><spring:message code="member.join.step.two.msg10"/></p>
									</td>
								</tr>
								</tbody>
							</table>
							<!-- //bbs_table write -->

							<div class="box_center">
								<a href="javascript:void(0);" onClick="fnResetForm();" class="btn type2 margin_r_5"><spring:message code="login.findPwd.btn.cancel"/></a>
								<input type="button" class="btn type1" onClick="fnSave();" value="<spring:message code="button.save"/>" />
							</div>

						</fieldset>
					</form>
				</div>
				<!-- //bbs_basic write -->
			</div>
	    	<!-- //contents -->
	    </article>
	</main>
	<!-- //main.colgroup -->