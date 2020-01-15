<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
	<script src="${pageContext.request.contextPath}/js/mypage/compny/vacancy/vacancy.js"></script>
    <script>

	    var uploadHoler = "dext5uploadArea";
		var uploadId = "commonUpload";

    	$(document).ready(function() {

    		dext5uploadEvnt();

			if("<c:out value="${userExistYn}"/>" == "N") {//사용자가 존재하지않음
				alertify.alert("<spring:message code="login.findId.no.data"/>", function (e){
					fnGoMain();
				});
				return false;
			}

			if("<c:out value="${connYn}"/>" == "N") {//잘못된 접근
				alertify.alert("<spring:message code="errors.wrong.approach.msg"/>", function (e){
					fnGoMain();
				});
				return false;
			}

    	});

    	/*********************************************************************************
		 * DEXT5 UPLOAD FUNCTION
		 * uploadHolder : call Position
		 * new Dext5Upload : call upload module
		 **********************************************************************************/
		function dext5uploadEvnt(){
			DEXT5UPLOAD.config.UploadHolder = uploadHoler;
			DEXT5UPLOAD.config.Mode = 'view'; // edit, view
			new Dext5Upload(uploadId);

			var imgFileGrpSeq = $('#imgFileGrpSeq').val();
			var resumeFileGrpSeq = $('#resumeFileGrpSeq').val();
			//var fileList = JSON.parse(fileListStr);

			// 등록한 이미지 파일이 있을 경우 조회
			if(imgFileGrpSeq != ""){
				$.ajax({
					type: 'post',
					url: contextPath + "/common/selectDext5upload.do",
					dataType: 'json',
					data: {
						"fileGrpSeq" : imgFileGrpSeq,
					},
					success: function(data) {

						if(data.result.length > 0){
							for(var i in data.result){
								var obj = data.result[i];
								DEXT5UPLOAD.AddUploadedFile(obj.fileSeq, obj.originalNm, obj.saveFilePath, obj.fileSize, '', uploadId);
							}
						}

					},
					error: function(xhr, status, error) {
						alertify.alert(errorMsg);
					}
				});
			}

			if(resumeFileGrpSeq != ""){
				$.ajax({
					type: 'post',
					url: contextPath + "/common/selectDext5upload.do",
					dataType: 'json',
					data: {
						"fileGrpSeq" : resumeFileGrpSeq,
					},
					success: function(data) {

						if(data.result.length > 0){
							for(var i in data.result){
								var obj = data.result[i];
								DEXT5UPLOAD.AddUploadedFile(obj.fileSeq, obj.originalNm, obj.saveFilePath, obj.fileSize, '', uploadId);
							}
						}

					},
					error: function(xhr, status, error) {
						alertify.alert(errorMsg);
					}
				});
			}

		}

	</script>
	<main class="colgroup" id="colgroup">
    	<article>
			<header class="sub_head">
				<div class="sub_title">
					<h2><span><spring:message code="compny.vacancy.msg.view.title"/></span></h2>
				</div>
           	</header>
			<div id="contents" class="vacancyWrite">


				<fieldset>
					<legend>Job Vacancy registration</legend>


					<form id="frmSearch" name="frmSearch" action="${pageContext.request.contextPath}/cpes/compny/vacancy/list.do" method="post">
						<input type="hidden" id="condSeq" name="condSeq" value="${result.vacancySeq}"/>
						<input type="hidden" id="condType" name="condType" value="${param.condType}"/>
						<input type="hidden" id="condText" name="condText" value="${param.condText}"/>
						<input type="hidden" id="currentPageNo" name="currentPageNo" value="${param.currentPageNo}"/>
						<input type="hidden" id="condSort" name="condSort" value="${param.condSort}"/>
						<input type="hidden" id="condTempYn" name="condTempYn" value="${param.condTempYn}"/>
						<input type="hidden" id="condStatCd" name="condStatCd" value="${param.condStatCd}"/>
					</form>

					<input type="hidden" id="imgFileGrpSeq" name="imgFileGrpSeq" value="${result.imgFileGrpSeq}">
					<input type="hidden" id="resumeFileGrpSeq" name="resumeFileGrpSeq" value="${result.resumeFileGrpSeq}">


					<div class="profile_title <c:if test="${!empty result}">active</c:if>">
						<label for="vacancyTitle"><spring:message code="compny.vacancy.msg.title"/></label>
						${result.vacancyTitle}
					</div>

					<div class="form_title type2">
						<h3><span class="bbs_ico necessary"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title2"/></h3>
						<span class="cont"><span class="exactly y"><spring:message code="member.join.msg.required"/></span><spring:message code="member.join.msg.required"/></span>
					</div>
					<table class="bbs_table write type2">
						<caption>Vacancy Conditions Input</caption>
						<colgroup>
							<col style="width:25%" />
							<col style="width:75%" />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title3"/></th>
								<td>

									<span class="bbs_input_box">
										${result.employFormNm}
									</span>

								</td>
							</tr>
							<tr>
								<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <label for="spot"><spring:message code="compny.vacancy.msg.title4"/></label></th>
								<td>${result.spot}</td>
							</tr>
							<tr>
								<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title5"/></th>
								<td>
									<!-- <div class="bbs_add_wrap"> -->
										${result.iscoNm}
									<!-- </div> -->
								</td>
							</tr>
							<tr>
								<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title6"/></th>
								<td>
									<span class="bbs_time type2">
										<label for="workBgnDt" class="skip">date</label>
										${result.workBgnDt}
									</span>
								</td>
							</tr>
							<tr>
								<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title7"/></th>
								<td>
									<span class="bbs_time type2">
										<label for="endDt" class="skip">date</label>
										${result.endDt}
									</span>
								</td>
							</tr>
							<tr>
								<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title8"/></th>
								<td>${result.recrumtMemb}</td>
							</tr>
							<tr>
								<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title9"/></th>
								<td>
									<!-- <div class="bbs_add_wrap"> --><!-- 이 div의 클래스 때문에 중앙으로 정렬됨 -->

										<span class="cont"><!-- 선택사항 들어갈 자리 -->
											<c:forEach items="${result.vacancyLocBeanList }" var="vacancyLoc" varStatus="stat">
												<c:choose>
													<c:when test="${stat.count eq 1 }">
														${vacancyLoc.addrCdNm}
													</c:when>
													<c:otherwise>
														, ${vacancyLoc.addrCdNm}
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</span>
									<!-- </div> -->
								</td>
							</tr>
							<tr>
								<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title10"/></th>
								<td>
									<span class="bbs_input_box">
										${result.recrumtDiffcltYn}
									</span>
									<span id="diffcltReasonSpan"><!-- No 선택했을 때 나오는 인풋 -->
										<label for="diffcltReason" class="skip">difficult</label>
										${result.diffcltReason}
									</span>
								</td>
							</tr>
							<tr>
								<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title11"/></th>
								<td>
									<div class="bbs_child">
										<div class="contents_box">
											<strong class="title_box"><spring:message code="compny.vacancy.msg.title15"/></strong>
											<div class="cont_box">
												${result.employCtrctNm}
											</div>
										</div>
										<div class="contents_box">
											<strong class="title_box"><spring:message code="compny.vacancy.msg.title16"/></strong>
											<div class="cont_box">
												${result.employCtrctTypeNm}
											</div>
										</div>
										<div class="contents_box">
											<strong class="title_box"><spring:message code="compny.vacancy.msg.title17"/></strong>
											<div class="cont_box">
												${result.preferEmploymtTypeNm}
											</div>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title63"/></th>
								<td>
									<div class="bbs_child type2">
										<div class="contents_box">
											<strong class="title_box"><spring:message code="compny.vacancy.msg.title19"/></strong>
											<div class="cont_box">
												<label for="workMornBgnHour" class="skip">Start Hour</label>
												${result.workMornBgnTime}
												&nbsp;~&nbsp;
												<label for="workMornEndHour" class="skip">End Hour</label>
												${result.workMornEndTime}
											</div>
										</div>
										<div class="contents_box">
											<strong class="title_box"><spring:message code="compny.vacancy.msg.title20"/></strong>
											<div class="cont_box">
												<label for="workAfternnBgnHour" class="skip">Start Hour</label>
												${result.workAfternnBgnTime}
												&nbsp;~&nbsp;
												<label for="workAfternnEndHour" class="skip">Start Hour</label>
												${result.workAfternnEndTime}
											</div>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title21"/></th>
								<td>
									${result.dayWorkTime}
									<label for="dayWorkTime"><spring:message code="compny.vacancy.msg.title21"/></label>
								</td>
							</tr>
							<tr>
								<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title22"/></th>
								<td>
									${result.weekWorkDay}
									<label for="weekWorkDay"><spring:message code="compny.vacancy.msg.title22"/></label>
								</td>
							</tr>
						</tbody>
					</table>

					<div class="form_title type2">
						<h3><span class="bbs_ico necessary"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title23"/></h3>
					</div>
					<table class="bbs_table write type2">
						<caption>Job requirements input</caption>
						<colgroup>
							<col style="width:25%" />
							<col style="width:75%" />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title24"/></th>
								<td>
									${result.nightWorkYn}

									<span id="nightWorkYnSpan"><!-- Yes 선택했을 때 나오는 인풋 -->
										${result.workNightBgnTime}

										&nbsp;~&nbsp;
										${result.workNightEndTime}
									</span>
								</td>
							</tr>
							<tr>
								<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title25"/></th>
								<td>
									${result.hldayWorkYn}
								</td>
							</tr>
							<tr>
								<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title26"/></th>
								<td>
									${result.flexWorkYn}
								</td>
							</tr>
							<tr>
								<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title27"/></th>
								<td>
									${result.overWorkYn}
								</td>
							</tr>
							<tr>
								<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title28"/></th>
								<td>
									${result.probtYn}
									<span id="probtYnSpan"><!-- Yes 선택했을 때 나오는 인풋 -->
										${result.probtDura}
										<label for="probtDura"><spring:message code="compny.vacancy.msg.title18"/></label>
									</span>
								</td>
							</tr>
							<tr>
								<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title29"/></th>
								<td>
									${result.trnngYn}
									<span id="trnngYnSpan"><!-- Yes 선택했을 때 나오는 인풋 -->
										${result.trnngDura}
									</span>
								</td>
							</tr>
							<tr>
								<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title30"/></th>
								<td>

									${result.salaryUnitNm}

									<span id="salaryUnitCdSpan"><!-- Monthly 선택했을 때 나오는 인풋 -->
										<label for="minSalaryAmt" class="skip">start payroll</label>
										$<fmt:formatNumber type="number" maxFractionDigits="3" value="${result.minSalaryAmt}" />
										&nbsp;~&nbsp;
										<label for="maxSalaryAmt" class="skip">end payroll</label>
										$<fmt:formatNumber type="number" maxFractionDigits="3" value="${result.maxSalaryAmt}" />
									</span>
								</td>
							</tr>
							<tr>
								<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title31"/></th>
								<td>
									${result.nssfYn}
				 					<span id="nssfYnSpan">
										${result.nssfSpec}
									</span>
								</td>
							</tr>
							<tr>
								<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title32"/></th>
								<td>
									${result.etcInsuYn}
									<span id="etcInsuYnSpan"><!-- Yes 선택했을 때 나오는 인풋 -->
										${result.etcInsuSpec}
										<label for="social_insurance" class="skip">Social insurance</label>
									</span>
								</td>
							</tr>
						</tbody>
					</table>

					<div class="form_title type2">
						<h3><span class="bbs_ico necessary"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title56"/></h3>
						<span class="cont"><span class="exactly y"><spring:message code="member.join.msg.required"/></span><spring:message code="member.join.msg.required"/></span>
					</div>
					<table class="bbs_table write type2">
						<caption>Requirements Input</caption>
						<colgroup>
							<col style="width:25%" />
							<col style="width:75%" />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title52"/></th>
								<td>
									${result.minEduDegreeYn}
									<div id="minEduDegreeYnDiv" class="bbs_child type3"><!-- Required education 선택했을 때 나오는 박스 -->
										<div class="contents_box">
											<strong class="title_box"><spring:message code="compny.vacancy.msg.title52"/></strong>
											<div class="cont_box">
												<label for="minEduDegreeCd" class="skip"><spring:message code="compny.vacancy.msg.title53"/></label>
												${result.minEduDegreeNm}
											</div>
										</div>
										<div class="contents_box">
											<strong class="title_box"><spring:message code="compny.vacancy.msg.title54"/></strong>
											<div class="cont_box">
												${result.iscedNm}/아직 테이블이 안만들어짐
											</div>
										</div>
										<div class="contents_box">
											<strong class="title_box"><spring:message code="compny.vacancy.msg.title55"/></strong>
											<div class="cont_box">
												${result.proLicnsYn}
												<span id="proLicnsYnSpan"><!-- Yes 선택했을 때 나오는 인풋 -->
													${result.proLicnsNm}
												</span>
											</div>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title61"/></th>
								<td>
									${result.minWorkExpYn}
									<div id="minWorkExpYnDiv" class="bbs_child type3"><!-- Required minimum experience related to position 선택했을 때 나오는 박스 -->
										<div class="contents_box">
											<strong class="title_box"><spring:message code="compny.vacancy.msg.title61"/></strong>
											${result.minWorkExp} 년
										</div>
										<div class="contents_box">
											<strong class="title_box"><spring:message code="compny.vacancy.msg.title62"/></strong>
											<div class="cont_box">

												<label for="isicCd" class="skip"><spring:message code="compny.vacancy.msg.title62"/></label>
												${result.isicNm} 아직테이블이 없음
											</div>
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>

					<div class="form_wrap active">
						<div class="form_title type2">
							<h3><span class="bbs_ico necessary"><spring:message code="member.join.msg.required"/></span> 외국어</h3>
						</div>



						<div id="langAddDiv">
							<c:forEach var="langData" items="${result.vacancyLangBeanList}" varStatus="langStatus">
							<div class="form_contents type2" id="langAddDiv_${result.vacancySeq}_${langStatus.count}">
								<table class="bbs_table write type2">
									<caption>Foreign Language Input</caption>
									<colgroup>
										<col style="width:25%" />
										<col style="width:75%" />
									</colgroup>
									<tbody>
										<tr>
											<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <label for="langCd_${result.vacancySeq}_${langStatus.count}}"><spring:message code="compny.vacancy.msg.title34"/></label></th>
											<td>
												${langData.langNm}
											</td>
										</tr>
										<tr>
											<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title35"/></th>
											<td>
												${langData.langLvlNm}
											</td>
										</tr>
									</tbody>
								</table>

							</div>
							</c:forEach>
						</div>

						<!-- //form_add -->
					</div>

					<div class="form_wrap active">
						<div class="form_title">
							<h3><spring:message code="compny.vacancy.msg.title36"/></h3>
						</div>
						<!-- //form_title -->
						<div class="form_contents">
							<div class="form_box">
								<div class="form_element textarea child show">
									<div class="view_area">
										<div class="textarea_title"><spring:message code="compny.vacancy.msg.title38"/> <span>(<spring:message code="compny.vacancy.msg.title39"/>)</span></div>
										<button type="button" class="child_open">open for contents view</button>
									</div>
									<div class="textarea_box">
										<label for="jobDesc" class="skip">content input</label>
										<c:set var="cmt" value="${fn:replace(result.jobDesc,crcn,br)}" />
										<c:set var="cmt" value="${fn:replace(cmt,cr,br)}" />
										<c:set var="cmt" value="${fn:replace(cmt,cn,br)}" />
										<c:set var="cmt" value="${fn:replace(cmt,' ',sp)}" />
										<c:out value="${cmt}" escapeXml="false"/>
									</div>
								</div>
							</div>
							<!-- //form_box -->

							<div class="form_box">
								<div class="form_element textarea child show">
									<div class="view_area">
										<div class="textarea_title"><spring:message code="compny.vacancy.msg.title40"/> <span>(<spring:message code="compny.vacancy.msg.title41"/>)</span></div>
										<button type="button" class="child_open">open for contents view</button>
									</div>
									<div class="textarea_box">
										<label for="recrumtJobRefKnow" class="skip">content input</label>
										<c:set var="cmt" value="${fn:replace(result.recrumtJobRefKnow,crcn,br)}" />
										<c:set var="cmt" value="${fn:replace(cmt,cr,br)}" />
										<c:set var="cmt" value="${fn:replace(cmt,cn,br)}" />
										<c:set var="cmt" value="${fn:replace(cmt,' ',sp)}" />
										<c:out value="${cmt}" escapeXml="false"/>
									</div>
								</div>
							</div>
							<!-- //form_box -->

							<div class="form_box">
								<div class="form_element textarea child show">
									<div class="view_area">
										<div class="textarea_title"><spring:message code="compny.vacancy.msg.title42"/> <span>(<spring:message code="compny.vacancy.msg.title43"/>)</span></div>
										<button type="button" class="child_open">open for contents view</button>
									</div>
									<div class="textarea_box">
										<label for="recrumtJobRefBasicSkill" class="skip">content input</label>
										<c:set var="cmt" value="${fn:replace(result.recrumtJobRefBasicSkill,crcn,br)}" />
										<c:set var="cmt" value="${fn:replace(cmt,cr,br)}" />
										<c:set var="cmt" value="${fn:replace(cmt,cn,br)}" />
										<c:set var="cmt" value="${fn:replace(cmt,' ',sp)}" />
										<c:out value="${cmt}" escapeXml="false"/>
									</div>
								</div>
							</div>
							<!-- //form_box -->

							<div class="form_box">
								<div class="form_element textarea child show">
									<div class="view_area">
										<div class="textarea_title"><spring:message code="compny.vacancy.msg.title44"/> <span>(<spring:message code="compny.vacancy.msg.title45"/>)</span></div>
										<button type="button" class="child_open">open for contents view</button>
									</div>
									<div class="textarea_box">
										<label for="recrumtJobRefWorkNeedItem" class="skip">content input</label>
										<c:set var="cmt" value="${fn:replace(result.recrumtJobRefWorkNeedItem,crcn,br)}" />
										<c:set var="cmt" value="${fn:replace(cmt,cr,br)}" />
										<c:set var="cmt" value="${fn:replace(cmt,cn,br)}" />
										<c:set var="cmt" value="${fn:replace(cmt,' ',sp)}" />
										<c:out value="${cmt}" escapeXml="false"/>
									</div>
								</div>
							</div>
							<!-- //form_box -->

							<div class="form_box">
								<div class="form_element textarea child show">
									<div class="view_area">
										<div class="textarea_title"><spring:message code="compny.vacancy.msg.title37"/></div>
										<button type="button" class="child_open">open for contents view</button>
									</div>
									<div class="textarea_box">
										<label for="etc" class="skip">content input</label>
										<c:set var="cmt" value="${fn:replace(result.etc,crcn,br)}" />
										<c:set var="cmt" value="${fn:replace(cmt,cr,br)}" />
										<c:set var="cmt" value="${fn:replace(cmt,cn,br)}" />
										<c:set var="cmt" value="${fn:replace(cmt,' ',sp)}" />
										<c:out value="${cmt}" escapeXml="false"/>
									</div>
								</div>
							</div>
							<!-- //form_box -->

						</div>
						<!-- //form_contents -->
					</div>

					<div class="form_title type2">
						<h3><span class="bbs_ico necessary"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title46"/></h3>
					</div>
					<table class="bbs_table write type2">
						<caption>Preferential Input</caption>
						<colgroup>
							<col style="width:25%" />
							<col style="width:75%" />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title46"/></th>
								<td>
									<c:forEach var="data" items="${result.vacancyPreferntBeanList}" varStatus="status">
										${data.preferntCondNm} <br/>
									</c:forEach>
								</td>
							</tr>
						</tbody>
					</table>

					<div class="form_title type2">
						<h3><spring:message code="compny.vacancy.msg.title47"/></h3>
					</div>
					<table class="bbs_table write type2">
						<caption>Other Description Input</caption>
						<colgroup>
							<col style="width:25%" />
							<col style="width:75%" />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><span class="exactly"></span> <label for="workExpln"><spring:message code="compny.vacancy.msg.title48"/></label></th>
								<td>
										<c:set var="cmt" value="${fn:replace(result.workExpln,crcn,br)}" />
										<c:set var="cmt" value="${fn:replace(cmt,cr,br)}" />
										<c:set var="cmt" value="${fn:replace(cmt,cn,br)}" />
										<c:set var="cmt" value="${fn:replace(cmt,' ',sp)}" />
										<c:out value="${cmt}" escapeXml="false"/>
								</td>
							</tr>
							<tr>
								<th scope="row"><span class="exactly"></span> 이미지 첨부</th>
								<td>

										미구현 업로드 솔루션 필요

								</td>
							</tr>
						</tbody>
					</table>

					<div class="form_title type2">
						<h3><span class="bbs_ico necessary"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title49"/></h3>
					</div>
					<table class="bbs_table write type2">
						<caption>How to Apply Input</caption>
						<colgroup>
							<col style="width:25%" />
							<col style="width:75%" />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <label for="mngerNm"><spring:message code="member.join.step.two.compnay.msg11"/></label></th>
								<td>${result.mngerNm}</td>
							</tr>
							<tr>
								<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <label for="mngerEmail"><spring:message code="login.stop.email"/></label></th>
								<td>${result.mngerEmail}</td>
							</tr>
							<tr>
								<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <label for="mngerCell"><spring:message code="login.findId.cell"/></label></th>
								<td>${result.mngerCell}</td>
							</tr>
						</tbody>
					</table>

					<div class="form_wrap active">
						<div class="form_title">
							<h3><spring:message code="compny.vacancy.msg.title64"/></h3>
						</div>
						<!-- //form_title -->
						<div class="form_contents">
							<div class="form_box">
								<div class="form_element keyword <c:if test="${result.vacancyKeyword !=null && result.vacancyKeyword !=''}">active</c:if>">
									<div class="view_area">
										<label for="keyword" class="skip"><spring:message code="compny.vacancy.msg.title64"/></label>
										<span class="text_box">
											<c:forEach items="${fn:split(result.vacancyKeyword, ',') }" var="item">
												<span>${item}</span>
											</c:forEach>
										</span>

									</div>
								</div>
								<div class="keyword_info">
									<strong>※ <spring:message code="compny.vacancy.msg.title50"/></strong>
									<span><spring:message code="compny.vacancy.msg.title51"/></span>
								</div>
							</div>
							<!-- //form_box -->
						</div>
						<!-- //form_contents -->
					</div>

					<div class="form_title type2">
						<h3><span class="bbs_ico necessary"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title66"/> <span>※ <spring:message code="compny.vacancy.msg.title67"/></span></h3>
					</div>
					<table class="bbs_table write type2">
						<caption>Required Documents Input</caption>
						<colgroup>
							<col style="width:25%" />
							<col style="width:75%" />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> 제출서류 첨부파일</th>
								<td>
									<div id="dext5uploadArea"></div>
								</td>
							</tr>
						</tbody>
					</table>

					<div class="bbs_btn_wrap">
						<div class="bbs_center">
							<input type="button" onClick="javascript:fnGoList('frmSearch');" class="bbs_btn type01" value="<spring:message code="button.list"/>"/>
							<c:if test="${result.modifyYn == 'Y'}">
								<button type="button" onClick="fnGoMoveUrl('frmSearch','${pageContext.request.contextPath}/cpes/compny/vacancy/modify.do');" class="bbs_btn type02">수정</button>
							</c:if>
						</div>
					</div>

				</fieldset>

			</div>
            <!-- //contents -->
		</article>
	</main>
	<!-- //main.colgroup -->