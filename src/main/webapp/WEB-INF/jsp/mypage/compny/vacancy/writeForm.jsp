<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
	<script src="${pageContext.request.contextPath}/js/sub.js"></script>
	<script src="${pageContext.request.contextPath}/js/mypage/compny/vacancy/vacancy.js"></script>
    <script>
    	var langIdNum = 0;
    	var keywordArr = new Array;

    	$(document).ready(function() {
    		commonPopupSet('addr', true);
    		commonPopupSet('isco');

    		fnDeleteSpan();

    		dext5uploadAllFileSet("dext5uploadArea", '', '', '', '', '', '');

    		$("#workBgnDt").datepicker({
    			dateFormat: 'dd/mm/yy', //Input Display Format 변경
    			showOn: "both",
    			minDate: "0M", //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
    		});

    		$('#workBgnDt').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)


    		$("#endDt").datepicker({
    			dateFormat: 'dd/mm/yy', //Input Display Format 변경
    			showOn: "both",
    			minDate: "0M", //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
    			maxDate: "3M", //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
    		});

    		$('#endDt').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)

			//copy 일경우
    		<c:if test="${!empty result}">
    			$("#iscoCd").val("${result.iscoCd}");

	    		if("${result.workBgnDt}" != null && "${result.workBgnDt}" != "") {
	    			$('#workBgnDt').val("${result.workBgnDt}");
	    		}

	    		if("${result.endDt}" != null && "${result.endDt}" != "") {
	    			$('#endDt').val("${result.endDt}");
	    		}


				// 우대조건
	    		$('input:checkbox[name="preferntCondCd"]').each(function() {
					var preferntCondCdVal = "";
	    		 	<c:forEach var="data" items="${result.vacancyPreferntBeanList}" varStatus="status">
	    		 		preferntCondCdVal = "${data.preferntCondCd}";
	    			    if(this.value == preferntCondCdVal){ //값 비교
	     		            this.checked = true; //checked 처리
	     		      	}

	        		</c:forEach>
	    		});
    			fnChangeRdo("recrumtDiffcltYn");
    			fnChangeRdo("employCtrctCd");
    			fnChangeRdo("nightWorkYn");
    			fnChangeRdo("probtYn");
    			fnChangeRdo("trnngYn");
    			fnChangeRdo("nssfYn");
    			fnChangeRdo("minEduDegreeYn");
    			fnChangeRdo("proLicnsYn");
    			fnChangeRdo("minWorkExpYn");
    			fnChangeRdo("etcInsuYn");

    			<c:if test="${result.vacancyKeyword != ''}">
	    			<c:forEach items="${fn:split(result.vacancyKeyword, ',') }" var="item">
	    				<c:if test="${item != ''}">
	    				keywordArr.push("${item}");
	    				</c:if>
	    			</c:forEach>

	    			$("#vacancyKeyword").val(keywordArr.join(","));
    			</c:if>
			</c:if>
