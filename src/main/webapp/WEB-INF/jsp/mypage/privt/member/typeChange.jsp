<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
	<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>

    <script>
    	$(document).ready(function() {
			if("<c:out value="${userExistYn}"/>" == "N") {//사용자가 존재하지않음
				alertify.alert("<spring:message code="login.findId.no.data"/>", function (e){
					fnGoMain();
				});
				return false;
			}

/* 			html2canvas($('#colgroup')[0]).then(function(canvas) {
				    var doc = new jsPDF('p', 'mm', 'a4'); //jspdf객체 생성
				    var imgData = canvas.toDataURL('image/png'); //캔버스를 이미지로 변환
				    doc.addImage(imgData, 'PNG', 0, 0); //이미지를 기반으로 pdf생성
				    doc.save('sample-file.pdf'); //pdf저장
			}); */


    	});


		function fnResetForm() {
		    $('#frm')[0].reset();
		}


		function fnSave() {
			if($("#chgPrevCd").val() == $("#chgNextCd").val()) {
				alertify.alert("<spring:message code="mypage.private.member.errors.msg4"/>", function (e){
					$("#chgPrevCd").focus();
				});

				return false;
			}

			if($("#chgReason").val() == "") {
				alertify.alert("<spring:message code="mypage.private.member.errors.msg5"/>", function (e){
					$("#chgReason").focus();
				});

				return false;
			}


			alertify.confirm("<spring:message code="mypage.private.member.title24"/>", function (e) {
				if (e) {
					$.ajax({
						url: contextPath + "/cpes/private/member/typeChangeProcessAjax.do",
						type: 'post',
						data: $("#frm").serialize(),
						datatype: 'json'
					})
					.done(function(data) {
						if (data.result.successYn == "Y") {
							alertify.alert("<spring:message code="mypage.private.member.title23"/>");
							$("#chgAgreeStsNmTd").html(data.result2.chgAgreeStsNm);//승인 상태
							$("#userChgSeq").val(data.result2.userChgSeq);//수정이 필요할경우
							$("#btnDiv").hide();//버튼영역

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
			});
		}
	</script>
	<main class="colgroup" id="colgroup">
		<article>
	    	<header class="sub_head">
				<div class="sub_title">
					<h2>
						<span><spring:message code="mypage.private.member.title13"/></span>
					</h2>
				</div>
	      	</header>

	       	<div id="contents" class="memberTypeChange">
				<div class="box type2 icon change_user">
					<div class="box_wrap">
						<strong class="title">${result.userNm} <spring:message code="mypage.private.member.title14"/></strong>
						<p><spring:message code="mypage.private.member.title15"/> <br /><spring:message code="mypage.private.member.title16"/> </p>
					</div>
				</div>
				<form id="frm" name="frm" action="${pageContext.request.contextPath}/cpes/p  rivate/member/typeChangeProcessAjax.do" method="post">
					<input type="hidden" id="chgPrevCd" name="chgPrevCd" value="${result.userAuthCd}"/>
					<input type="hidden" id="userChgSeq" name="userChgSeq" value="${result2.userChgSeq}"/>
					<fieldset>
						<legend>Change User Type</legend>
						<table class="bbs_table write">
							<caption>Change User Type</caption>
							<colgroup>
								<col style="width:20%" />
								<col />
							</colgroup>
							<tbody>
							<tr>
								<th scope="row"><spring:message code="search.name"/></th>
								<td>${result.userNm}</td>
							</tr>
							<tr>
								<th scope="row"><spring:message code="mypage.private.member.title17"/></th>
								<td>${result.userAuthNm}</td>
							</tr>
							<tr>
								<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <label for="chgNextCd"><spring:message code="mypage.private.member.title18"/></label></th>
								<td>
									<select id="chgNextCd" name="chgNextCd">
										<c:forEach var="data" items="${userAuthCd}" varStatus="status">
											<c:if test="${data.dtlCd == 'ROLE_STDIT' || data.dtlCd == 'ROLE_USER' }">
											<option value="${data.dtlCd}"
												<c:choose>
													<c:when test="${empty result2 and result.userAuthCd == data.dtlCd}">selected</c:when>
													<c:when test="${!empty result2 and result2.chgNextCd == data.dtlCd}">selected</c:when>
												</c:choose>>
												${data.cdNm}
											</option>
											</c:if>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span><label for="chgReason"><spring:message code="mypage.private.member.title19"/></label></th>
								<td>
									<textarea id="chgReason" name="chgReason" onBlur="javascript:fnBytesHandler(this,'chgReason',2500);">${result2.chgReason}</textarea>
								</td>
							</tr>
							<tr>
								<th scope="row"><spring:message code="mypage.private.member.title20"/></th>
								<td id="chgAgreeStsNmTd">${result2.chgAgreeStsNm}</td>
							</tr>
							<tr>
								<th scope="row"><spring:message code="mypage.private.member.title21"/></th>
								<td>${result2.agreeRejectReason}</td>
							</tr>
							</tbody>
						</table>
						<c:if test="${empty result2}">
						<div class="bbs_btn_wrap" id="btnDiv">
							<div class="bbs_center">
								<a href="javascript:void(0);" onClick="fnResetForm();" class="bbs_btn type02 margin_r_5"><spring:message code="login.findPwd.btn.cancel"/></a>
								<input type="button" onclick="fnSave();" value="<spring:message code="mypage.private.member.title22"/>" class="bbs_btn type01" />
							</div>
						</div>
						</c:if>
					</fieldset>
				</form>
			</div>
	    	<!-- //contents -->
	    </article>
	</main>
	<!-- //main.colgroup -->