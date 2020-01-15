<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
    <script>
    	var teachAddrNum = 1;
    	var keywordArr = new Array;
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

    		CKEDITOR.replace('contentEditor', {
    			height: 500,
    			filebrowserImageUploadUrl: contextPath + '/common/ckeditorImgUpload.do'
    		});
    		CKEDITOR.instances.contentEditor.setData($("#content").val());//에디터

			commonPopupSet('addr', true);
			commonPopupSet('isco');


			fnIscedCdList('1','major1depthCd','','${result.major1depthCd}');//전공,major
			fnIscedCdList('2','major2depthCd','${result.major1depthCd}','${result.major2depthCd}');//major 2depth

    		$("#recurmtBgnDt").datepicker({
    			dateFormat: 'dd/mm/yy', //Input Display Format 변경
    			showOn: "both",
    			minDate: "0M", //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
    		});


    		$("#recurmtEndDt").datepicker({
    			dateFormat: 'dd/mm/yy', //Input Display Format 변경
    			showOn: "both",
    			minDate: "0M", //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
    		});


    		$("#eduBgnDt").datepicker({
    			dateFormat: 'dd/mm/yy', //Input Display Format 변경
    			showOn: "both",
    			minDate: "0M", //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
    		});


    		$("#eduEndDt").datepicker({
    			dateFormat: 'dd/mm/yy', //Input Display Format 변경
    			showOn: "both",
    			minDate: "0M", //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
    		});


    		<c:if test="${!empty result}">
    		    teachAddrNum = "${fn:length(resultList2)}";//주소 현재갯수

				<c:if test="${result.eduTrnngKeyword != ''}">
	    			<c:forEach items="${fn:split(result.eduTrnngKeyword, ',') }" var="item">
	    				<c:if test="${item != ''}">
	    				keywordArr.push("${item}");
	    				</c:if>
	    			</c:forEach>

	    			$("#eduTrnngKeyword").val(keywordArr.join(","));
				</c:if>
			</c:if>

    		$('#keyword').on('keydown', function(event){
    			var keywordVal = $("#keyword").val();
    			//console.log("event.keyCode="+event.keyCode+",keywordVal.length1111="+$("#keyword").val().length);

    			if((event.keyCode)&&(event.keyCode==13) && keywordVal.length > 0){
    				//console.log("##################keywordVal1="+$("#keyword").val());
	    			var text = keywordVal.charAt(0);
	    			if(text == "#") {
	    				var keywordChk = true;
	    				for(var i=0; i<keywordArr.length; i++) {
	    					if(keywordArr[i] == keywordVal) {
	    						keywordChk = false;
	    						break;
	    					}
	    				}
	    				if(keywordChk && keywordArr.length < 5) {

	    					//console.log("=================keywordVal="+keywordVal);
		    				$(this).parents('.form_element').addClass('active').find('.text_box').append('<span>'+keywordVal+'<button type="button" value='+keywordVal+' onclick="fnDeleteKeyword(this)">delete</button></span>');
		    				keywordArr.push($("#keyword").val());
		    				$("#eduTrnngKeyword").val(keywordArr);

	    				}

	    				//console.log("##################keywordArr="+keywordArr);
	    				//console.log("##################eduTrnngKeyword="+$("#eduTrnngKeyword").val());
	    			}
	    			$("#keyword").val("");
	    			return false;
    			}

    		});





    	});

    	function fnDeleteKeyword(obj) {
    		var val = $(obj).val();
    		//console.log("obj="+$(obj).val());

    		keywordArr = $.grep(keywordArr, function(value) {
    			  return value != val;
    		});
    		$("#eduTrnngKeyword").val(keywordArr);
    		//console.log("====================fnDeleteKeyword="+keywordArr)


    	}

    	function fnSave() {
			//교육프로그래명
			if($("#eduTrnngNm").val() == "") {
				alertify.alert("<spring:message code="mypage.instt.eduTrnng.erros.msg2"/>", function (e){
					$("#eduTrnngNm").focus();
				});
				return false;
			}

			//교육프로그램 구분
			if(!$("input:radio[name='trnngNatnexpDivCd']").is(":checked")) {
				alertify.alert("<spring:message code="mypage.instt.eduTrnng.erros.msg3"/>", function (e){
					$("input:radio[name='trnngNatnexpDivCd']").focus();
				});

				return false;
			}

			//기술/직업 교육 코스
			if($("#skillJobProgramCorsCd").val() == "") {
				alertify.alert("<spring:message code="mypage.instt.eduTrnng.erros.msg4"/>", function (e){
					$("#skillJobProgramCorsCd").focus();
				});

				return false;
			}

			//고등/일반 교육 프로그램
			if($("#highGenrlEduCorsCd").val() == "") {
				alertify.alert("<spring:message code="mypage.instt.eduTrnng.erros.msg5"/>", function (e){
					$("#highGenrlEduCorsCd").focus();
				});

				return false;
			}

			//모집기간
			if($("#recurmtBgnDt").val() == "") {
				alertify.alert("<spring:message code="mypage.instt.eduTrnng.erros.msg6"/>", function (e){
					$("#recurmtBgnDt").focus();
				});

				return false;
			}

			if($("#recurmtEndDt").val() == "") {
				alertify.alert("<spring:message code="mypage.instt.eduTrnng.erros.msg6"/>", function (e){
					$("#recurmtEndDt").focus();
				});

				return false;
			}

			if($("#recurmtBgnDt").val() > $("#recurmtEndDt").val()) {
				alertify.alert("<spring:message code="mypage.instt.eduTrnng.erros.msg7"/>", function (e){
					$("#recurmtEndDt").focus();
				});

				return false;
			}

			//교육기간
			if($("#eduBgnDt").val() == "") {
				alertify.alert("<spring:message code="mypage.instt.eduTrnng.erros.msg8"/>", function (e){
					$("#eduBgnDt").focus();
				});

				return false;
			}

			if($("#eduEndDt").val() == "") {
				alertify.alert("<spring:message code="mypage.instt.eduTrnng.erros.msg8"/>", function (e){
					$("#eduEndDt").focus();
				});

				return false;
			}

			if($("#eduBgnDt").val() > $("#eduEndDt").val()) {
				alertify.alert("<spring:message code="mypage.instt.eduTrnng.erros.msg7"/>", function (e){
					$("#eduEndDt").focus();
				});

				return false;
			}

			//기간
			if($("#eduDura").val() == "") {
				alertify.alert("<spring:message code="mypage.instt.eduTrnng.erros.msg9"/>", function (e){
					$("#eduDura").focus();
				});

				return false;
			}

			//강의 시간/요일
			if($("#teachHourWeek").val() == "") {
				alertify.alert("<spring:message code="mypage.instt.eduTrnng.erros.msg10"/>", function (e){
					$("#teachHourWeek").focus();
				});

				return false;
			}


			//수강 장소
			var teachAddrChk = true;
			var teachAddrLength = $("select[name=teachAddr]").length;
			var teachAddrArr = new Array;
			var teachAddrChk2 = false;

			$("select[name=teachAddr]").each(function(i, selected){

				var id = $(this).attr("id");
				if($(this).val() == "") {
					alertify.alert("<spring:message code="mypage.instt.eduTrnng.erros.msg11"/>", function (e){
						$("#"+id).focus();
					});

					teachAddrChk = false;
					return false;
				} else {

					for(var k=0; k<teachAddrArr.length; k++) {

						if(teachAddrArr[k] == $(this).val()) {
							teachAddrChk2 = true;
						}
					}

					if(teachAddrChk2) {//중복된 주소가 있을경우
						alertify.alert("<spring:message code="mypage.instt.eduTrnng.erros.msg19"/>", function (e){
							$("#"+id).focus();
						});
						return false;
					} else {
						teachAddrArr.push($(this).val());
					}


				}

			});

			if(teachAddrChk == false) {//주소가 입력되지 않은경우
				return false;
			}

			if(teachAddrChk2) {//중복된 주소가 있을경우
				return false;
			}

			$("#teachAddrCd").val(teachAddrArr.join(","));
			//console.log("===============teachAddrCd="+$("#teachAddrCd").val());


			//교육프로그램 type
			if($("#programCorsTypeCd").val() == "") {
				alertify.alert("<spring:message code="mypage.instt.eduTrnng.erros.msg10"/>", function (e){
					$("#programCorsTypeCd").focus();
				});

				return false;
			}

			//전공/프로그램/연구분야
			if($("#major1depthCd").val() == "") {
				alertify.alert("<spring:message code="mypage.instt.eduTrnng.erros.msg13"/>", function (e){
					$("#major1depthCd").focus();
				});

				return false;
			}

			if($("#major2depthCd").val() == "") {
				alertify.alert("<spring:message code="mypage.instt.eduTrnng.erros.msg13"/>", function (e){
					$("#major2depthCd").focus();
				});

				return false;
			}

			//모집직종
			if($("#iscoCd").val() == "") {
				alertify.alert("<spring:message code="compny.vacancy.errors.msg45"/>", function (e){
					$("#btnIscoCd").focus();
				});

				return false;
			}


			//수강료
			if(!$("input:radio[name='freePaidYn']").is(":checked")) {
				alertify.alert("<spring:message code="mypage.instt.eduTrnng.erros.msg14"/>", function (e){
					$("input:radio[name='freePaidYn']").focus();
				});

				return false;
			}

			if($("input:radio[name='freePaidYn']:checked").val() == "Y") {
				if($("#tuition").val() == "") {
					alertify.alert("<spring:message code="mypage.instt.eduTrnng.erros.msg20"/>", function (e){
						$("#tuition").focus();
					});
					return false;
				}
			}

			// 참가대상
			if($("#eduTarget").val() == "") {
				alertify.alert("<spring:message code="mypage.instt.eduTrnng.erros.msg15"/>", function (e){
					$("#eduTarget").focus();
				});

				return false;
			}

			// 신청조건
			if($("#admssCriteria").val() == "") {
				alertify.alert("<spring:message code="mypage.instt.eduTrnng.erros.msg16"/>", function (e){
					$("#admssCriteria").focus();
				});

				return false;
			}

			var contentVal = CKEDITOR.instances.contentEditor.getData();

			if(contentVal == "") {
				alertify.alert("<spring:message code="counsel.errors.contents"/>", function (e){
					$("#contentEditor").focus();
				});
				return false;
			} else{
				$('#content').val(contentVal);
			}

			// 신청방법
			if($("#enrolMethod").val() == "") {
				alertify.alert("<spring:message code="mypage.instt.eduTrnng.erros.msg18"/>", function (e){
					$("#enrolMethod").focus();
				});

				return false;
			}

			var rdoVal = $('input[name="trnngNatnexpDivCd"]:checked').val();
			if(rdoVal == "NDC0000000001") {//교육 프로그램 구분 TRAINNING일경우만 스폰서 입력
				$("#sponsor").val("");
			}


			//console.log("===============keyword="+$("#eduTrnngKeyword").val());

			$.ajax({
				url: contextPath + "/cpes/instt/eduTrnng/modifyProcessAjax.do",
				type: 'post',
				data: $("#frm").serialize(),
				datatype: 'json'
			})
			.done(function(data) {
				if (data.result.successYn == "Y") {
					alertify.alert("<spring:message code="counsel.msg.update.ok"/>", function (e){
						fnGoMoveUrl('frmSearch', '${pageContext.request.contextPath}/cpes/instt/eduTrnng/list.do');
					});
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



		function fnTeachAddrAdd(num) {
			teachAddrNum = num + 1;

			var strHtml = "";
			var noOption = "<spring:message code="member.join.msg.choice"/>";
			strHtml += "<div id=\"teachAddrAddDiv_"+(num+1)+"\"  class=\"bbs_add_box\">";
			strHtml += "<label for=\"teachAddr_"+(num+1)+"\" class=\"skip\">수강 장소</label>";
			strHtml += "<select id=\"teachAddr_"+(num+1)+"\" name=\"teachAddr\">";
			strHtml += "<option value=\"\">"+noOption+"</option>";

			<c:forEach var="data" items="${resultList}" varStatus="status">
				strHtml += "<option value=\"${data.lvlCd}\">${data.nm}</option>";
			</c:forEach>

			strHtml += "</select> ";
			strHtml += "<span class=\"button_box\">";
			strHtml += "<button type=\"button\" class=\"add\" onclick=\"fnTeachAddrAdd("+(num+1)+");\">add</button> ";
			strHtml += "<button type=\"button\" class=\"del\" onclick=\"fnTeachAddrDel("+(num+1)+");\">del</button>";
			strHtml += "</span>";
			strHtml += "</div>";

			$("#teachAddrAddTd").append(strHtml);
		}



		function fnTeachAddrDel(num) {
			$("#teachAddrAddDiv_"+num).remove();
		}




    	function fnSetIsco(json){
    		var iscoHtml = '<span class="bbs_add">' + json.commonNm + '<button type="button" class="delete">delete</button></span>';
    		$('#spanIscoCd').html(iscoHtml);
    		$('#iscoCd').val(json.commonCd);
    		fnDeleteSpan();
    	}

    	function fnDeleteSpan(){
    		/*
    		 * 직종 / 근무지역 삭제 버튼 처리
    		 * 해당 화면에서만 사용할 것 같아 이곳에 추가
    		 */
    		$('.delete').unbind();
    		$('.delete').on('click', function(e){
				$(e.target).closest('span').remove();
    		});
    	}

    	function fnDeleteSpan2(){
    		$('#spanIscoCd').html("");
    		$('#iscoCd').val("");
    	}


    	function fnRadioChange(nm) {
    		var val = $("input[name="+nm+"]:checked").val();
      		if(nm == "freePaidYn") {
	    		if(val == "Y") {
	    			$("#freePaidYnSpan").show();
	    		} else {
	    			$("#freePaidYnSpan").hide();
	    		}
    		}
    	}

		function fnResetForm() {
		    $('#frm')[0].reset();
		}

    	function fnTrnngNatnexpDivCd() {
			var rdoVal = $('input[name="trnngNatnexpDivCd"]:checked').val();
			if(rdoVal == "NDC0000000001") {
				$("#sponsorTr").hide();
			} else {
				$("#sponsorTr").show();
			}

    	}


	</script>
	<main class="colgroup" id="colgroup">
    	<article>
			<header class="sub_head">
				<div class="sub_title">
					<h2><span><spring:message code="mypage.instt.eduTrnng.title23"/></span></h2>
				</div>
           	</header>
			<div id="contents" class="eduTrnngModify">


				<fieldset>
					<legend>registration</legend>


					<form id="frmSearch" name="frmSearch" action="${pageContext.request.contextPath}/cpes/instt/eduTrnng/list.do" method="post">
						<input type="hidden" id="condType" name="condType" value="${param.condType}"/>
						<input type="hidden" id="condText" name="condText" value="${param.condText}"/>
						<input type="hidden" id="currentPageNo" name="currentPageNo" value="${param.currentPageNo}"/>
						<input type="hidden" id="condSort" name="condSort" value="${param.condSort}"/>
						<input type="hidden" id="condStatCd" name="condStatCd" value="${param.condStatCd}"/>
					</form>

					<form id="frm" name="frm" action="${pageContext.request.contextPath}/cpes/instt/eduTrnng/modifyProcessAjax.do" method="post">
						<input type="hidden" id="eduTrnngKeyword" name="eduTrnngKeyword"/>
						<input type="hidden" id="iscoCd" name="iscoCd" value="${result.iscoCd}"/><!-- 직종 -->
						<input type="hidden" id="teachAddrCd" name="teachAddrCd"/>
						<input type="hidden" id="content" name="content" value="${result.content }"/>
						<input type="hidden" id="eduTrnngSubSeq" name="eduTrnngSubSeq" value="${result.eduTrnngSubSeq }"/>
						<input type="hidden" id="eduTrnngSeq" name="eduTrnngSeq" value="${result.eduTrnngSeq }"/>

						<div class="profile_title <c:if test="${!empty result}">active</c:if>">
							<label for="vacancyTitle"><spring:message code="mypage.instt.eduTrnng.title4"/></label>
							<input type="text" id="eduTrnngNm" name="eduTrnngNm" maxlength="300" value="${result.eduTrnngNm}" />
						</div>
						<div class="form_title type2">
							<h3><span class="bbs_ico necessary"><spring:message code="member.join.msg.required"/></span> <spring:message code="mypage.instt.eduTrnng.title3"/></h3>
							<span class="cont"><span class="exactly y"><spring:message code="member.join.msg.required"/></span><spring:message code="member.join.msg.required"/></span>
						</div>
						<table class="bbs_table write type2">
							<caption>Conditions Input</caption>
							<colgroup>
								<col style="width:25%" />
								<col style="width:75%" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="mypage.instt.eduTrnng.title5"/></th>
									<td>
										<c:forEach var="data" items="${trnngNatnexpDivCd}" varStatus="status">
											<span class="bbs_input_box">
												<input type="radio" name="trnngNatnexpDivCd" id="trnngNatnexpDivCd_${status.count}" value="${data.dtlCd}" <c:if test="${result.trnngNatnexpDivCd == data.dtlCd}">checked</c:if> onclick="fnTrnngNatnexpDivCd();">
												<label for="trnngNatnexpDivCd_${status.count}">${data.cdNm}</label>
											</span>
										</c:forEach>
									</td>
								</tr>
								<tr>
									<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="mypage.instt.eduTrnng.title6"/></th>
									<td>
										<select id="skillJobProgramCorsCd" name="skillJobProgramCorsCd">
											<c:forEach var="data" items="${skillJobProgramCorsCd}" varStatus="status">
												<option value="${data.dtlCd}" <c:if test="${result.skillJobProgramCorsCd == data.dtlCd}">selected</c:if>>${data.cdNm}</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="mypage.instt.eduTrnng.title7"/></th>
									<td>
										<select id="highGenrlEduCorsCd" name="highGenrlEduCorsCd">
											<c:forEach var="data" items="${hgepDivCd}" varStatus="status">
												<option value="${data.dtlCd}" <c:if test="${result.highGenrlEduCorsCd == data.dtlCd}">selected</c:if>>${data.cdNm}</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="mypage.instt.eduTrnng.title8"/></th>
									<td>

										<span class="bbs_time type2">
											<label for="recurmtBgnDt" class="skip">Start date</label>
											<input type="text" id="recurmtBgnDt" name="recurmtBgnDt" readonly="true" value="${result.recurmtBgnDt2}">
										</span>
										&nbsp;~&nbsp;
										<span class="bbs_time type2">
											<label for="recurmtEndDt" class="skip">End date</label>
											<input type="text" id="recurmtEndDt" name="recurmtEndDt" readonly="true" value="${result.recurmtEndDt2}">
										</span>

										</span>
									</td>
								</tr>
								<tr>
									<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="mypage.instt.eduTrnng.title9"/></th>
									<td>

										<span class="bbs_time type2">
											<label for="eduBgnDt" class="skip">Start date</label>
											<input type="text" id="eduBgnDt" name="eduBgnDt" readonly="true" value="${result.eduBgnDt2}">
										</span>
										&nbsp;~&nbsp;
										<span class="bbs_time type2">
											<label for="eduEndDt" class="skip">End date</label>
											<input type="text" id="eduEndDt" name="eduEndDt" readonly="true" value="${result.eduEndDt2}">
										</span>

										</span>
									</td>
								</tr>
								<tr>
									<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="mypage.instt.eduTrnng.title10"/></th>
									<td>
										<span>
											<input type="text" id="eduDura" name="eduDura" value="${result.eduDura}" maxlength="4" onKeyPress="return fnCheckNumber(event);" style="width:80px;margin:0 5px;"/>
											<label for="eduDura"><spring:message code="compny.vacancy.msg.title18"/></label>
										</span>
									</td>
								</tr>

								<tr>
									<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <label for="teachHourWeek"><spring:message code="mypage.instt.eduTrnng.title11"/></label></th>
									<td>
										<div>
											<textarea id="teachHourWeek" name="teachHourWeek" onBlur="javascript:fnBytesHandler(this,null,2000);"><c:out value="${result.teachHourWeek}"/></textarea>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="mypage.instt.eduTrnng.title12"/></th>
									<td id="teachAddrAddTd">
										<c:forEach var="data2" items="${resultList2}" varStatus="status2">
										<div class="bbs_add_box">
											<label for="teachAddr" class="skip"><spring:message code="mypage.instt.eduTrnng.title12"/></label>
											<select id="teachAddr_${status2.count}" name="teachAddr">
												<c:forEach var="data" items="${resultList}" varStatus="status">
													<option value="${data.lvlCd}" <c:if test="${data2.addrCd == data.lvlCd}">selected</c:if>>${data.nm}</option>
												</c:forEach>
											</select>
											<span class="button_box">
												<button type="button" class="add" onclick="fnTeachAddrAdd(${status2.count});"><spring:message code="mypage.instt.eduTrnng.title13"/></button>
												<c:if test="${status2.count > 1}">
												<button type="button" class="del" onclick="fnTeachAddrDel(${status2.count});">del</button>
												</c:if>

											</span>
										</div>
										</c:forEach>
									</td>
								</tr>
								<tr>
									<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="mypage.instt.eduTrnng.title14"/></th>
									<td>
										<select id="programCorsTypeCd" name="programCorsTypeCd">
											<c:forEach var="data" items="${pcTypeCd}" varStatus="status">
												<option value="${data.dtlCd}" <c:if test="${result.programCorsTypeCd == data.dtlCd}">selected</c:if>>${data.cdNm}</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="mypage.instt.eduTrnng.title15"/></th>
									<td>
										<label for="major1depthCd" class="skip"><spring:message code="mypage.instt.eduTrnng.title16"/></label>
										<select id="major1depthCd" name="major1depthCd" onchange="fnIscedCdUpperList('major1depthCd','major2depthCd');">

										</select>
										<label for="major2depthCd" class="skip"><spring:message code="mypage.instt.eduTrnng.title16"/></label>
										<select id="major2depthCd" name="major2depthCd">

										</select>
									</td>
								</tr>
								<tr>
									<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title5"/></th>
									<td>
										<div class="bbs_add_wrap">
											<button type="button" id="btnIscoCd" class="btn add noround popup_isco" onclick="callback(fnSetIsco, 'isco');"><spring:message code="member.join.msg.choice"/></button>
											<span class="cont" id="spanIscoCd"><!-- 선택사항 들어갈 자리 -->
											<c:if test="${not empty result.iscoCd}">
												<span class="bbs_add">${result.iscoNm}<button type="button" onclick="fnDeleteSpan2();" class="delete">delete</button></span>
											</c:if>
											</span>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="mypage.instt.eduTrnng.title17"/></th>
									<td>
										<span class="bbs_input_box">
											<input type="radio" name="freePaidYn" id="freePaidYn_1" value="N" onchange="fnRadioChange('freePaidYn');" <c:if test="${result.freePaidYn == 'N'}">checked</c:if>>
											<label for="freePaidYn_1"><spring:message code="mypage.instt.eduTrnng.msg"/></label>
										</span>
										<span class="bbs_input_box">
											<input type="radio" name="freePaidYn" id="freePaidYn_2" value="Y" onchange="fnRadioChange('freePaidYn');" <c:if test="${result.freePaidYn == 'Y'}">checked</c:if>>
											<label for="freePaidYn_2"><spring:message code="mypage.instt.eduTrnng.msg2"/></label>
										</span>
										<span id="freePaidYnSpan" style="display:<c:if test="${result.freePaidYn == 'N'}">none</c:if>"><!-- Paid 선택했을 때 나오는 인풋 -->
											<label for="tuition" class="skip">tuition</label>
											<input type="text" id="tuition" name="tuition" value="${result.tuition}" maxlength="6" onkeyup="fnCheckDecimalNumber(this,2);"  style="width:80px;margin:0 5px;" /> $
										</span>
									</td>
								</tr>
								<tr id="sponsorTr" style="display:<c:if test="${result.trnngNatnexpDivCd != 'NDC0000000002'}">none</c:if>">
									<th scope="row"><span class="exactly"></span> <spring:message code="mypage.compny.fail.reason.msg11"/></th>
									<td>
										<span>
											<input type="text" id="sponsor" name="sponsor" value="${result.sponsor}" maxlength="300" />
										</span>
									</td>
								</tr>

							</tbody>
						</table>
						<div class="form_title type2">
							<h3><span class="bbs_ico necessary"><spring:message code="member.join.msg.required"/></span> <spring:message code="mypage.instt.eduTrnng.title18"/></h3>
						</div>
						<ul class="form_list clearfix">
							<li>
								<div class="form_list_wrap">
									<div class="form_list_title">
										<strong class="title"><span class="bbs_ico necessary"><spring:message code="member.join.msg.required"/></span> <label for="eduTarget"><spring:message code="mypage.instt.eduTrnng.title19"/></label></strong>
									</div>
									<div class="form_list_contents">
										<input type="text" id="eduTarget" name="eduTarget" value="${result.eduTarget}" maxlength="200" />
									</div>
								</div>
							</li>
							<li>
								<div class="form_list_wrap">
									<div class="form_list_title">
										<strong class="title"><span class="bbs_ico necessary"><spring:message code="member.join.msg.required"/></span> <label for="admssCriteria"><spring:message code="mypage.instt.eduTrnng.title20"/></label></strong>
									</div>
									<div class="form_list_contents">
										<textarea id="admssCriteria" name="admssCriteria" onBlur="javascript:fnBytesHandler(this,null,800);"><c:out value="${result.admssCriteria}"/></textarea>
									</div>
								</div>
							</li>
							<li>
								<div class="form_list_wrap">
									<div class="form_list_title">
										<strong class="title"><span class="bbs_ico necessary"><spring:message code="member.join.msg.required"/></span> <spring:message code="mypage.instt.eduTrnng.title21"/></strong>
									</div>
									<div class="form_list_contents">
										<div class="form_editor"><!-- 에디터 들어갈 자리 -->
											<textarea id="contentEditor" name="contentEditor" cols="30" rows="5" title="Contents" class="bbs_write_content"></textarea>
										</div>
									</div>
								</div>
							</li>
							<li>
								<div class="form_list_wrap">
									<div class="form_list_title">
										<strong class="title"><span class="bbs_ico necessary"><spring:message code="member.join.msg.required"/></span> <label for="enrolMethod"><spring:message code="mypage.instt.eduTrnng.title22"/></label></strong>
									</div>
									<div class="form_list_contents">
										<textarea id="enrolMethod" name="enrolMethod" onBlur="javascript:fnBytesHandler(this,null,800);"><c:out value="${result.enrolMethod}"/></textarea>
									</div>
								</div>
							</li>
						</ul>

						<div class="form_wrap active">
							<div class="form_title">
								<h3><spring:message code="compny.vacancy.msg.title64"/></h3>
							</div>
							<!-- //form_title -->
							<div class="form_contents">
								<div class="form_box">
									<div class="form_element keyword <c:if test="${result.eduTrnngKeyword !=null && result.eduTrnngKeyword !=''}">active</c:if>">
										<div class="view_area">
											<label for="keyword" class="skip"><spring:message code="compny.vacancy.msg.title64"/></label>
											<span class="text_box">
											<c:if test="${fn:length(result.eduTrnngKeyword) > 0}">
												<c:forEach items="${fn:split(result.eduTrnngKeyword, ',') }" var="item">
													<span>${item}<button type="button" value="${item}" onclick="fnDeleteKeyword(this);"><spring:message code="button.delete"/></button></span>
												</c:forEach>
											</c:if>
											</span>
											<input type="text" id="keyword" name="keyword" class="input_key" maxlength="20">
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

						<div class="bbs_btn_wrap">
							<div class="bbs_center">
								<input type="button" onclick="fnGoList('frmSearch');" value="<spring:message code="button.list"/>" class="bbs_btn type01" />
								<button type="button" onclick="fnResetForm();" class="bbs_btn type02"><spring:message code="login.findPwd.btn.cancel"/></button>
								<input type="button" onclick="fnSave();" value="<spring:message code="compny.vacancy.msg.title69"/>" class="bbs_btn type01" />
							</div>
						</div>

							</fieldset>
						</form>

				</fieldset>

			</div>
            <!-- //contents -->
		</article>
	</main>
	<!-- //main.colgroup -->