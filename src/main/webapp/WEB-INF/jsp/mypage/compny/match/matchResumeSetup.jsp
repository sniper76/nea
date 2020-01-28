<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>

<main class="colgroup" id="colgroup">
	<article>
		<header class="sub_head">
			<div class="sub_title">
				<h2><span><spring:message code="mypage.compny.match.ttl02"/></span></h2>
			</div>
		</header>
    	<div id="contents">

			<div class="box type2 icon matching">
			    <div class="box_wrap">
			        <div class="title"><spring:message code="mypage.compny.match.msg05" /></div><!-- Please Set your preferred conditions for finding your employee! -->
			        <p><spring:message code="mypage.compny.match.msg06" /></p><!-- Set your preference on job seeker such as occupation, sector, location, etc., <br />then <span class="em_point">you will receive job seeker list based on your preference.</span> -->
			        <a href="javascript:fnGoMoveUrl('inputFrm', '${pageContext.request.contextPath}/cpes/compny/match/matchResumeList.do')" class="bbs_btn type01 matching_btn"><spring:message code="button.list" /></a>
			    </div>
			</div>

			<div class="matching_detail">
				<form name="inputFrm" id="inputFrm">
					<fieldset>
						<legend><spring:message code="mypage.compny.match.msg08" /></legend><!-- Tailored Matching Setting -->
						<div class="contents_box">
							<table class="bbs_table">
								<caption><spring:message code="mypage.compny.match.msg08" /></caption><!-- Tailored Matching Setting -->
								<colgroup>
									<col style="width:15%;" />
									<col style="width:85%;" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="col"><spring:message code="compny.vacancy.msg.title5" /></th><!-- Occupation -->
										<td>
											<label for="condIscoLvlOne" class="skip">Occupation 1depth</label>
											<select id="condIscoLvlOne" name="isco1Cd" onchange="fnIscoCdList(this,'1','condIscoLvlOne','condIscoLvlTwo','condIscoLvlThree','condIscoLvlFour',null,'N');">
												<option value=""><spring:message code="member.join.msg.choice" /></option>
												<c:forEach var="data" items="${isco1List}" varStatus="status">
									   			<option value="${data.cd}" <c:if test="${param.condType == data.cd}">selected</c:if>>${data.cdNm}</option>
									   			</c:forEach>
											</select>
											<label for="condIscoLvlTwo" class="skip">Occupation 2depth</label>
											<select id="condIscoLvlTwo" name="isco2Cd" onchange="fnIscoCdList(this,'2','condIscoLvlOne','condIscoLvlTwo','condIscoLvlThree','condIscoLvlFour',null,'N');">
												<option value=""><spring:message code="member.join.msg.choice" /></option>
												<c:forEach var="data" items="${isco2List}" varStatus="status">
									   			<option value="${data.cd}" <c:if test="${param.condType == data.cd}">selected</c:if>>${data.cdNm}</option>
									   			</c:forEach>
											</select>
											<label for="condIscoLvlThree" class="skip">Occupation 3depth</label>
											<select id="condIscoLvlThree" name="isco3Cd" onchange="fnIscoCdList(this,'3','condIscoLvlOne','condIscoLvlTwo','condIscoLvlThree','condIscoLvlFour',null,'N');">
												<option value=""><spring:message code="member.join.msg.choice" /></option>
												<c:forEach var="data" items="${isco3List}" varStatus="status">
									   			<option value="${data.cd}" <c:if test="${param.condType == data.cd}">selected</c:if>>${data.cdNm}</option>
									   			</c:forEach>
											</select>
											<label for="condIscoLvlFour" class="skip">Occupation 4depth</label>
											<select id="condIscoLvlFour" name="isco4Cd">
												<option value=""><spring:message code="member.join.msg.choice" /></option>
												<c:forEach var="data" items="${isco4List}" varStatus="status">
									   			<option value="${data.cd}" <c:if test="${param.condType == data.cd}">selected</c:if>>${data.cdNm}</option>
									   			</c:forEach>
											</select>
										</td>
									</tr>
									<tr>
										<th scope="col"><spring:message code="resume.text.addrProvcCd" /></th><!-- Location -->
										<td>
											<label for="condAreaCdLvlOne" class="skip">Province selection</label>
											<select id="condAreaCdLvlOne" name="loc1Cd" onchange="fnAreaCdList(this,'1','condAreaCdLvlOne','condAreaCdLvlTwo',CONTRY_CD_CAMBODIA,null,'N');">
												<option value=""><spring:message code="member.join.msg.choice" /></option>
												<c:forEach var="data" items="${loc1List}" varStatus="status">
									   			<option value="${data.lvlCd}" <c:if test="${param.loc1Cd == data.lvlCd}">selected</c:if>>${data.nm}</option>
									   			</c:forEach>
											</select>
											<label for="condAreaCdLvlTwo" class="skip">District selection</label>
											<select id="condAreaCdLvlTwo" name="loc2Cd">
												<option value=""><spring:message code="member.join.msg.choice" /></option>
												<c:forEach var="data" items="${loc2List}" varStatus="status">
									   			<option value="${data.lvlCd}" <c:if test="${param.loc1Cd == data.lvlCd}">selected</c:if>>${data.nm}</option>
									   			</c:forEach>
											</select>
										</td>
									</tr>
									<tr>
										<th scope="col"><spring:message code="wage" /></th><!-- Wage -->
										<td>
											$<input id="hopeSalary" name="hopeSalary" type="text" maxlength="6" style="width:80px;" onKeyPress="return fnCheckNumber(event);" value="<c:out value="${vacanchMatchSet.hopeSalary}" />"/>
										</td>
									</tr>
									<tr>
										<th scope="col"><spring:message code="mypage.compny.match.msg09" /></th><!-- Working Time -->
										<td>
											<c:forEach var="data" items="${preferEmploymtTypeCd}" varStatus="status">
												<span class="bbs_input_box">
													<input type="checkbox" id="condPreferEmploymtTypeCd_${status.count}" name="workTimeCd" value="${data.dtlCd}" <c:if test="${data.dtlCd == vacanchMatchSet.workTimeFullCd || data.dtlCd == vacanchMatchSet.workTimePartCd}">checked="checked"</c:if> />
													<label for="condPreferEmploymtTypeCd_${status.count}">${data.cdNm}</label>
												</span>
											</c:forEach>
										</td>
									</tr>
									<tr>
										<th scope="col"><spring:message code="mypage.compny.match.msg10" /></th><!-- Contract Type -->
										<td>
											<c:forEach var="data" items="${employCtrctCd}" varStatus="status">
												<span class="bbs_input_box">
													<input type="checkbox" id="condEmployCtrctCd${status.count}" name="employCtrctCd" value="${data.dtlCd}" <c:if test="${data.dtlCd == vacanchMatchSet.employCtrctDecidCd || data.dtlCd == vacanchMatchSet.employCtrctUndecidCd}">checked="checked"</c:if> />
													<label for="condEmployCtrctCd${status.count}">${data.cdNm}</label>
												</span>
											</c:forEach>
										</td>
									</tr>
									<tr>
										<th scope="col"><spring:message code="mypage.compny.profile.title19" /></th><!-- Education -->
										<td>
											<c:forEach var="data" items="${minEduDegreeCd}" varStatus="status">
												<span class="bbs_input_box">
													<input type="checkbox" id="condMinEduDegreeCd${status.count}" name="minEduDegreeCd" value="${data.dtlCd}" />
													<label for="condMinEduDegreeCd${status.count}">${data.cdNm}</label>
												</span>
											</c:forEach>
										</td>
									</tr>
									<tr>
										<th scope="col"><spring:message code="gnb.menu.counsel.title4" /></th><!-- Experience -->
										<td>
											<span class="bbs_input_box">
												<input type="radio"  id="condMinWorkExp_0" name="minWorkExp" value="0" <c:if test="${vacanchMatchSet.minWorkExp == '0'}">checked="checked"</c:if> />
												<label for="condMinWorkExp_0">None</label>
											</span>
											<span class="bbs_input_box">
												<input type="radio"  id="condMinWorkExp_1" name="minWorkExp" value="1" <c:if test="${vacanchMatchSet.minWorkExp == '1'}">checked="checked"</c:if> />
												<label for="condMinWorkExp_1">~ 1 Year</label>
											</span>
											<span class="bbs_input_box">
												<input type="radio"  id="condMinWorkExp_2" name="minWorkExp" value="2" <c:if test="${vacanchMatchSet.minWorkExp == '2'}">checked="checked"</c:if> />
												<label for="condMinWorkExp_2">1~2 Years</label>
											</span>
											<span class="bbs_input_box">
												<input type="radio"  id="condMinWorkExp_3" name="minWorkExp" value="3" <c:if test="${vacanchMatchSet.minWorkExp == '3'}">checked="checked"</c:if> />
												<label for="condMinWorkExp_3">2~5 Years</label>
											</span>
											<span class="bbs_input_box">
												<input type="radio"  id="condMinWorkExp_4" name="minWorkExp" value="4" <c:if test="${vacanchMatchSet.minWorkExp == '4'}">checked="checked"</c:if> />
												<label for="condMinWorkExp_4">More than 5 Years</label>
											</span>
										</td>
									</tr>
									<tr>
										<th scope="col"><spring:message code="mypage.compny.match.msg11" /></th><!-- Privilege -->
										<td>
											<c:forEach var="data" items="${preferntCondCd}" varStatus="status">
												<span class="bbs_input_box">
													<input type="checkbox" id="condPreferntCondCd_${status.count}" name="preferntCondCd"  value="${data.dtlCd}"/>
													<label for="condPreferntCondCd_${status.count}">${data.cdNm}</label>
												</span>
											</c:forEach>
										</td>
									</tr>
									<tr>
										<th scope="col"><spring:message code="mypage.compny.match.msg12" /></th><!-- Foreign Language -->
										<td>
											<c:forEach var="data" items="${langCd}" varStatus="status">
												<span class="bbs_input_box">
													<input type="checkbox" id="condLangCd_${status.count}" name="langCd"  value="${data.dtlCd}"/>
													<label for="condLangCd_${status.count}">${data.cdNm}</label>
												</span>
											</c:forEach>
										</td>
									</tr>
								</tbody>
							</table>
						</div>

						<div class="bbs_btn_wrap clearfix">
							<div class="bbs_center">
								<!-- Submit -->
								<button type="button" class="bbs_btn save" onclick="fnSubmit()"><spring:message code="button.create" /></button>
							</div>
						</div>
						<!-- //bbs_btn_wrap -->
					</fieldset>
				</form>
			</div>

		</div>
		<!-- //contents -->
	</article>
