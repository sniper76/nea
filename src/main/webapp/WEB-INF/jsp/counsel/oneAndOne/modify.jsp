<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>

    <script>
    	$(document).ready(function() {

			if("<c:out value="${userExistYn}"/>" == "N") {//사용자가 존재하지않음
				alertify.alert("<spring:message code="login.findId.no.data"/>", function (e){
					fnGoMain();
				});
				return false;
			}



			if("<c:out value="${dataExistYn}"/>" == "N") {//데이터가 존재하지않음
				alertify.alert("<spring:message code="info.nodata.msg"/>", function (e){
					fnGoMain();
				});
				return false;
			}

			if("<c:out value="${modifyYn}"/>" != "Y") {//본인만 접근 가능
				alertify.alert("<spring:message code="errors.wrong.approach.msg"/>", function (e){
					fnGoMain();
				});
				return false;
			}


			$("input:radio[name=counselMethodDivCd]:input[value='${result.counselMethodDivCd}']").attr("checked", true);
			$("input:radio[name=secretYn]:input[value='${result.secretYn}']").attr("checked", true);

    		$("#hopeCounselDt").datepicker({
    			dateFormat: 'dd/mm/yy', //Input Display Format 변경
    			showOn: "both",
    			minDate: "0M", //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
    		});

    		if("${result.hopeCounselDt}" == null || "${result.hopeCounselDt}" == "") {
    			$('#hopeCounselDt').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
    		} else {
    			$("#hopeCounselDt").val("${result.hopeCounselDt}");
    		}




    		fnSetTimeSelecteBox("hopeCounselBgnTime", "${result.hopeCounselBgnTime}");
    		fnSetTimeSelecteBox("hopeCounselEndTime", "${result.hopeCounselEndTime}");
    		fnSetAmpmSelecteBox("hopeCounselBgnAmpm", "${result.hopeCounselBgnAmpm}");
    		fnSetAmpmSelecteBox("hopeCounselEndAmpm", "${result.hopeCounselEndAmpm}");



			$("input:radio[name=counselMethodDivCd]").click(function() {
				var rdoVal = $(":input:radio[name=counselMethodDivCd]:checked").val();

				if(rdoVal == COUNSEL_METHOD_DIV_CD_DEFAULT) {//online
					$("#onlineDiv").show();
					$("#telCenterDiv").hide();
				} else {
					$("#onlineDiv").hide();
					$("#telCenterDiv").show();
				}
			});


			$("#frm").ajaxForm({
				dataType : AJAX_DATA_TYPE_JSON,
				beforeSubmit : function(formData, $form, options) {

					//제목,title
					if($("#qustTitle").val() == "") {
						alertify.alert("<spring:message code="counsel.errors.title"/>", function (e){
							$("#qustTitle").focus();
						});
						return false;
					}

					if($('input[name=counselMethodDivCd]:checked').val() == COUNSEL_METHOD_DIV_CD_DEFAULT) {//ONLINE
						if($("#qustContent").val() == "") {
							alertify.alert("<spring:message code="counsel.errors.contents"/>", function (e){
								$("#qustContent").focus();
							});
							return false;
						}

						$("#hopeCounselDt").val("");
						$("#hopeCounselBgnTime").val("");
						$("#hopeCounselBgnAmpm").val("");
						$("#hopeCounselEndTime").val("");
						$("#hopeCounselEndAmpm").val("");

					} else {
						//상담일자, counsel hope date
						if($("#hopeCounselDt").val() == "") {
							alertify.alert("<spring:message code="counsel.errors.msg"/>", function (e){
								$("#hopeCounselDt").focus();
							});
							return false;
						}

						//상담시작시간, counsel hope from time
						if($("#hopeCounselBgnTime").val() == "") {
							alertify.alert("<spring:message code="counsel.errors.msg2"/>", function (e){
								$("#hopeCounselBgnTime").focus();
							});
							return false;
						}

						//상담시작시간 ampm, counsel hope from time ampm
						if($("#hopeCounselBgnAmpm").val() == "") {
							alertify.alert("<spring:message code="counsel.errors.msg2"/>", function (e){
								$("#hopeCounselBgnAmpm").focus();
							});
							return false;
						}


						//상담종료시간, counsel hope to time
						if($("#hopeCounselEndTime").val() == "") {
							alertify.alert("<spring:message code="counsel.errors.msg3"/>", function (e){
								$("#hopeCounselEndTime").focus();
							});
							return false;
						}

						//상담종료시간 ampm, counsel hope to time ampm
						if($("#hopeCounselEndAmpm").val() == "") {
							alertify.alert("<spring:message code="counsel.errors.msg3"/>", function (e){
								$("#hopeCounselEndAmpm").focus();
							});
							return false;
						}

						var strtNum = fnGetAmPm("hopeCounselBgnAmpm") + Number($("#hopeCounselBgnTime").val());
						var endNum = fnGetAmPm("hopeCounselEndAmpm") + Number($("#hopeCounselEndTime").val());

						//console.log("===============strtNum="+strtNum+",endNum="+endNum);

						if(strtNum > endNum) {
							alertify.alert("<spring:message code="counsel.errors.msg4"/>", function (e){
								$("#hopeCounselEndAmpm").focus();
							});
							return false;
						}


						$("#qustContent").val("");
					}


				},
				success : function(json, statusText, xhr, $form) {
					if (json.result.successYn == "Y") {
						alertify.alert("<spring:message code="counsel.msg.update.ok"/>", function (e){
							fnGoMoveUrl('frmSearch', '${pageContext.request.contextPath}/cpes/all/counsel/list.do');
						});

					} else {
						if(json.result.statCd == "01") {
							alertify.alert("<spring:message code="login.findId.no.data"/>");
						} else {
							alertify.alert("<spring:message code="errors.ajax.fail"/>");
						}
					}
				},
				error : function(xhr) {
					alertify.alert("<spring:message code="errors.ajax.fail"/>");
				}
			});

		});

		function fnResetForm() {
		    $('#frm')[0].reset();

			var rdoVal = $(":input:radio[name=counselMethodDivCd]:checked").val();

			if(rdoVal == COUNSEL_METHOD_DIV_CD_DEFAULT) {//online
				$("#onlineDiv").show();
				$("#telCenterDiv").hide();
			} else {
				$("#onlineDiv").hide();
				$("#telCenterDiv").show();
			}
		}

	</script>


	<main class="colgroup" id="colgroup">
		<article>
	    	<header class="sub_head">
				<div class="sub_title">
					<h2>
						<span>${counselTagetNm} <spring:message code="counsel.msg.title2"/></span>
					</h2>
				</div>
	      	</header>

	       	<div id="contents" class="counselModify">

				<div class="bbs_basic">
					<form id="frmSearch" name="frmSearch" action="${pageContext.request.contextPath}/cpes/all/counsel/list.do" method="post">
						<input type="hidden" id="condCateDivCd" name="condCateDivCd" value="${param.condCateDivCd}"/>
						<input type="hidden" id="condType" name="condType" value="${param.condType}"/>
						<input type="hidden" id="condText" name="condText" value="${param.condText}"/>
						<input type="hidden" id="currentPageNo" name="currentPageNo" value="${param.currentPageNo}"/>
						<input type="hidden" id="condSort" name="condSort" value="${param.condSort}"/>
					</form>
					<form id="frm" name="frm" action="${pageContext.request.contextPath}/cpes/all/counsel/modifyProcessAjax.do" method="post">
						<input type="hidden" id="counselCateDivCd" name="counselCateDivCd" value="${param.condCateDivCd}"/>
						<input type="hidden" id="qustJcCd" name="qustJcCd"" value="${result.qustJcCd}"/>
						<input type="hidden" id="counselSeq" name="counselSeq"" value="${result.counselSeq}"/>
						<fieldset>
							<legend><spring:message code="button.modify"/></legend>
							<div class="bbs_write_top"><span><span class="exactly y"><spring:message code="member.join.msg.required"/></span><spring:message code="member.join.msg.required"/></span></div>
							<table class="bbs_table write margin_b_15">
								<caption>Consulting Write -  Title, Counseling method,  Open/Closed</caption>
								<colgroup>
									<col style="width:15%;" />
									<col style="width:35%;" />
									<col style="width:15%;" />
									<col style="width:35%;" />
								</colgroup>
								<tbody>
								<tr>
									<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <label for="qustTitle"><spring:message code="counsel.msg.title"/></label></th>
									<td colspan="3" class="subject">
										<input type="text" id="qustTitle" name="qustTitle" placeholder="Input Title" maxlength="100" value="<c:out value="${result.qustTitle}"/>"/>
									</td>
								</tr>
								<tr>
									<th scope="row"><span class="exactly"></span> <spring:message code="counsel.msg.member.division"/></th>
									<td><c:out value="${counselTagetNm}"/></td>
									<th scope="row"><span class="exactly"></span> <spring:message code="counsel.msg.jobCenter"/></th>
									<td><c:out value="${result.qustJcNm}"/></td>
								</tr>
								<tr>
									<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="counsel.msg.method"/></th>
									<td>
										<span class="bbs_input_box">
											<c:forEach var="commCd" items="${resultList}" varStatus="status">
												<input type="radio" name="counselMethodDivCd" id="counselMethodDivCd_${status.count}" value="${commCd.dtlCd}"/>
												<label for="counselMethodDivCd_${status.count}">${commCd.cdNm}</label>
											</c:forEach>
										</span>

									</td>
									<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="counsel.msg.openYn"/></th>
									<td>
										<span class="bbs_input_box">
											<input type="radio" name="secretYn" id="secretYn_1" value="N" />
											<label for="secretYn_1"><spring:message code="counsel.msg.openYn.y"/></label>
										</span>
										<span class="bbs_input_box">
											<input type="radio" name="secretYn" id="secretYn_2" value="Y" />
											<label for="secretYn_2"><spring:message code="counsel.msg.openYn.n"/></label>
										</span>
									</td>
								</tr>
								</tbody>
							</table>
							<!-- //bbs_table write -->

							<h3><spring:message code="counsel.msg.contents"/></h3>

							<div id="onlineDiv" <c:if test="${result.counselMethodDivCd != 'CMD0000000001'}">style="display:none"</c:if>>
								<table class="bbs_table write" >
									<caption>Consulting Write -  Contents , Attach</caption>
									<colgroup>
										<col style="width:15%;" />
										<col style="width:85%;" />
									</colgroup>
									<tbody>
									<tr>
										<td colspan="2">
											<label for="content" class="skip"><spring:message code="counsel.msg.contents"/></label>
											<textarea id="qustContent" name="qustContent" cols="30" rows="10" title="Contents" class="bbs_write_content"><c:out value="${result.qustContent}"/></textarea>
										</td>
									</tr>
									<tr>
										<th scope="row"><span class="exactly"></span> <spring:message code="counsel.msg.file.add"/></th><!-- 필수 황목일 경우 exacly 에 클래스 y 추가 -->
										<td>
											<label for="attach1" class="skip"><spring:message code="counsel.msg.file.add"/></label>
											<input type="file" id="attach1" class="file" />
										</td>
									</tr>
									</tbody>
								</table>
							</div>

							<div id="telCenterDiv" <c:if test="${result.counselMethodDivCd == 'CMD0000000001'}">style="display:none"</c:if>>
								<table class="bbs_table write">
									<caption>Consulting Write -  Preferred date , Other request</caption>
									<colgroup>
										<col style="width:15%;" />
										<col style="width:85%;" />
									</colgroup>
									<tbody>
									<tr>
										<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="counsel.msg.datetime"/></th>
										<td>
											<span class="bbs_time">
												<label for="hopeCounselDt" class="skip">date</label>
												<input type="text" id="hopeCounselDt" name="hopeCounselDt" readonly="true"/>

											</span>
											<span class="bbs_time">
												<label for="hopeCounselBgnTime" class="skip">start time</label>
												<select id="hopeCounselBgnTime" name="hopeCounselBgnTime" title="start time">
													<option value=""><spring:message code="member.join.msg.choice"/></option>
												</select>
												<select id="hopeCounselBgnAmpm" name="hopeCounselBgnAmpm" title="start time">
													<option value=""><spring:message code="member.join.msg.choice"/></option>
												</select>
											</span>
											&nbsp;-&nbsp;
											<span class="bbs_time">
												<label for="hopeCounselEndTime" class="skip">finish time</label>
												<select id="hopeCounselEndTime" name="hopeCounselEndTime" title="start time">
													<option value=""><spring:message code="member.join.msg.choice"/></option>
												</select>
												<select id="hopeCounselEndAmpm" name="hopeCounselEndAmpm" title="start time">
													<option value=""><spring:message code="member.join.msg.choice"/></option>
												</select>
											</span>
										</td>
									</tr>
									<tr>
										<th scope="row"><span class="exactly"></span> <label for="qustEtcReq"><spring:message code="counsel.msg.other"/></label></th>
										<td><textarea id="qustEtcReq" name="qustEtcReq" cols="30" rows="10" title="Contents"><c:out value="${result.qustEtcReq}"/></textarea></td>
									</tr>
									</tbody>
								</table>
							</div>

							<div class="bbs_btn_wrap clearfix">
								<span class="bbs_left">
									<a href="javascript:fnGoList('frmSearch');" class="bbs_btn list"><spring:message code="button.list"/></a>
								</span>
								<span class="bbs_right">
									<input type="submit" value="<spring:message code="button.save"/>" class="bbs_btn save" />
									<a href="javascript:fnResetForm();" class="bbs_btn cancel"><spring:message code="login.findPwd.btn.cancel"/></a>
									<input type="button" onclick="javascript:fnGoCounselDelete('${result.counselSeq}');" value="<spring:message code="button.delete"/>" class="bbs_btn save" />
								</span>
							</div>
							<!-- //bbs_btn_wrap -->

						</fieldset>
					</form>

				</div>
				<!-- //bbs_basic write -->

			</div>
	    	<!-- //contents -->
	    </article>
	</main>
	<!-- //main.colgroup -->