/* 			console.log("===================workMornBgnTime=${result.workMornBgnTime}");
			console.log("===================workMornEndTime=${result.workMornEndTime}");
			console.log("===================workAfternnBgnTime=${result.workAfternnBgnTime}");
			console.log("===================workAfternnEndTime=${result.workAfternnEndTime}");
			console.log("===================workNightBgnTime=${result.workNightBgnTime}");
			console.log("===================workNightEndTime=${result.workNightEndTime}"); */



    		fnSetHourSelecteBox("workMornBgnHour",vacancy.fnGetTime("${result.workMornBgnTime}",'H'));
    		fnSetHourSelecteBox("workMornEndHour",vacancy.fnGetTime("${result.workMornEndTime}",'H'));
    		fnSetMinuteSelecteBox("workMornBgnMinute",vacancy.fnGetTime("${result.workMornBgnTime}",'M'));
    		fnSetMinuteSelecteBox("workMornEndMinute",vacancy.fnGetTime("${result.workMornEndTime}",'M'));


    		fnSetHourSelecteBox("workAfternnBgnHour",vacancy.fnGetTime("${result.workAfternnBgnTime}",'H'));
    		fnSetHourSelecteBox("workAfternnEndHour",vacancy.fnGetTime("${result.workAfternnEndTime}",'H'));
    		fnSetMinuteSelecteBox("workAfternnBgnMinute",vacancy.fnGetTime("${result.workAfternnBgnTime}",'M'));
    		fnSetMinuteSelecteBox("workAfternnEndMinute",vacancy.fnGetTime("${result.workAfternnEndTime}",'M'));



    		fnSetHour24SelecteBox("workNightBgnHour",vacancy.fnGetTime("${result.workNightBgnTime}",'H'));
    		fnSetHour24SelecteBox("workNightEndHour",vacancy.fnGetTime("${result.workNightEndTime}",'H'));
    		fnSetMinuteSelecteBox("workNightBgnMinute",vacancy.fnGetTime("${result.workNightBgnTime}",'M'));
    		fnSetMinuteSelecteBox("workNightEndMinute",vacancy.fnGetTime("${result.workNightEndTime}",'M'));


    		fnSetDayHourSelecteBox("dayWorkTime","${result.dayWorkTime}");
    		fnSetWeekDaySelecteBox("weekWorkDay","${result.weekWorkDay}");



    		$('#keyword').on('keydown', function(event){
    			var keywordVal = $("#keyword").val();
    			if((event.keyCode)&&(event.keyCode==13) && keywordVal.length > 1){

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

	    					console.log("=================keywordVal="+keywordVal);
		    				$(this).parents('.form_element').addClass('active').find('.text_box').append('<span>'+keywordVal+'<button type="button" value='+keywordVal+' onclick="fnDeleteKeyword(this)">delete</button></span>');
		    				keywordArr.push($("#keyword").val());
		    				$("#vacancyKeyword").val(keywordArr);

	    				}

	    				//console.log("##################keywordArr="+keywordArr);
	    				//console.log("##################vacancyKeyword="+$("#vacancyKeyword").val());
	    			}
	    			$("#keyword").val("");
	    			return false;
    			}

    		});

    		//fnSetDefaultData();

    		$('#btnImgFile').on('click', function(e){
    			$('#imgFile').click();
    		});

    		$('#imgFile').on('change', function(e){
    			var file = $(e.target).val();
    			if(file != ''){
    				var pathHeader = file.lastIndexOf("\\");
                    var pathMiddle = file.lastIndexOf(".");
                    var pathEnd = file.length;
                    var fileName = file.substring(pathHeader+1, pathMiddle);
                    var extName = file.substring(pathMiddle+1, pathEnd);
                    var allFilename = fileName+"."+extName;
                    var imgHtml = "<span class='bbs_add'>" + allFilename + "<button type='button' onclick='fnDeleteImgSpan(this);'>delete</button></span>";

                    if(!(extName == "jpg" || extName == "jpeg" || extName == "png" || extName == "bmp" || extName == "gif")){
                    	alertify.alert("<spring:message code='error.insertFile.onlyImgFile'/>");
                    	$('#imgSpan').empty();
						return false;
                    }

    				$('#imgSpan').html(imgHtml);
    			}

    		});



		});

    	function fnDeleteImgSpan(obj){
			$(obj).closest('span').remove();
			$('#imgFile').val('');
    	}

    	function fnDeleteKeyword(obj) {
    		var val = $(obj).val();
    		//console.log("obj="+$(obj).val());

    		keywordArr = $.grep(keywordArr, function(value) {
    			  return value != val;
    		});
    		$("#vacancyKeyword").val(keywordArr);
    		//console.log("====================fnDeleteKeyword="+keywordArr)


    	}

    	function fnChangeRdo(nm) {
    		var val = $("input[name="+nm+"]:checked").val();

    		if(nm == "recrumtDiffcltYn") {
	    		if(val == "Y") {
	    			$("#diffcltReasonSpan").show();
	    		} else {
	    			$("#diffcltReasonSpan").hide();
	    		}
    		} else if(nm == "employCtrctCd") {
	    		if(val == "CRT0000000002") {
	    			$("#employCtrctDuraSpan").show();
	    		} else {
	    			$("#employCtrctDuraSpan").hide();
	    		}
    		} else if(nm == "nightWorkYn") {
    			if(val == "Y") {
	    			$("#nightWorkYnSpan").show();
	    		} else {
	    			$("#nightWorkYnSpan").hide();
	    		}
    		} else if(nm == "probtYn") {
    			if(val == "Y") {
	    			$("#probtYnSpan").show();
	    		} else {
	    			$("#probtYnSpan").hide();
	    		}
    		} else if(nm == "trnngYn") {
    			if(val == "Y") {
	    			$("#trnngYnSpan").show();
	    		} else {
	    			$("#trnngYnSpan").hide();
	    		}
    		} else if(nm == "nssfYn") {
    			if(val == "Y") {
	    			$("#nssfYnSpan").show();
	    		} else {
	    			$("#nssfYnSpan").hide();
	    		}
    		} else if(nm == "etcInsuYn") {
    			if(val == "Y") {
	    			$("#etcInsuYnSpan").show();
	    		} else {
	    			$("#etcInsuYnSpan").hide();
	    		}
    		} else if(nm == "nssfYn") {
    			if(val == "Y") {
	    			$("#nssfYnSpan").show();
	    		} else {
	    			$("#nssfYnSpan").hide();
	    		}
    		} else if(nm == "minEduDegreeYn") {
    			if(val == "Y") {
	    			$("#minEduDegreeYnDiv").show();
	    		} else {
	    			$("#minEduDegreeYnDiv").hide();
	    		}
    		} else if(nm == "proLicnsYn") {
    			if(val == "Y") {
	    			$("#proLicnsYnSpan").show();
	    		} else {
	    			$("#proLicnsYnSpan").hide();
	    		}
    		} else if(nm == "minWorkExpYn") {
    			if(val == "Y") {
	    			$("#minWorkExpYnDiv").show();
	    		} else {
	    			$("#minWorkExpYnDiv").hide();
	    		}
    		}



    	}

    	function fnSetAddr(json){
    		var addrHtml = '<span class="bbs_add">' + json.commonNm + '<input type="hidden" class="addrCd" value="' + json.commonCd + '"/>';
    		addrHtml += '<input type="hidden" class="addrFullCd" value="' + json.commonFullCd + '"/>';
    		addrHtml += '<input type="hidden" class="addrFullNm" value="' + json.commonFullNm + '"/>';
    		addrHtml += '<button type="button" class="delete">delete</button></span>';
    		$('#spanAddrCd').append(addrHtml);
    		fnDeleteSpan();
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

	</script>



	<div class="profile_title <c:if test="${!empty result}">active</c:if>">
		<label for="vacancyTitle"><spring:message code="compny.vacancy.msg.title"/></label>
		<input type="text" id="vacancyTitle" name="vacancyTitle" maxlength="150" value="${result.vacancyTitle}" />
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
					<c:forEach var="data" items="${employFormCd}" varStatus="status">
						<span class="bbs_input_box">
							<input type="radio" id="employFormCd_${status.count}" name="employFormCd" value="${data.dtlCd}" <c:if test="${result.employFormCd == data.dtlCd}">checked</c:if> />
							<label for="employFormCd_${status.count}">${data.cdNm}</label>
						</span>
					</c:forEach>
				</td>
			</tr>
			<tr>
				<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <label for="spot"><spring:message code="compny.vacancy.msg.title4"/></label></th>
				<td><input type="text" id="spot" name="spot" maxlength="50" value="${result.spot}"/></td>
			</tr>
			<tr>
				<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title5"/></th>
				<td>
					<div class="bbs_add_wrap">
						<button type="button" id="btnIscoCd" class="btn add noround popup_isco" onclick="callback(fnSetIsco, 'isco');">Selection</button>
						<span class="cont" id="spanIscoCd"><!-- 선택사항 들어갈 자리 -->
							<c:if test="${not empty result.iscoCd}">
								<span class="bbs_add">
									${result.iscoNm}
									<button type="button" class="delete">delete</button>
								</span>
							</c:if>
						</span>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title6"/></th>
				<td>
					<span class="bbs_time type2">
						<label for="workBgnDt" class="skip">date</label>
						<input type="text" id="workBgnDt" name="workBgnDt" readonly>
					</span>
				</td>
			</tr>
			<tr>
				<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title7"/></th>
				<td>
					<span class="bbs_time type2">
						<label for="endDt" class="skip">date</label>
						<input type="text" id="endDt" name="endDt" readonly>
					</span>
				</td>
			</tr>
			<tr>
				<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title8"/></th>
				<td><input type="text" id="recrumtMemb" name="recrumtMemb" value="${result.recrumtMemb}" style="width:80px;margin-right:5px;" maxlength="6" onKeyPress="return fnCheckNumber(event);"/> <label for="recrumtMemb"><spring:message code="compny.vacancy.msg.title12"/></label></td>
			</tr>
			<tr>
				<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title9"/></th>
				<td>
					<div class="bbs_add_wrap">
						<button type="button" id="btnAddrCd" onClick="callback(fnSetAddr, 'addr')" class="btn add noround popup_addr">Selection</button>
						<span class="cont" id="spanAddrCd"><!-- 선택사항 들어갈 자리 -->

						</span>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title10"/></th>
				<td>
					<span class="bbs_input_box">
						<input type="radio" name="recrumtDiffcltYn" id="recrumtDiffcltYn_1" value="N" onChange="javascript:fnChangeRdo('recrumtDiffcltYn');" <c:if test="${result.recrumtDiffcltYn == 'N'}">checked</c:if> >
						<label for="recrumtDiffcltYn_1"><spring:message code="compny.vacancy.msg.title14"/></label>
					</span>
					<span class="bbs_input_box">
						<input type="radio" name="recrumtDiffcltYn" id="recrumtDiffcltYn_2" value="Y" onChange="javascript:fnChangeRdo('recrumtDiffcltYn');" <c:if test="${result.recrumtDiffcltYn == 'Y'}">checked</c:if>>
						<label for="recrumtDiffcltYn_2"><spring:message code="compny.vacancy.msg.title13"/></label>
					</span>
					<span id="diffcltReasonSpan" style="display:none"><!-- No 선택했을 때 나오는 인풋 -->
						<label for="diffcltReason" class="skip">difficult</label>
						<input type="text" id="diffcltReason" name="diffcltReason" maxlength="300" value="${result.diffcltReason}"/>
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
								<c:forEach var="data" items="${employCtrctCd}" varStatus="status">
									<c:choose>
										<c:when test="${data.dtlCd == 'CRT0000000002'}">
											<span class="bbs_input_box">
												<input type="radio" name="employCtrctCd" id="employCtrctCd_${status.count}" value="${data.dtlCd}" onChange="javascript:fnChangeRdo('employCtrctCd');" <c:if test="${result.employCtrctCd == data.dtlCd}">checked</c:if>>
												<label for="employCtrctCd_${status.count}">${data.cdNm}<span class="em_blue"></span></label>
												<span id="employCtrctDuraSpan" style="display:none"><!-- Fixed duration contract 선택했을 때 나오는 인풋 -->
													<input type="text" id="employCtrctDura" name="employCtrctDura" maxlength="4" onKeyPress="return fnCheckNumber(event);" style="width:80px;margin:0 5px;" value="${result.employCtrctDura}" />
													<label for="employCtrctDura"><spring:message code="compny.vacancy.msg.title18"/></label>
												</span>
											</span>
										</c:when>
										<c:otherwise>
											<span class="bbs_input_box">
												<input type="radio" name="employCtrctCd" id="employCtrctCd_${status.count}" value="${data.dtlCd}" onChange="javascript:fnChangeRdo('employCtrctCd');" <c:if test="${result.employCtrctCd == data.dtlCd}">checked</c:if>>
												<label for="employCtrctCd_${status.count}">${data.cdNm}</label>
											</span>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
						</div>
						<div class="contents_box">
							<strong class="title_box"><spring:message code="compny.vacancy.msg.title16"/></strong>
							<div class="cont_box">
								<c:forEach var="data" items="${employCtrctTypeCd}" varStatus="status">
									<span class="bbs_input_box">
										<input type="radio" name="employCtrctTypeCd" id="employCtrctTypeCd_${status.count}" value="${data.dtlCd}" <c:if test="${result.employCtrctTypeCd == data.dtlCd}">checked</c:if>>
										<label for="employCtrctTypeCd_${status.count}">${data.cdNm}</label>
									</span>
								</c:forEach>
							</div>
						</div>
						<div class="contents_box">
							<strong class="title_box"><spring:message code="compny.vacancy.msg.title17"/></strong>
							<div class="cont_box">
								<c:forEach var="data" items="${preferEmploymtTypeCd}" varStatus="status">
									<span class="bbs_input_box">
										<input type="radio" name="preferEmploymtTypeCd" id="preferEmploymtTypeCd_${status.count}" value="${data.dtlCd}" <c:if test="${result.preferEmploymtTypeCd == data.dtlCd}">checked</c:if>>
										<label for="preferEmploymtTypeCd_${status.count}">${data.cdNm}</label>
									</span>
								</c:forEach>
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
								<select id="workMornBgnHour" name="workMornBgnHour">
									<option value=""><spring:message code="member.join.msg.choice"/></option>
								</select>
								<label for="workMornBgnMinute" class="skip">Start Minute</label>
								<select id="workMornBgnMinute" name="workMornBgnMinute">
									<option value=""><spring:message code="member.join.msg.choice"/></option>
								</select>
								&nbsp;~&nbsp;
								<label for="workMornEndHour" class="skip">End Hour</label>
								<select id="workMornEndHour" name="workMornEndHour">
									<option value=""><spring:message code="member.join.msg.choice"/></option>
								</select>
								<label for="workMornEndMinute" class="skip">End Minute</label>
								<select id="workMornEndMinute" name="workMornEndMinute">
									<option value=""><spring:message code="member.join.msg.choice"/></option>
								</select>
							</div>
						</div>
						<div class="contents_box">
							<strong class="title_box"><spring:message code="compny.vacancy.msg.title20"/></strong>
							<div class="cont_box">
								<label for="workAfternnBgnHour" class="skip">Start Hour</label>
								<select id="workAfternnBgnHour" name="workAfternnBgnHour">
									<option value=""><spring:message code="member.join.msg.choice"/></option>
								</select>
								<label for="workAfternnBgnMinute" class="skip">Start Minute</label>
								<select id="workAfternnBgnMinute" name="workAfternnBgnMinute">
									<option value=""><spring:message code="member.join.msg.choice"/></option>
								</select>
								&nbsp;~&nbsp;
								<label for="workAfternnEndHour" class="skip">Start Hour</label>
								<select id="workAfternnEndHour" name="workAfternnEndHour">
									<option value=""><spring:message code="member.join.msg.choice"/></option>
								</select>
								<label for="workAfternnEndMinute" class="skip">Start Minute</label>
								<select id="workAfternnEndMinute" name="workAfternnEndMinute">
									<option value=""><spring:message code="member.join.msg.choice"/></option>
								</select>
							</div>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title21"/></th>
				<td>
					<select id="dayWorkTime" name="dayWorkTime">
						<option value=""><spring:message code="member.join.msg.choice"/></option>
					</select>
					<label for="dayWorkTime"><spring:message code="compny.vacancy.msg.title21"/></label>
				</td>
			</tr>
			<tr>
				<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title22"/></th>
				<td>
					<select id="weekWorkDay" name="weekWorkDay">
						<option value=""><spring:message code="member.join.msg.choice"/></option>
					</select>
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
					<span class="bbs_input_box">
						<input type="radio" name="nightWorkYn" id="nightWorkYn_1" value="N" onChange="javascript:fnChangeRdo('nightWorkYn');" <c:if test="${result.nightWorkYn == 'N'}">checked</c:if>>
						<label for="nightWorkYn_1"><spring:message code="compny.vacancy.msg.title14"/></label>
					</span>
					<span class="bbs_input_box">
						<input type="radio" name="nightWorkYn" id="nightWorkYn_2"  value="Y" onChange="javascript:fnChangeRdo('nightWorkYn');" <c:if test="${result.nightWorkYn == 'Y'}">checked</c:if>>
						<label for="nightWorkYn_2"><spring:message code="compny.vacancy.msg.title13"/></label>
					</span>
					<span id="nightWorkYnSpan" style="display:none"><!-- Yes 선택했을 때 나오는 인풋 -->
						<label for="workNightBgnHour" class="skip">Start Hour</label>
						<select id="workNightBgnHour" name="workNightBgnHour">
							<option value=""><spring:message code="member.join.msg.choice"/></option>
						</select>
						<label for="workNightBgnMinute" class="skip">Start Minute</label>
						<select id="workNightBgnMinute" name="workNightBgnMinute">
							<option value=""><spring:message code="member.join.msg.choice"/></option>
						</select>
						&nbsp;~&nbsp;
						<label for="workNightEndHour" class="skip">End Hour</label>
						<select id="workNightEndHour" name="workNightEndHour">
							<option value=""><spring:message code="member.join.msg.choice"/></option>
						</select>
						<label for="workNightEndMinute" class="skip">End Minute</label>
						<select id="workNightEndMinute" name="workNightEndMinute">
							<option value=""><spring:message code="member.join.msg.choice"/></option>
						</select>
					</span>
				</td>
			</tr>
			<tr>
				<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title25"/></th>
				<td>
					<span class="bbs_input_box">
						<input type="radio" name="hldayWorkYn" id="hldayWorkYn_1" value="N" <c:if test="${result.hldayWorkYn == 'N'}">checked</c:if>>
						<label for="hldayWorkYn_1"><spring:message code="compny.vacancy.msg.title14"/></label>
					</span>
					<span class="bbs_input_box">
						<input type="radio" name="hldayWorkYn" id="hldayWorkYn_2" value="Y" <c:if test="${result.hldayWorkYn == 'Y'}">checked</c:if>>
						<label for="hldayWorkYn_2"><spring:message code="compny.vacancy.msg.title13"/></label>
					</span>
				</td>
			</tr>
			<tr>
				<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title26"/></th>
				<td>
					<span class="bbs_input_box">
						<input type="radio" name="flexWorkYn" id="flexWorkYn_1" value="N" <c:if test="${result.flexWorkYn == 'N'}">checked</c:if>>
						<label for="radio8_1"><spring:message code="compny.vacancy.msg.title14"/></label>
					</span>
					<span class="bbs_input_box">
						<input type="radio" name="flexWorkYn" id="flexWorkYn_2" value="Y" <c:if test="${result.flexWorkYn == 'Y'}">checked</c:if>>
						<label for="flexWorkYn_2"><spring:message code="compny.vacancy.msg.title13"/></label>
					</span>
				</td>
			</tr>
			<tr>
				<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title27"/></th>
				<td>
					<span class="bbs_input_box">
						<input type="radio" name="overWorkYn" id="overWorkYn_1" value="N" <c:if test="${result.overWorkYn == 'N'}">checked</c:if>>
						<label for="overWorkYn_1"><spring:message code="compny.vacancy.msg.title14"/></label>
					</span>
					<span class="bbs_input_box">
						<input type="radio" name="overWorkYn" id="overWorkYn_2" value="Y" <c:if test="${result.overWorkYn == 'Y'}">checked</c:if>>
						<label for="overWorkYn_2"><spring:message code="compny.vacancy.msg.title13"/></label>
					</span>
				</td>
			</tr>
			<tr>
				<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title28"/></th>
				<td>
					<span class="bbs_input_box">
						<input type="radio" name="probtYn" id="probtYn_1" value="N" onChange="javascript:fnChangeRdo('probtYn');" <c:if test="${result.probtYn == 'N'}">checked</c:if>>
						<label for="probtYn_1"><spring:message code="compny.vacancy.msg.title14"/></label>
					</span>
					<span class="bbs_input_box">
						<input type="radio" name="probtYn" id="probtYn_2" value="Y" onChange="javascript:fnChangeRdo('probtYn');" <c:if test="${result.probtYn == 'Y'}">checked</c:if>>
						<label for="probtYn_2"><spring:message code="compny.vacancy.msg.title13"/></label>
					</span>
					<span id="probtYnSpan" style="display:none"><!-- Yes 선택했을 때 나오는 인풋 -->
						<input type="text" id="probtDura" name="probtDura" value="${result.probtDura}" maxlength="2" onKeyPress="return fnCheckNumber(event);" style="width:80px;margin:0 5px;" />
						<label for="probtDura"><spring:message code="compny.vacancy.msg.title18"/></label>
					</span>
				</td>
			</tr>
			<tr>
				<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title29"/></th>
				<td>
					<span class="bbs_input_box">
						<input type="radio" name="trnngYn" id="trnngYn_1" value="N" onChange="javascript:fnChangeRdo('trnngYn');" <c:if test="${result.trnngYn == 'N'}">checked</c:if>>
						<label for="trnngYn_1"><spring:message code="compny.vacancy.msg.title14"/></label>
					</span>
					<span class="bbs_input_box">
						<input type="radio" name="trnngYn" id="trnngYn_2" value="Y" onChange="javascript:fnChangeRdo('trnngYn');" <c:if test="${result.trnngYn == 'Y'}">checked</c:if>>
						<label for="trnngYn_2"><spring:message code="compny.vacancy.msg.title13"/></label>
					</span>
					<span id="trnngYnSpan" style="display:none"><!-- Yes 선택했을 때 나오는 인풋 -->
						<input type="text" id="trnngDura" name="trnngDura" value="${result.trnngDura}" maxlength="3" onKeyPress="return fnCheckNumber(event);" style="width:80px;margin:0 5px;" />
						<label for="trnngDura"><spring:message code="compny.vacancy.msg.title33"/></label>
					</span>
				</td>
			</tr>
			<tr>
				<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title30"/></th>
				<td>

					<c:forEach var="data" items="${salaryUnitCd}" varStatus="status">
						<span class="bbs_input_box">
							<input type="radio" name="salaryUnitCd" id="salaryUnitCd_${status.count}" value="${data.dtlCd}" onChange="javascript:fnChangeRdo('salaryUnitCd');" <c:if test="${result.salaryUnitCd == data.dtlCd}">checked</c:if>>
							<label for="salaryUnitCd_${status.count}">${data.cdNm}</label>
						</span>
					</c:forEach>

					<span id="salaryUnitCdSpan"><!-- Monthly 선택했을 때 나오는 인풋 -->
						<label for="minSalaryAmt" class="skip">start payroll</label>
						<input type="text" id="minSalaryAmt" name="minSalaryAmt" value="${result.minSalaryAmt}" maxlength="10" onkeyup="fnCheckDecimalNumber(this,2);" style="width:80px;margin:0 5px;" />
						&nbsp;~&nbsp;
						<label for="end_payroll1" class="skip">end payroll</label>
						<input type="text" id="maxSalaryAmt" name="maxSalaryAmt" value="${result.maxSalaryAmt}" maxlength="10" style="width:80px;margin:0 5px;" />
<!-- 						<label for="payroll_currency" class="skip">payroll currency</label>
						<select id="payroll_currency">
							<option value="">$</option>
						</select> -->
					</span>
				</td>
			</tr>
			<tr>
				<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title31"/></th>
				<td>
					<span class="bbs_input_box">
						<input type="radio" name="nssfYn" id="nssfYn_1" value="N" onChange="javascript:fnChangeRdo('nssfYn');" <c:if test="${result.nssfYn == 'N'}">checked</c:if>>
						<label for="nssfYn_1"><spring:message code="compny.vacancy.msg.title14"/></label>
					</span>
					<span class="bbs_input_box">
						<input type="radio" name="nssfYn" id="nssfYn_2" value="Y" onChange="javascript:fnChangeRdo('nssfYn');" <c:if test="${result.nssfYn == 'Y'}">checked</c:if>>
						<label for="nssfYn_2"><spring:message code="compny.vacancy.msg.title13"/></label>
					</span>
 					<span id="nssfYnSpan" style="display:none">
						<input type="text" id="nssfSpec" name="nssfSpec" value="${result.nssfSpec}" maxlength="200"/>
						<label for="nssfSpec" class="skip">NSSF</label>
					</span>
				</td>
			</tr>
			<tr>
				<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title32"/></th>
				<td>
					<span class="bbs_input_box">
						<input type="radio" name="etcInsuYn" id="etcInsuYn_1" value="N" onChange="javascript:fnChangeRdo('etcInsuYn');" <c:if test="${result.etcInsuYn == 'N'}">checked</c:if>>
						<label for="etcInsuYn_1"><spring:message code="compny.vacancy.msg.title14"/></label>
					</span>
					<span class="bbs_input_box">
						<input type="radio" name="etcInsuYn" id="etcInsuYn_2" value="Y" onChange="javascript:fnChangeRdo('etcInsuYn');" <c:if test="${result.etcInsuYn == 'Y'}">checked</c:if>>
						<label for="etcInsuYn_2"><spring:message code="compny.vacancy.msg.title13"/></label>
					</span>
					<span id="etcInsuYnSpan" style="display:none"><!-- Yes 선택했을 때 나오는 인풋 -->
						<input type="text" id="etcInsuSpec" name="etcInsuSpec" value="${result.etcInsuSpec}" maxlength="100"/>
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
					<span class="bbs_input_box">
						<input type="radio" name="minEduDegreeYn" id="minEduDegreeYn_1" value="N" onChange="javascript:fnChangeRdo('minEduDegreeYn');" <c:if test="${result.minEduDegreeYn == 'N'}">checked</c:if>>
						<label for="minEduDegreeYn_1"><spring:message code="compny.vacancy.msg.title57"/></label>
					</span>
					<span class="bbs_input_box">
						<input type="radio" name="minEduDegreeYn" id="minEduDegreeYn_2" value="Y" onChange="javascript:fnChangeRdo('minEduDegreeYn');" <c:if test="${result.minEduDegreeYn == 'Y'}">checked</c:if>>
						<label for="minEduDegreeYn_2"><spring:message code="compny.vacancy.msg.title58"/></label>
					</span>
					<div id="minEduDegreeYnDiv" class="bbs_child type3" style="display:none"><!-- Required education 선택했을 때 나오는 박스 -->
						<div class="contents_box">
							<strong class="title_box"><spring:message code="compny.vacancy.msg.title52"/></strong>
							<div class="cont_box">
								<label for="minEduDegreeCd" class="skip"><spring:message code="compny.vacancy.msg.title53"/></label>
								<select id="minEduDegreeCd" name="minEduDegreeCd">
									<option value=""><spring:message code="member.join.msg.choice"/></option>
									<c:forEach var="data" items="${minEduDegreeCd}" varStatus="status">
										<option value="${data.dtlCd}" <c:if test="${result.minEduDegreeCd == data.dtlCd}">selected</c:if>>${data.cdNm}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="contents_box">
							<strong class="title_box"><spring:message code="compny.vacancy.msg.title54"/></strong>
							<div class="cont_box">
								<label for="iscedCdLvlOne" class="skip"><spring:message code="compny.vacancy.msg.title54"/></label>
								<select id="iscedCdLvlOne" name="iscedCdLvlOne" onchange="fnIscedCdUpperList('iscedCdLvlOne','iscedCd');">
									<option value=""><spring:message code="member.join.msg.choice"/></option>
									<c:forEach var="data" items="${iscedCdLvl1}" varStatus="status">
										<option value="${data.iscedCd}" <c:if test="${result.iscedCdLvlOne == data.iscedCd}">selected</c:if>>${data.nm}</option>
									</c:forEach>
								</select>
								<label for="iscedCd" class="skip"><spring:message code="compny.vacancy.msg.title54"/></label>
								<select id="iscedCd" name="iscedCd">
									<option value=""><spring:message code="member.join.msg.choice"/></option>
									<c:forEach var="data" items="${iscedCdLvl2}" varStatus="status">
										<option value="${data.iscedCd}" <c:if test="${result.iscedCd == data.iscedCd}">selected</c:if>>${data.nm}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="contents_box">
							<strong class="title_box"><spring:message code="compny.vacancy.msg.title55"/></strong>
							<div class="cont_box">
								<span class="bbs_input_box">
									<input type="radio" name="proLicnsYn" id="proLicnsYn_1" value="N" onChange="javascript:fnChangeRdo('proLicnsYn');" <c:if test="${result.proLicnsYn == 'N'}">checked</c:if>>
									<label for="proLicnsYn_1"><spring:message code="compny.vacancy.msg.title14"/></label>
								</span>
								<span class="bbs_input_box">
									<input type="radio" name="proLicnsYn" id="proLicnsYn_2" value="Y" onChange="javascript:fnChangeRdo('proLicnsYn');" <c:if test="${result.proLicnsYn == 'Y'}">checked</c:if>>
									<label for="proLicnsYn_2"><spring:message code="compny.vacancy.msg.title13"/></label>
								</span>
								<span id="proLicnsYnSpan" style="display:none"><!-- Yes 선택했을 때 나오는 인풋 -->
									<input type="text" id="proLicnsNm" name="proLicnsNm" value="${result.proLicnsNm}" maxlength="100" />
									<label for="proLicnsNm" class="skip">license</label>
								</span>
							</div>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title61"/></th>
				<td>
					<span class="bbs_input_box">
						<input type="radio" name="minWorkExpYn" id="minWorkExpYn_1" value="N" onChange="javascript:fnChangeRdo('minWorkExpYn');" <c:if test="${result.minWorkExpYn == 'N'}">checked</c:if>>
						<label for="minWorkExpYn_1"><spring:message code="compny.vacancy.msg.title59"/></label>
					</span>
					<span class="bbs_input_box">
						<input type="radio" name="minWorkExpYn" id="minWorkExpYn_2" value="Y" onChange="javascript:fnChangeRdo('minWorkExpYn');" <c:if test="${result.minWorkExpYn == 'Y'}">checked</c:if>>
						<label for="minWorkExpYn_2"><spring:message code="compny.vacancy.msg.title60"/></label>
					</span>
					<div id="minWorkExpYnDiv" class="bbs_child type3" style="display:none"><!-- Required minimum experience related to position 선택했을 때 나오는 박스 -->
						<div class="contents_box">
							<strong class="title_box"><spring:message code="compny.vacancy.msg.title61"/></strong>
							<div class="cont_box">
								<input type="text" id="minWorkExp" name="minWorkExp" value="${result.minWorkExp}" style="width:80px;" maxlength="2" onKeyPress="return fnCheckNumber(event);"/>
								<label for="minWorkExp"><spring:message code="member.join.step.two.msg.year"/></label>
							</div>
						</div>
						<div class="contents_box">
							<strong class="title_box"><spring:message code="compny.vacancy.msg.title62"/></strong>
							<div class="cont_box">
								<label for="isicCdLvlOne" class="skip"><spring:message code="compny.vacancy.msg.title62"/></label>
								<select id="isicCdLvlOne" name="isicCdLvlOne"  onchange="fnIsicCdUpperList('isicCdLvlOne','isicCd');">
									<option value=""><spring:message code="member.join.msg.choice"/></option>
									<c:forEach var="data" items="${isicCdLvl1}" varStatus="status">
										<option value="${data.isicCd}" <c:if test="${result.isicCdLvlOne == data.isicCd}">selected</c:if>>${data.nm}</option>
									</c:forEach>
								</select>
								<label for="isicCd" class="skip"><spring:message code="compny.vacancy.msg.title62"/></label>
								<select id="isicCd" name="isicCd">
									<option value=""><spring:message code="member.join.msg.choice"/></option>
									<c:forEach var="data" items="${isicCdLvl2}" varStatus="status">
										<option value="${data.isicCd}" <c:if test="${result.isicCd == data.isicCd}">selected</c:if>>${data.nm}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
				</td>
			</tr>
		</tbody>
	</table>

	<div class="form_wrap active">
		<div class="form_title type2">
			<h3><span class="bbs_ico necessary"><spring:message code="member.join.msg.required"/></span> <spring:message code="mypage.compny.profile.title23"/></h3>
		</div>
		<c:if test="${empty result}">
		<div class="form_contents type2">
			<table class="bbs_table write type2">
				<caption>Foreign Language Input</caption>
				<colgroup>
					<col style="width:25%" />
					<col style="width:75%" />
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <label for="langCd"><spring:message code="compny.vacancy.msg.title34"/></label></th>
						<td>
							<select id="langCd" name="langCd">
								<option value=""><spring:message code="member.join.msg.choice"/></option>
								<c:forEach var="data" items="${langCd}" varStatus="status">
									<option value="${data.dtlCd}">${data.cdNm}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title35"/></th>
						<td>
							<c:forEach var="data" items="${langLvlCd}" varStatus="status">
								<span class="bbs_input_box">
									<input type="radio" name="langLvlCd" id="langLvlCd_${status.count}" value="${data.dtlCd}">
									<label for="langLvlCd_${status.count}">${data.cdNm}</label>
								</span>
							</c:forEach>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		</c:if>
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
								<select id="langCd_${result.vacancySeq}_${langStatus.count}" name="langCd">
									<option value=""><spring:message code="member.join.msg.choice"/></option>
									<c:forEach var="data" items="${langCd}" varStatus="status">
										<option value="${data.dtlCd}"  <c:if test="${langData.langCd == data.dtlCd}">selected</c:if>>${data.cdNm}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title35"/></th>
							<td>
								<c:forEach var="data" items="${langLvlCd}" varStatus="status">
									<span class="bbs_input_box">
										<input type="radio" name="langLvlCd_${result.vacancySeq}_${langStatus.count}" id="langLvlCd_${result.vacancySeq}_${langStatus.count}" value="${data.dtlCd}" <c:if test="${langData.langLvlCd == data.dtlCd}">checked</c:if>>
										<label for="langLvlCd_${result.vacancySeq}_${langStatus.count}">${data.cdNm}</label>
									</span>
								</c:forEach>
							</td>
						</tr>
					</tbody>
				</table>
				<c:if test="${langStatus.count > 1}">
				<button type="button" onclick="javascript:vacancy.fnRemoveLang('langAddDiv_${result.vacancySeq}_${langStatus.count}');" class="form_close">Close contents</button>
				</c:if>
			</div>
			</c:forEach>
		</div>
		<div class="form_add">
			<button type="button" id="btnLangAdd" onclick="javascript:vacancy.fnAddLang('langAddDiv',langIdNum);"><span>Add</span></button>
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
				<div class="form_element textarea child">
					<div class="view_area">
						<div class="textarea_title"><spring:message code="compny.vacancy.msg.title38"/> <span>(<spring:message code="compny.vacancy.msg.title39"/>)</span></div>
						<button type="button" class="child_open">open for contents view</button>
					</div>
					<div class="textarea_box">
						<label for="jobDesc" class="skip">content input</label>
						<textarea id="jobDesc" name="jobDesc"><c:out value="${result.jobDesc}"/></textarea>
					</div>
				</div>
			</div>
			<!-- //form_box -->

			<div class="form_box">
				<div class="form_element textarea child">
					<div class="view_area">
						<div class="textarea_title"><spring:message code="compny.vacancy.msg.title40"/> <span>(<spring:message code="compny.vacancy.msg.title41"/>)</span></div>
						<button type="button" class="child_open">open for contents view</button>
					</div>
					<div class="textarea_box">
						<label for="recrumtJobRefKnow" class="skip">content input</label>
						<textarea id="recrumtJobRefKnow" name="recrumtJobRefKnow"><c:out value="${result.recrumtJobRefKnow}"/></textarea>
					</div>
				</div>
			</div>
			<!-- //form_box -->

			<div class="form_box">
				<div class="form_element textarea child">
					<div class="view_area">
						<div class="textarea_title"><spring:message code="compny.vacancy.msg.title42"/> <span>(<spring:message code="compny.vacancy.msg.title43"/>)</span></div>
						<button type="button" class="child_open">open for contents view</button>
					</div>
					<div class="textarea_box">
						<label for="recrumtJobRefBasicSkill" class="skip">content input</label>
						<textarea id="recrumtJobRefBasicSkill" name="recrumtJobRefBasicSkill"><c:out value="${result.recrumtJobRefBasicSkill}"/></textarea>
					</div>
				</div>
			</div>
			<!-- //form_box -->

			<div class="form_box">
				<div class="form_element textarea child">
					<div class="view_area">
						<div class="textarea_title"><spring:message code="compny.vacancy.msg.title44"/> <span>(<spring:message code="compny.vacancy.msg.title45"/>)</span></div>
						<button type="button" class="child_open">open for contents view</button>
					</div>
					<div class="textarea_box">
						<label for="recrumtJobRefWorkNeedItem" class="skip">content input</label>
						<textarea id="recrumtJobRefWorkNeedItem" name="recrumtJobRefWorkNeedItem"><c:out value="${result.recrumtJobRefWorkNeedItem}"/></textarea>
					</div>
				</div>
			</div>
			<!-- //form_box -->

			<div class="form_box">
				<div class="form_element textarea child">
					<div class="view_area">
						<div class="textarea_title"><spring:message code="compny.vacancy.msg.title37"/></div>
						<button type="button" class="child_open">open for contents view</button>
					</div>
					<div class="textarea_box">
						<label for="etc" class="skip">content input</label>
						<textarea id="etc" name="etc"><c:out value="${result.etc}"/></textarea>
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
					<c:forEach var="data" items="${preferntCondCd}" varStatus="status">
					<span class="bbs_input_box">
						<input type="checkbox" name="preferntCondCd" id="preferntCondCd_${status.count}" value="${data.dtlCd}">
						<label for="preferntCondCd_${status.count}">${data.cdNm}</label>
					</span>
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
					<textarea id="workExpln" name="workExpln" style="height:200px;"><c:out value="${result.workExpln}"/></textarea>
				</td>
			</tr>
			<tr>
				<th scope="row"><span class="exactly"></span> 이미지 첨부</th>
				<td>
					<div class="bbs_add_wrap">
						<button type="button" class="btn add noround" id="btnImgFile">Selection</button>
						<input type="file" id="imgFile" name="uploadImgFile" style="display: none;">
						<span class="cont" id="imgSpan"><!-- 선택사항 들어갈 자리 -->
							<%-- <c:if test="${not empty result.originalNm }">
								<span class="bbs_add"><c:out value="${result.originalNm }" /> <button type="button" onclick='fnDeleteImgSpan(this);'>delete</button></span>
							</c:if> --%>
						</span>
					</div>
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
				<td><input type="text" id="mngerNm" name="mngerNm" maxlength="20" value="${result.mngerNm}"/></td>
			</tr>
			<tr>
				<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <label for="mngerEmail"><spring:message code="login.stop.email"/></label></th>
				<td><input type="text" id="mngerEmail" name="mngerEmail" value="${result.mngerEmail}" maxlength="100" /></td>
			</tr>
			<tr>
				<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <label for="mngerCell"><spring:message code="login.findId.cell"/></label></th>
				<td><input type="text" id="mngerCell" name="mngerCell" value="${result.mngerCell}" maxlength="20" onKeyPress="return fnCheckNumber(event);"/></td>
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
							<c:if test="${fn:length(result.vacancyKeyword) > 0}">
								<c:forEach items="${fn:split(result.vacancyKeyword, ',') }" var="item">
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
			<%-- <tr>
				<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> 입사 서류양식 첨부파일</th>
				<td>
					<div class="bbs_add_wrap">
						<button type="button" class="btn add noround">Selection</button>
						<span class="cont"><!-- 선택사항 들어갈 자리 -->
							<span class="bbs_add">JAVA Program <button type="button"><spring:message code="button.delete"/></button></span>
							<span class="bbs_add">JAVA Program <button type="button"><spring:message code="button.delete"/></button></span>
							<span class="bbs_add">JAVA Program <button type="button"><spring:message code="button.delete"/></button></span>
							<span class="bbs_add">JAVA Program <button type="button"><spring:message code="button.delete"/></button></span>
						</span>
					</div>
				</td>
			</tr> --%>
			<tr>
				<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title66"/></th>
				<td>
					<!-- <div class="bbs_add_wrap">
						<button type="button" class="btn add noround">Selection</button>
						<span class="cont">선택사항 들어갈 자리
							<span class="bbs_add">JAVA Program <button type="button">delete</button></span>
							<span class="bbs_add">JAVA Program <button type="button">delete</button></span>
							<span class="bbs_add">JAVA Program <button type="button">delete</button></span>
							<span class="bbs_add">JAVA Program <button type="button">delete</button></span>
						</span>
					</div> -->
					<div id="dext5uploadArea"></div>
				</td>
			</tr>
		</tbody>
	</table>

	<div class="bbs_btn_wrap">
		<div class="bbs_center">
			<input type="button" onClick="javascript:fnGoList('frmSearch');" class="bbs_btn type01" value="<spring:message code="button.list"/>"/>
			<button type="button" onClick="javascript:fnTempSave();" class="bbs_btn type02"><spring:message code="compny.vacancy.msg.title65"/></button>
			<input type="button"  onClick="javascript:fnVacancySave();" value="<spring:message code="compny.vacancy.msg.title69"/>" class="bbs_btn type01" />
		</div>
	</div>