</main>
<!-- //main.colgroup -->

<script>
	$(document).ready(function(e) {
		<c:forEach var="data" items="${vacanchMatchSetIscoList}">
			<c:choose>
				<c:when test="${fn:length(data.iscoCd) == 1}">
					$("[name=isco1Cd]").val("<c:out value="${data.iscoCd}" />");
				</c:when>
				<c:when test="${fn:length(data.iscoCd) == 2}">
					$("[name=isco2Cd]").val("<c:out value="${data.iscoCd}" />");
				</c:when>
				<c:when test="${fn:length(data.iscoCd) == 3}">
					$("[name=isco3Cd]").val("<c:out value="${data.iscoCd}" />");
				</c:when>
				<c:when test="${fn:length(data.iscoCd) == 4}">
					$("[name=isco4Cd]").val("<c:out value="${data.iscoCd}" />");
				</c:when>
			</c:choose>
		</c:forEach>
		<c:forEach var="data" items="${vacanchMatchSetLocList}">
			<c:choose>
				<c:when test="${fn:length(data.vacancyMatchSetLocCd) == 3}">
					$("[name=loc1Cd]").val("<c:out value="${data.vacancyMatchSetLocCd}" />");
				</c:when>
				<c:when test="${fn:length(data.vacancyMatchSetLocCd) == 5}">
					$("[name=loc2Cd]").val("<c:out value="${data.vacancyMatchSetLocCd}" />");
				</c:when>
			</c:choose>
		</c:forEach>
		<c:forEach var="data" items="${vacanchMatchSetEduDegreeList}">
		$("[name=minEduDegreeCd][value=<c:out value="${data.minEduDegreeCd}" />]").prop("checked", true);</c:forEach>
		<c:forEach var="data" items="${vacanchMatchSetLangList}">
		$("[name=langCd][value=<c:out value="${data.langCd}" />]").prop("checked", true);</c:forEach>
		<c:forEach var="data" items="${vacanchMatchSetPreferntCondList}">
		$("[name=preferntCondCd][value=<c:out value="${data.preferntCondCd}" />]").prop("checked", true);</c:forEach>
	});
	function fnSearch() {
		document.location.href = contextPath = "/cpes/compny/match/matchResumeSetup.do";
	}
	function fnSubmit() {
		var param = $("[name=inputFrm]").serializeObject();
		param.minWorkExp = nvl($("[name=minWorkExp]:checked").val());
		if(param.isco1Cd == null || $.trim(param.isco1Cd) == "") {
			alertify.alert("<spring:message code="mypage.private.interest.msg4"/>", function (e){
				$("[name=isco1Cd]")[0].focus();
			});
			return false;
		}
		if(param.loc1Cd == null || $.trim(param.loc1Cd) == "") {
			alertify.alert("<spring:message code="mypage.private.interest.msg5"/>", function (e){
				$("[name=loc1Cd]")[0].focus();
			});
			return false;
		}
		// Isco
		var iscoArr = [];
		if(param.isco1Cd != null && $.trim(param.isco1Cd) != "") iscoArr.push(param.isco1Cd);
		if(param.isco2Cd != null && $.trim(param.isco2Cd) != "") iscoArr.push(param.isco2Cd);
		if(param.isco3Cd != null && $.trim(param.isco3Cd) != "") iscoArr.push(param.isco3Cd);
		if(param.isco4Cd != null && $.trim(param.isco4Cd) != "") iscoArr.push(param.isco4Cd);
		param.iscoCd = iscoArr.join(",");
		// Location
		var locArr = [];
		if(param.loc1Cd != null && $.trim(param.loc1Cd) != "") locArr.push(param.loc1Cd);
		if(param.loc2Cd != null && $.trim(param.loc2Cd) != "") locArr.push(param.loc2Cd);
		param.locCd = locArr.join(",");
		// Working Time
		$("[name=workTimeCd]:checked").each(function() {
			if(this.value == "PET0000000001") {
				param.workTimeFullCd = this.value;
			} else if(this.value == "PET0000000002") {
				param.workTimePartCd = this.value;
			}
		});
		// Contract Type
		var employCtrctArr = [];
		$("[name=employCtrctCd]:checked").each(function() {
			if(this.value == "CRT0000000001") {
				param.employCtrctUndecidCd = this.value;
			} else if(this.value == "CRT0000000002") {
				param.employCtrctDecidCd = this.value;
			}
		});
		// Education
		var minEduDegreeArr = [];
		$("[name=minEduDegreeCd]:checked").each(function() { minEduDegreeArr.push($(this).val()); });
		// Experienced
		var minWorkExpArr = [];
		$("[name=minWorkExp]:checked").each(function() { minWorkExpArr.push($(this).val()); });
		// Privilege
		var preferntCondArr = [];
		$("[name=preferntCondCd]:checked").each(function() { preferntCondArr.push($(this).val()); });
		// Foreign Language
		var langArr = [];
		$("[name=langCd]:checked").each(function() { langArr.push($(this).val()); });
		//
		param.minEduDegreeCd = minEduDegreeArr.join(",");
		param.preferntCondCd = preferntCondArr.join(",");
		param.langCd = langArr.join(",");

		if(param.iscoCd == "" &&
		   param.locCd == "" &&
		   param.hopeSalary == "" &&
		   nvl(param.minWorkExp) == "" &&
		   nvl(param.workTimeFullCd) == "" &&
		   nvl(param.workTimePartCd) == "" &&
		   nvl(param.employCtrctDecidCd) == "" &&
		   nvl(param.employCtrctUndecidCd) == "" &&
		   param.minEduDegreeCd == "" &&
		   param.preferntCondCd == "" &&
		   param.langCd == ""
		) {
			alertify.alert("<spring:message code="mypage.compny.match.msg14"/>");
			return false;
		}

		alertify.confirm("<spring:message code="mypage.private.interest.msg"/>", function (e) {
			if (e) {
				$.ajax({
					type: 'post', datatype: 'json',
					url: contextPath + "/cpes/compny/match/matchResumeSetupAjax.do",
					data: param
				})
				.done(function(data) {
					if (data.result.successYn == "Y") {
						alertify.alert("<spring:message code="mypage.compny.match.msg13"/>", function (e){
							document.location.href = contextPath + "/cpes/compny/match/matchResumeList.do";
						});
					} else {
		 				var msg = "<spring:message code="errors.ajax.fail"/>";
						if(data.result.statCd == "NO_LOGIN") {
							msg = "<spring:message code="msg.session.out"/>";
 						}
						alertify.alert(msg);
					}
				})
				.fail(function(xhr, status, errorThrown) {
					alertify.alert("<spring:message code="errors.ajax.fail"/>");
				});
			}
		});
	}
</script>
