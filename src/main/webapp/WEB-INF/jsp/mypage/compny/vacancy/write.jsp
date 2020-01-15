<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
	<script src="${pageContext.request.contextPath}/js/mypage/compny/vacancy/vacancy.js"></script>
    <script>
    	$(document).ready(function() {
    		vacancy.fnCopyVacancy("<c:out value="${param.condCopySeq}"/>","compnyVacancyWrite");

    		//fnSetDefaultData();

			if("<c:out value="${userExistYn}"/>" == "N") {//사용자가 존재하지않음
				alertify.alert("<spring:message code="login.findId.no.data"/>", function (e){
					fnGoMain();
				});
				return false;
			}

    	});

    	function fnVacancySave(){
			$('#commonUploadFlag').val('I');

			//채용공고 제목
			if($("#vacancyTitle").val() == "") {
				alertify.alert("<spring:message code="compny.vacancy.errors.msg3"/>", function (e){
					$("#vacancyTitle").focus();
				});
				return false;
			}

			//공구구분
			if(!$("input:radio[name='employFormCd']").is(":checked")) {
				alertify.alert("<spring:message code="compny.vacancy.errors.msg"/>", function (e){
					$("input:radio[name='employFormCd']").focus();
				});

				return false;
			}

			//직급/직책
			if($("#spot").val() == "") {
				alertify.alert("<spring:message code="compny.vacancy.errors.msg2"/>", function (e){
					$("#spot").focus();
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

			//근무시작일
			if($("#workBgnDt").val() == "") {
				alertify.alert("<spring:message code="compny.vacancy.errors.msg4"/>", function (e){
					$("#workBgnDt").focus();
				});
				return false;
			}


			//채용마감일
			if($("#endDt").val() == "") {
				alertify.alert("<spring:message code="compny.vacancy.errors.msg5"/>", function (e){
					$("#endDt").focus();
				});
				return false;
			}


			//모집인원
			if($("#recrumtMemb").val() == "") {
				alertify.alert("<spring:message code="compny.vacancy.errors.msg6"/>", function (e){
					$("#recrumtMemb").focus();
				});
				return false;
			}

			//근무지역
			var addrList = [];
			$('#spanAddrCd').find('span').each(function(){
				var obj = new Object();
				obj.addrCd = $(this).find('.addrCd').val();
				obj.addrFullCd = $(this).find('.addrFullCd').val();
				obj.addrFullNm = $(this).find('.addrFullNm').val();

				addrList.push(obj);
			});
			$("#addrCd").val(JSON.stringify(addrList));

			if($("#addrCd").val() == "") {
				alertify.alert("<spring:message code="compny.vacancy.errors.msg7"/>", function (e){
					$("#btnAddrCd").focus();
				});
				return false;
			}

			//모집하기 어려운 직종입니까
			if(!$("input:radio[name='recrumtDiffcltYn']").is(":checked")) {
				alertify.alert("<spring:message code="compny.vacancy.errors.msg8"/>", function (e){
					$("input:radio[name='recrumtDiffcltYn']").focus();
				});

				return false;
			}

			//모집하기 어려운 직종입니까 Y인경우
			if($("input:radio[name='recrumtDiffcltYn']:checked").val() == "Y") {
				if($("#diffcltReason").val() == "") {
					alertify.alert("<spring:message code="compny.vacancy.errors.msg28"/>", function (e){
						$("#diffcltReason").focus();
					});
					return false;
				}

			}


			//고용 계약조건
			if(!$("input:radio[name='employCtrctCd']").is(":checked")) {
				alertify.alert("<spring:message code="compny.vacancy.errors.msg9"/>", function (e){
					$("input:radio[name='employCtrctCd']").focus();
				});

				return false;
			}

			//고용 계약유형
			if(!$("input:radio[name='employCtrctTypeCd']").is(":checked")) {
				alertify.alert("<spring:message code="compny.vacancy.errors.msg10"/>", function (e){
					$("input:radio[name='employCtrctTypeCd']").focus();
				});

				return false;
			}

			//고용 유형
			if(!$("input:radio[name='preferEmploymtTypeCd']").is(":checked")) {
				alertify.alert("<spring:message code="compny.vacancy.errors.msg11"/>", function (e){
					$("input:radio[name='preferEmploymtTypeCd']").focus();
				});

				return false;
			}


			//오전근무시간
			if($("#workMornBgnHour").val() == "") {
				alertify.alert("<spring:message code="compny.vacancy.errors.msg12"/>", function (e){
					$("#workMornBgnHour").focus();
				});
				return false;
			}

			if($("#workMornBgnMinute").val() == "") {
				alertify.alert("<spring:message code="compny.vacancy.errors.msg12"/>", function (e){
					$("#workMornBgnMinute").focus();
				});
				return false;
			}

			if($("#workMornEndHour").val() == "") {
				alertify.alert("<spring:message code="compny.vacancy.errors.msg12"/>", function (e){
					$("#workMornEndHour").focus();
				});
				return false;
			}

			if($("#workMornEndMinute").val() == "") {
				alertify.alert("<spring:message code="compny.vacancy.errors.msg12"/>", function (e){
					$("#workMornEndMinute").focus();
				});
				return false;
			}

			var workMornBgn = $("#workMornBgnHour").val() + "" + $("#workMornBgnMinute").val();
			var workMornEnd = $("#workMornEndHour").val() + "" + $("#workMornEndMinute").val();
			if(Number(workMornBgn) >= Number(workMornEnd)) {
				alertify.alert("<spring:message code="compny.vacancy.errors.msg13"/>", function (e){
					$("#workMornBgnHour").focus();
				});
				return false;
			}
			$("#workMornBgnTime").val(workMornBgn+"00");
			$("#workMornEndTime").val(workMornEnd+"00");

			//console.log("================workMornBgnTime="+$("#workMornBgnTime").val());


			//오후근무시간
			if($("#workAfternnBgnHour").val() == "") {
				alertify.alert("<spring:message code="compny.vacancy.errors.msg14"/>", function (e){
					$("#workAfternnBgnHour").focus();
				});
				return false;
			}

			if($("#workAfternnBgnMinute").val() == "") {
				alertify.alert("<spring:message code="compny.vacancy.errors.msg14"/>", function (e){
					$("#workAfternnBgnMinute").focus();
				});
				return false;
			}

			if($("#workAfternnEndHour").val() == "") {
				alertify.alert("<spring:message code="compny.vacancy.errors.msg14"/>", function (e){
					$("#workAfternnEndHour").focus();
				});
				return false;
			}

			if($("#workAfternnEndMinute").val() == "") {
				alertify.alert("<spring:message code="compny.vacancy.errors.msg14"/>", function (e){
					$("#workAfternnEndMinute").focus();
				});
				return false;
			}

			var workAfternnBgn = $("#workAfternnBgnHour").val() + "" + $("#workAfternnBgnMinute").val();
			var workAfternnEnd = $("#workAfternnEndHour").val() + "" + $("#workAfternnEndMinute").val();
			if(Number(workAfternnBgn) >= Number(workAfternnEnd)) {
				alertify.alert("<spring:message code="compny.vacancy.errors.msg13"/>", function (e){
					$("#workAfternnBgnHour").focus();
				});
				return false;
			}
			$("#workAfternnBgnTime").val(workAfternnBgn+"00");
			$("#workAfternnEndTime").val(workAfternnEnd+"00");


			//일근무시간
			if($("#dayWorkTime").val() == "") {
				alertify.alert("<spring:message code="compny.vacancy.errors.msg15"/>", function (e){
					$("#dayWorkTime").focus();
				});
				return false;
			}

			//주당근무시간
			if($("#weekWorkDay").val() == "") {
				alertify.alert("<spring:message code="compny.vacancy.errors.msg16"/>", function (e){
					$("#weekWorkDay").focus();
				});
				return false;
			}

			//야간근무
			if(!$("input:radio[name='nightWorkYn']").is(":checked")) {
				alertify.alert("<spring:message code="compny.vacancy.errors.msg17"/>", function (e){
					$("input:radio[name='nightWorkYn']").focus();
				});

				return false;
			}

			//야간근무 Y일경우
			if($("input:radio[name='nightWorkYn']:checked").val() == "Y") {
				//야간근무시간
				if($("#workNightBgnHour").val() == "") {
					alertify.alert("<spring:message code="compny.vacancy.errors.msg29"/>", function (e){
						$("#workNightBgnHour").focus();
					});
					return false;
				}

				if($("#workNightBgnMinute").val() == "") {
					alertify.alert("<spring:message code="compny.vacancy.errors.msg29"/>", function (e){
						$("#workNightBgnMinute").focus();
					});
					return false;
				}

				if($("#workNightEndHour").val() == "") {
					alertify.alert("<spring:message code="compny.vacancy.errors.msg29"/>", function (e){
						$("#workNightEndHour").focus();
					});
					return false;
				}

				if($("#workNightEndMinute").val() == "") {
					alertify.alert("<spring:message code="compny.vacancy.errors.msg29"/>", function (e){
						$("#workNightEndMinute").focus();
					});
					return false;
				}

				var workNightBgn = $("#workNightBgnHour").val() + "" + $("#workNightBgnMinute").val();
				var workNightEnd = $("#workNightEndHour").val() + "" + $("#workNightEndMinute").val();
				if(Number(workNightBgn) >= Number(workNightEnd)) {
					alertify.alert("<spring:message code="compny.vacancy.errors.msg13"/>", function (e){
						$("#workAfternnBgnHour").focus();
					});
					return false;
				}
				$("#workNightBgnTime").val(workNightBgn+"00");
				$("#workNightEndTime").val(workNightEnd+"00");

			}

			//일요일/공휴일 근무
			if(!$("input:radio[name='hldayWorkYn']").is(":checked")) {
				alertify.alert("<spring:message code="compny.vacancy.errors.msg18"/>", function (e){
					$("input:radio[name='hldayWorkYn']").focus();
				});

				return false;
			}

			//탄력근무제
			if(!$("input:radio[name='flexWorkYn']").is(":checked")) {
				alertify.alert("<spring:message code="compny.vacancy.errors.msg19"/>", function (e){
					$("input:radio[name='flexWorkYn']").focus();
				});

				return false;
			}

			//초과근무
			if(!$("input:radio[name='overWorkYn']").is(":checked")) {
				alertify.alert("<spring:message code="compny.vacancy.errors.msg20"/>", function (e){
					$("input:radio[name='overWorkYn']").focus();
				});

				return false;
			}

			//수습기간
			if(!$("input:radio[name='probtYn']").is(":checked")) {
				alertify.alert("<spring:message code="compny.vacancy.errors.msg21"/>", function (e){
					$("input:radio[name='probtYn']").focus();
				});

				return false;
			}

			//수습기간 Y일경우
			if($("input:radio[name='probtYn']:checked").val() == "Y") {
				if($("#probtDura").val() == "") {
					alertify.alert("<spring:message code="compny.vacancy.errors.msg30"/>", function (e){
						$("#probtDura").focus();
					});
					return false;
				}
			}


			//신입훈련
			if(!$("input:radio[name='trnngYn']").is(":checked")) {
				alertify.alert("<spring:message code="compny.vacancy.errors.msg22"/>", function (e){
					$("input:radio[name='trnngYn']").focus();
				});

				return false;
			}

			//신입훈련 Y일경우
			if($("input:radio[name='trnngYn']:checked").val() == "Y") {
				if($("#trnngDura").val() == "") {
					alertify.alert("<spring:message code="compny.vacancy.errors.msg31"/>", function (e){
						$("#trnngDura").focus();
					});
					return false;
				}
			}

			//기본 임금/급여
			if(!$("input:radio[name='salaryUnitCd']").is(":checked")) {
				alertify.alert("<spring:message code="compny.vacancy.errors.msg23"/>", function (e){
					$("input:radio[name='salaryUnitCd']").focus();
				});

				return false;
			}


			//기본 임금/급여
			if($("#minSalaryAmt").val() == "") {
				alertify.alert("<spring:message code="compny.vacancy.errors.msg24"/>", function (e){
					$("#minSalaryAmt").focus();
				});
				return false;
			}


			//기본 임금/급여
			if($("#maxSalaryAmt").val() == "") {
				alertify.alert("<spring:message code="compny.vacancy.errors.msg24"/>", function (e){
					$("#maxSalaryAmt").focus();
				});
				return false;
			}

			if($("#minSalaryAmt").val() > $("#maxSalaryAmt").val()) {
				alertify.alert("<spring:message code="compny.vacancy.errors.msg25"/>", function (e){
					$("#maxSalaryAmt").focus();
				});
				return false;
			}

			//NSSF 등록여부
			if(!$("input:radio[name='nssfYn']").is(":checked")) {
				alertify.alert("<spring:message code="compny.vacancy.errors.msg26"/>", function (e){
					$("input:radio[name='nssfYn']").focus();
				});

				return false;
			}

			//NSSF Y일경우
			if($("input:radio[name='nssfYn']:checked").val() == "Y") {
				if($("#nssfSpec").val() == "") {
					alertify.alert("<spring:message code="compny.vacancy.errors.msg32"/>", function (e){
						$("#nssfSpec").focus();
					});
					return false;
				}
			}


			//기타/사회보험 제공여부
			if(!$("input:radio[name='etcInsuYn']").is(":checked")) {
				alertify.alert("<spring:message code="compny.vacancy.errors.msg27"/>", function (e){
					$("input:radio[name='etcInsuYn']").focus();
				});

				return false;
			}

			//기타/사회보험 제공여부 Y일경우
			if($("input:radio[name='etcInsuYn']:checked").val() == "Y") {
				if($("#etcInsuSpec").val() == "") {
					alertify.alert("<spring:message code="compny.vacancy.errors.msg33"/>", function (e){
						$("#etcInsuSpec").focus();
					});
					return false;
				}
			}


			//최소필수 교육
			if(!$("input:radio[name='minEduDegreeYn']").is(":checked")) {
				alertify.alert("<spring:message code="compny.vacancy.errors.msg37"/>", function (e){
					$("input:radio[name='minEduDegreeYn']").focus();
				});

				return false;
			}

			//최소필수 교육 Y
			if($("input:radio[name='minEduDegreeYn']:checked").val() == "Y") {
				if($("#minEduDegreeCd").val() == "") {
					alertify.alert("<spring:message code="compny.vacancy.errors.msg37"/>", function (e){
						$("#minEduDegreeCd").focus();
					});
					return false;
				}

				if($("#iscedCdLvlOne").val() == "") {
					alertify.alert("<spring:message code="compny.vacancy.errors.msg38"/>", function (e){
						$("#iscedCdLvlOne").focus();
					});
					return false;
				}

				if($("#iscedCd").val() == "") {
					alertify.alert("<spring:message code="compny.vacancy.errors.msg38"/>", function (e){
						$("#iscedCd").focus();
					});
					return false;
				}

				//전문 라이선스가 필요하십니까?
				if(!$("input:radio[name='proLicnsYn']").is(":checked")) {
					alertify.alert("<spring:message code="compny.vacancy.errors.msg39"/>", function (e){
						$("input:radio[name='proLicnsYn']").focus();
					});

					return false;
				}

				if($("input:radio[name='proLicnsYn']:checked").val() == "Y") {
					if($("#proLicnsNm").val() == "") {
						alertify.alert("<spring:message code="compny.vacancy.errors.msg40"/>", function (e){
							$("#proLicnsNm").focus();
						});
						return false;
					}
				}

			}

			//필요한 업무경험
			if(!$("input:radio[name='minWorkExpYn']").is(":checked")) {
				alertify.alert("<spring:message code="compny.vacancy.errors.msg41"/>", function (e){
					$("input:radio[name='minWorkExpYn']").focus();
				});

				return false;
			}


			//필요한 업무경험 Y
			if($("input:radio[name='minWorkExpYn']:checked").val() == "Y") {
				if($("#minWorkExp").val() == "") {
					alertify.alert("<spring:message code="compny.vacancy.errors.msg42"/>", function (e){
						$("#minWorkExp").focus();
					});
					return false;
				}

				if($("#isicCdLvlOne").val() == "") {
					alertify.alert("<spring:message code="compny.vacancy.errors.msg43"/>", function (e){
						$("#isicCdLvlOne").focus();
					});
					return false;
				}

				if($("#isicCd").val() == "") {
					alertify.alert("<spring:message code="compny.vacancy.errors.msg43"/>", function (e){
						$("#isicCd").focus();
					});
					return false;
				}

				//전문 라이선스가 필요하십니까?
				if(!$("input:radio[name='proLicnsYn']").is(":checked")) {
					alertify.alert("<spring:message code="compny.vacancy.errors.msg39"/>", function (e){
						$("input:radio[name='proLicnsYn']").focus();
					});

					return false;
				}

				if($("input:radio[name='proLicnsYn']:checked").val() == "Y") {
					if($("#proLicnsNm").val() == "") {
						alertify.alert("<spring:message code="compny.vacancy.errors.msg40"/>", function (e){
							$("#proLicnsNm").focus();
						});
						return false;
					}
				}

			}


			//외국어
			var langChk = true;
			var langLength = $("select[name=langCd]").length;
			//console.log("===========================langLength="+langLength);

			$("select[name=langCd]").each(function(i, selected){
				//console.log("====this i="+ i+",val=" +$(this).val()+",id="+$(this).attr("id"))
				var id = $(this).attr("id");
				if($(this).val() == "") {
					alertify.alert("<spring:message code="compny.vacancy.errors.msg34"/>", function (e){
						$("#"+id).focus();
					});

					langChk = false;
					return false;
				}

			});

			if(langChk == false) {
				return false;
			}

			var chkLangLvlCdStr = false;

			var radioIdArr = []; //id 값을 넣을 배열
			var radioIdVal = new Array;//object

			var radio = $("input:radio[name^='langLvlCd']");
			$.each(radio, function (key, value) {
				radioIdArr.push($(value).attr('id')); // id 값만을 추출
			});
			radioIdArr = $.unique(radioIdArr.sort()).sort(); //중복요소제거


			var inputRadio; // 라디오 id로 접근하기 위해서
			for (var i = 0; i < radioIdArr.length; i++) {
				inputRadio = $("input:radio[id=" + radioIdArr[i] + "]"); // id값으로 확인
				$.each(inputRadio, function (key, value) {
					if ($(this)[0].checked === true) { //체크가 되어 있는지 아닌지확인
						radioIdVal.push($(this)[0].value); // 라디오 id 값과 value 값을 매칭
					}
				});
			}


			//console.log("============radioIdVal="+radioIdVal); //{grade: "1학년", school: "초등학교", sex: "남"}

			if(langLength != radioIdVal.length) {
				alertify.alert("<spring:message code="compny.vacancy.errors.msg35"/>", function (e){
					$("#langLvlCd_1").focus();
				});

				return false;
			}


			$("#langLvlCdStr").val(radioIdVal.join(","));

			//console.log("============langLvlCdStr val="+$("#langLvlCdStr").val());

			//우대조건
			if(!$("input:checkbox[name='preferntCondCd']").is(":checked")) {
				alertify.alert("<spring:message code="compny.vacancy.errors.msg36"/>", function (e){
					$("input:checkbox[name='preferntCondCd']").focus();
				});

				return false;
			}


			//담당자
			if($("#mngerNm").val() == "") {
				alertify.alert("<spring:message code="member.join.step.two.compnay.errors.msg6"/>", function (e){
					$("#mngerNm").focus();
				});
				return false;
			}

			//사용자이메일,user email
			if (!fnCheckEmail($("#mngerEmail").val())) {
				alertify.alert("<spring:message code="login.stop.errors.email"/>", function (e){
					$("#mngerEmail").focus();
				});

				return false;
			}


			//휴대푠번호 user cell phone check
			if ($("#mngerCell").val() == "") {
				alertify.alert("<spring:message code="login.stop.errors.cell"/>", function (e){
					$("#mngerCell").focus();
				});

				return false;
			}

			// 추가한 파일 개수
			//var uploadCnt = DEXT5UPLOAD.GetTotalFileCount(uploadId);
			/* if(uploadCnt > 0){
				// 파일전송
				DEXT5UPLOAD.Transfer('commonUpload');
			}else{
				fnFileFormSave();
			} */
			dext5UploadTransfer(fnFileFormSave);
		}

		function fnTempSave(){
			$('#commonUploadFlag').val('TI');

			//채용공고 제목
			if($("#vacancyTitle").val() == "") {
				alertify.alert("<spring:message code="compny.vacancy.errors.msg3"/>", function (e){
					$("#vacancyTitle").focus();
				});
				return false;
			}

			var addrList = [];
			$('#spanAddrCd').find('span').each(function(){
				var obj = new Object();
				obj.addrCd = $(this).find('.addrCd').val();
				obj.addrFullCd = $(this).find('.addrFullCd').val();
				obj.addrFullNm = $(this).find('.addrFullNm').val();

				addrList.push(obj);
			});
			$("#addrCd").val(JSON.stringify(addrList));

			//오전근무시간
			var workMornBgn = "";
			var workMornEnd = "";
			if($("#workMornBgnHour").val() != "" && $("#workMornBgnMinute").val() != "") {
				workMornBgn = $("#workMornBgnHour").val() + "" + $("#workMornBgnMinute").val() + "00";
				$("#workMornBgnTime").val(workMornBgn);
			}

			if($("#workMornEndHour").val() != "" && $("#workMornEndMinute").val() != "") {
				workMornEnd = $("#workMornEndHour").val() + "" + $("#workMornEndMinute").val() + "00";
				$("#workMornEndTime").val(workMornEnd);
			}

			if(workMornBgn !="" && workMornEnd !="" && (Number(workMornBgn) >= Number(workMornEnd))) {
				alertify.alert("<spring:message code="compny.vacancy.errors.msg13"/>", function (e){
					$("#workMornBgnHour").focus();
				});
				return false;
			}

			//오후근무시간
			var workAfternnBgn = "";
			var workAfternnEnd = "";
			if($("#workAfternnBgnHour").val() != "" && $("#workAfternnBgnMinute").val() != "") {
				workMornBgn = $("#workAfternnBgnHour").val() + "" + $("#workAfternnBgnMinute").val() + "00";
				$("#workAfternnBgnTime").val(workAfternnBgn);
			}

			if($("#workAfternnEndHour").val() != "" && $("#workAfternnEndMinute").val() != "") {
				workAfternnEnd = $("#workAfternnEndHour").val() + "" + $("#workAfternnEndMinute").val() + "00";
				$("#workAfternnEndTime").val(workAfternnEnd);
			}

			if(workAfternnBgn !="" && workAfternnEnd !="" && (Number(workAfternnBgn) >= Number(workAfternnEnd))) {
				alertify.alert("<spring:message code="compny.vacancy.errors.msg13"/>", function (e){
					$("#workAfternnBgnHour").focus();
				});
				return false;
			}


			//야간근무시간
			var workNightBgn = "";
			var workNightEnd = "";
			if($("#workNightBgnHour").val() != "" && $("#workNightBgnMinute").val() != "") {
				workMornBgn = $("#workNightBgnHour").val() + "" + $("#workNightBgnMinute").val() + "00";
				$("#workNightBgnTime").val(workNightBgn);
			}

			if($("#workNightEndHour").val() != "" && $("#workNightEndMinute").val() != "") {
				workNightEnd = $("#workNightEndHour").val() + "" + $("#workNightEndMinute").val() + "00";
				$("#workNightEndTime").val(workNightEnd);
			}

			if(workNightBgn !="" && workNightEnd !="" && (Number(workNightBgn) >= Number(workNightEnd))) {
				alertify.alert("<spring:message code="compny.vacancy.errors.msg13"/>", function (e){
					$("#workNightBgnHour").focus();
				});
				return false;
			}


			//외국어

			var chkLangLvlCdStr = false;

			var radioIdArr = []; //id 값을 넣을 배열
			var radioIdVal = new Array;//object

			var radio = $("input:radio[name^='langLvlCd']");
			$.each(radio, function (key, value) {
				radioIdArr.push($(value).attr('id')); // id 값만을 추출
			});
			radioIdArr = $.unique(radioIdArr.sort()).sort(); //중복요소제거


			var inputRadio; // 라디오 id로 접근하기 위해서
			for (var i = 0; i < radioIdArr.length; i++) {
				inputRadio = $("input:radio[id=" + radioIdArr[i] + "]"); // id값으로 확인
				$.each(inputRadio, function (key, value) {
					if ($(this)[0].checked === true) { //체크가 되어 있는지 아닌지확인
						radioIdVal.push($(this)[0].value); // 라디오 id 값과 value 값을 매칭
					}
				});
			}

			//console.log("============radioIdVal="+radioIdVal); //{grade: "1학년", school: "초등학교", sex: "남"}

			$("#langLvlCdStr").val(radioIdVal.join(","));

			// 추가한 파일 개수
			//var uploadCnt = DEXT5UPLOAD.GetTotalFileCount(uploadId);
			/* if(uploadCnt > 0){
				// 파일전송
				DEXT5UPLOAD.Transfer('commonUpload');
			}else{
				fnFileFormTempSave();
			} */
			dext5UploadTransfer(fnFileFormTempSave);
		}

    	function fnFileFormSave() {
    		var form = $('#frm')[0];
			var formData = new FormData(form);
			//formData.append("uploadImgFile", $('#imgFile')[0].files[0]);

    		$.ajax({
				type: 'post',
				url: contextPath + "/cpes/compny/vacancy/writeProcessAjax.do",
				dataType: 'json',
				data: formData,
				contentType: false,
				processData: false,
				success: function(data) {
					if (data.result.successYn == "Y") {
						alertify.alert("<spring:message code="counsel.msg.reg.ok"/>", function (e){
							fnGoMoveUrl('frmSearch', '${pageContext.request.contextPath}/cpes/compny/vacancy/list.do');
						});
					} else {
		 				var msg = "<spring:message code="login.findId.no.data"/>";
						if(data.result.statCd == "03") {
							msg = "<spring:message code="errors.ajax.fail"/>";
						}
						alertify.alert(msg);
					}
				},
				error: function(xhr, status, error) {
					alertify.alert("<spring:message code="errors.ajax.fail"/>");
				}
			});

			/* $.ajax({
				url: contextPath + "/cpes/compny/vacancy/writeProcessAjax.do",
				type: 'post',
				data: $("#frm").serialize(),
				contentType: false,
				processData: false,
				datatype: 'json'
			})
			.done(function(data) {
				if (data.result.successYn == "Y") {
					alertify.alert("<spring:message code="counsel.msg.reg.ok"/>", function (e){
						fnGoMoveUrl('frmSearch', '${pageContext.request.contextPath}/cpes/compny/vacancy/list.do');
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
			}); */

    	}

		function fnCopySeqChange(obj) {
			if($(obj).val() == "") {
				alertify.alert("<spring:message code="compny.vacancy.error.choice"/>", function (e){
					$(obj).focus();
				});
				return false;
			}

			vacancy.fnCopyVacancy($(obj).val(),"compnyVacancyWrite");
		}

    	function fnFileFormTempSave() {
    		var form = $('#frm')[0];
			var formData = new FormData(form);
			//formData.append("uploadImgFile", $('#imgFile')[0].files[0]);

    		$.ajax({
				type: 'post',
				url: contextPath + "/cpes/compny/vacancy/writeProcessTempAjax.do",
				dataType: 'json',
				data: formData,
				contentType: false,
				processData: false,
				success: function(data) {
					if (data.result.successYn == "Y") {
						alertify.alert("<spring:message code="counsel.msg.reg.ok"/>");
						$("#tempSeq").val(data.result.message);

					} else {
		 				var msg = "<spring:message code="login.findId.no.data"/>";
						if(data.result.statCd == "03") {
							msg = "<spring:message code="errors.ajax.fail"/>";
						}
						alertify.alert(msg);
					}
				},
				error: function(xhr, status, error) {
					alertify.alert("<spring:message code="errors.ajax.fail"/>");
				}
			});

			/* $.ajax({
				url: contextPath + "/cpes/compny/vacancy/writeProcessTempAjax.do",
				type: 'post',
				data: $("#frm").serialize(),
				datatype: 'json'
			})
			.done(function(data) {
				if (data.result.successYn == "Y") {
					alertify.alert("<spring:message code="counsel.msg.reg.ok"/>");
					$("#tempSeq").val(data.result.message);

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
			}); */

    	}




    	function fnSetDefaultData() {
    		$("#vacancyTitle").val("===제목");
    		$("input:radio[name='employFormCd']:input[value='EFR0000000001']").attr("checked","checked");
    		$("#spot").val("직급");
    		$("#iscoCd").val("1111");
    		$("#recrumtMemb").val("10");
    		$("#addrCd").val("10,11");
    		$("input:radio[name='recrumtDiffcltYn']:input[value='N']").attr("checked","checked");

    		$("input:radio[name='employCtrctCd']:input[value='CRT0000000001']").attr("checked","checked");
    		$("input:radio[name='employCtrctTypeCd']:input[value='CRM0000000001']").attr("checked","checked");
    		$("input:radio[name='preferEmploymtTypeCd']:input[value='PET0000000001']").attr("checked","checked");

    		$("#workMornBgnHour").val("09");
    		$("#workMornBgnMinute").val("00");
    		$("#workMornEndHour").val("10");
    		$("#workMornEndMinute").val("00");


    		$("#workAfternnBgnHour").val("01");
    		$("#workAfternnBgnMinute").val("00");
    		$("#workAfternnEndHour").val("06");
    		$("#workAfternnEndMinute").val("00");

    		$("#dayWorkTime").val("8");
    		$("#weekWorkDay").val("5");

    		$("input:radio[name='nightWorkYn']:input[value='N']").attr("checked","checked");

    		$("input:radio[name='hldayWorkYn']:input[value='N']").attr("checked","checked");
    		$("input:radio[name='flexWorkYn']:input[value='N']").attr("checked","checked");
    		$("input:radio[name='overWorkYn']:input[value='N']").attr("checked","checked");
    		$("input:radio[name='probtYn']:input[value='N']").attr("checked","checked");
    		$("input:radio[name='trnngYn']:input[value='N']").attr("checked","checked");


    		$("input:radio[name='salaryUnitCd']:input[value='WAG0000000001']").attr("checked","checked");
    		$("#minSalaryAmt").val("100");
    		$("#maxSalaryAmt").val("120");

    		$("input:radio[name='nssfYn']:input[value='N']").attr("checked","checked");
    		$("input:radio[name='etcInsuYn']:input[value='N']").attr("checked","checked");

    		//$("#langCd").val("LNG0000000001");
    		//$("#langLvlCd_1").val("LNL0000000001");


    		$("#jobDesc").val("111");
    		$("#recrumtJobRefKnow").val("2222");
    		$("#recrumtJobRefBasicSkill").val("3333");
    		$("#recrumtJobRefWorkNeedItem").val("4444");
    		$("#etc").val("555");

    		$("input:checkbox[name='preferntCondCd']:input[value='PCC0000000003']").attr("checked","checked");
    		$("input:checkbox[name='preferntCondCd']:input[value='PCC0000000002']").attr("checked","checked");
    		$("#workExpln").val("7777");

    		$("#mngerNm").val("반니");
    		$("#mngerEmail").val("trustkst@gmail.com");
    		$("#mngerCell").val("00000000");



    	}

	</script>
	<main class="colgroup" id="colgroup">
    	<article>
			<header class="sub_head">
				<div class="sub_title">
					<h2><span><spring:message code="compny.vacancy.msg.reg.title"/></span></h2>
				</div>
           	</header>
			<div id="contents" class="vacancyWrite">


				<fieldset>
					<legend>Job Vacancy registration</legend>

					<div class="profile_title_top">
						<label for="profile_title_sel" class="skip">Import other training programs</label>
						<select id="condCopySeq" onChange="javascript:fnCopySeqChange(this);">
							<option value=""><spring:message code="compny.vacancy.errors.msg44"/></option>
						    <c:forEach var="data" items="${resultList}" varStatus="status">
						    	<option value="${data.vacancySeq}" <c:if test="${data.vacancySeq == param.condCopySeq}">selected</c:if>>${data.vacancyTitle}</option>
						    </c:forEach>
						</select>
					</div>
					<form id="frmSearch" name="frmSearch" action="${pageContext.request.contextPath}/cpes/compny/vacancy/list.do" method="post">
						<input type="hidden" id="condType" name="condType" value="${param.condType}"/>
						<input type="hidden" id="condText" name="condText" value="${param.condText}"/>
						<input type="hidden" id="currentPageNo" name="currentPageNo" value="${param.currentPageNo}"/>
						<input type="hidden" id="condSort" name="condSort" value="${param.condSort}"/>
						<input type="hidden" id="condStatCd" name="condStatCd" value="${param.condStatCd}"/>
					</form>

					<form id="frm" name="frm" action="${pageContext.request.contextPath}/cpes/compny/vacancy/writeProcessAjax.do" method="post" enctype="multipart/form-data">
						<input type="hidden" id="tempSeq" name="tempSeq" value=""/><!-- 직종 -->
						<input type="hidden" id="iscoCd" name="iscoCd" value=""/><!-- 직종 -->
						<input type="hidden" id="addrCd" name="addrCd" value=""/><!-- 근무지역 -->
						<input type="hidden" id="workMornBgnTime" name="workMornBgnTime"/>
						<input type="hidden" id="workMornEndTime" name="workMornEndTime"/>
						<input type="hidden" id="workAfternnBgnTime" name="workAfternnBgnTime"/>
						<input type="hidden" id="workAfternnEndTime" name="workAfternnEndTime"/>
						<input type="hidden" id="workNightBgnTime" name="workNightBgnTime"/>
						<input type="hidden" id="workNightEndTime" name="workNightEndTime"/>
						<input type="hidden" id="imgFileGrpSeq" name="imgFileGrpSeq"/>
						<input type="hidden" id="resumeFileGrpSeq" name="resumeFileGrpSeq"/>
						<input type="hidden" id="vacancyKeyword" name="vacancyKeyword"/>
						<input type="hidden" id="langLvlCdStr" name="langLvlCdStr" value=""/>
						<input type="hidden" id="commonUploadResult" name="uploadResult">
						<input type="hidden" id="commonUploadFlag">
						<div id="compnyVacancyWrite"></div><!-- 입력폼영역, input form -->
					</form>
				</fieldset>

			</div>
            <!-- //contents -->
		</article>
	</main>
	<!-- //main.colgroup -->