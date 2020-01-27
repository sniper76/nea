<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
    <script>
    	$(document).ready(function() {

			$("#counselMethodDivCd_1").prop("checked", true);//online checked
			$("#secretYn_1").prop("checked", true);//open yn checked
			fnCounselWriteDetail();//상담방법에따른 화면분기

			$("input:radio[name=counselMethodDivCd]").click(function() {
				fnCounselWriteDetail();
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
						alertify.alert("<spring:message code="counsel.msg.reg.ok"/>", function (e){
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


		function fnCounselWriteDetail() {
			$.ajax({
				url: contextPath + "/cpes/all/counsel/writeDtailAjax.do",
				data: {
					condMethodDivCd: $('input[name=counselMethodDivCd]:checked').val()
				},
				method: METHOD_POST,
				dataType: AJAX_DATA_TYPE_HTML
			})
			.done(function(data) {
				$("#counselContentArea").html(data);
			})
			.fail(function(xhr, status, errorThrown) {
				alertify.alert("<spring:message code="errors.ajax.fail"/>");
			})
			//fnTestDefaultData();
		}


		function fnResetForm() {
		    $('#frm')[0].reset();
			$("#counselMethodDivCd_1").prop("checked", true);//online checked
			$("#secretYn_1").prop("checked", true);//open yn checked

		    //방법2 - 문서에 있는 모든 form을 리셋
		    //$('form').each(function(){
		    //	this.reset();
		    //});
		}

		function fnTestDefaultData() {
			$("#qustTitle").val("진로게시판 상담 제목");
			$("#qustContent").val("진로게시판 상담 내용");
			$("#hopeCounselDt").val("2019-10-28");
			$("#hopeCounselBgnTime").val("01");
			$("#hopeCounselBgnAmpm").val("AM");
			$("#hopeCounselEndTime").val("15");
			$("#hopeCounselEndAmpm").val("PM");

		}

	</script>
    <title>National Employment Agency Internal Portal</title>
</head>
<body>

	<main class="colgroup" id="colgroup">
		<article>
	    	<header class="sub_head">
				<div class="sub_title">
					<h2>
						<span><spring:message code="counsel.msg.oneAndOne.title"/></span>
					</h2>
				</div>
	      	</header>

	       	<div id="contents" class="counselWrite">

				<div class="bbs_basic">
					<form id="frmSearch" name="frmSearch" action="${pageContext.request.contextPath}/cpes/all/counsel/list.do" method="post">
						<input type="hidden" id="condCateDivCd" name="condCateDivCd" value="${param.condCateDivCd}"/>
						<input type="hidden" id="condType" name="condType" value="${param.condType}"/>
						<input type="hidden" id="condText" name="condText" value="${param.condText}"/>
						<input type="hidden" id="currentPageNo" name="currentPageNo" value="${param.currentPageNo}"/>
						<input type="hidden" id="condSort" name="condSort" value="${param.condSort}"/>
					</form>
					<form id="frm" name="frm" action="${pageContext.request.contextPath}/cpes/all/counsel/writeProcessAjax.do" method="post">
						<input type="hidden" id="counselTargetCd" name="counselTargetCd" value="${param.condTargetCd}"/>
						<input type="hidden" id="counselCateDivCd" name="counselCateDivCd" value="${param.condCateDivCd}"/>
						<input type="hidden" id="qustJcCd" name="qustJcCd"" value="${result.jcCd}"/>
						<fieldset>
							<legend>Write a post</legend>
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
									<td colspan="3" class="subject"><input type="text" id="qustTitle" name="qustTitle" placeholder="Input Title" maxlength="100" /></td>
								</tr>
								<tr>
									<th scope="row"><span class="exactly"></span> <spring:message code="counsel.msg.member.division"/></th>
									<td><c:out value="${counselTagetNm}"/></td>
									<th scope="row"><span class="exactly"></span> <spring:message code="counsel.msg.jobCenter"/></th>
									<td><c:out value="${result.jcNm}"/></td>
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

							<div id="counselContentArea">
							</div>

							<div class="bbs_btn_wrap clearfix">
								<span class="bbs_left">
									<a href="javascript:fnGoList('frmSearch');" class="bbs_btn list"><spring:message code="button.list"/></a>
								</span>
								<span class="bbs_right">
									<input type="submit" value="<spring:message code="button.save"/>" class="bbs_btn save" />
									<a href="javascript:fnResetForm();" class="bbs_btn cancel"><spring:message code="login.findPwd.btn.cancel"/></a>
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