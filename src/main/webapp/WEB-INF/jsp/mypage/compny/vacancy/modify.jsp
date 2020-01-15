<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
	<script src="${pageContext.request.contextPath}/js/mypage/compny/vacancy/vacancy.js"></script>
    <script>
		var langIdNum = 0;
		var keywordArr = new Array;

    	$(document).ready(function() {
    		commonPopupSet('addr', true);
    		commonPopupSet('isco');

    		fnDeleteSpan();

    		dext5uploadAllFileSet("dext5uploadArea", '', '', '', '', '', '');
    		var imgFileGrpSeq = $('#imgFileGrpSeq').val();
    		var resumeFileGrpSeq = $('#resumeFileGrpSeq').val();

    		if(imgFileGrpSeq != ''){
	    		dext5AddUploadFile(imgFileGrpSeq);
    		}
    		if(resumeFileGrpSeq != ''){
	    		dext5AddUploadFile(resumeFileGrpSeq);
    		}

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

			//console.log("##########################${result.workMornBgnTime}");
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

		    				$(this).parents('.form_element').addClass('active').find('.text_box').append('<span>'+keywordVal+'<button type="button" value='+keywordVal+' onclick="fnDeleteKeyword(this)">delete</button></span>');
		    				keywordArr.push($("#keyword").val());
		    				$("#vacancyKeyword").val(keywordArr);

	    				}
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

    	function fnVacancySave(actionUrl) {
    		$('#commonUploadFlag').val('I');
    		$('#actionUrl').val(actionUrl);

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

			//근무지역
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
			/* var uploadCnt = DEXT5UPLOAD.GetTotalFileCount(uploadId);
			if(uploadCnt > 0){
				// 파일전송
				DEXT5UPLOAD.Transfer('commonUpload');
			}else{
				fnFileFormSave();
			} */
			dext5UploadTransfer(fnFileFormSave);
    	}

    	function fnFileFormSave() {

    		$.ajax({
				url: $('#actionUrl').val(),
				type: 'post',
				data: $("#frm").serialize(),
				datatype: 'json'
			})
			.done(function(data) {
				if (data.result.successYn == "Y") {
					alertify.alert("<spring:message code="counsel.msg.update.ok"/>", function (e){
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
			});

    	}


    	function fnTempSave() {
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
			var uploadCnt = DEXT5UPLOAD.GetTotalFileCount(uploadId);
			/* if(uploadCnt > 0){
				// 파일전송
				DEXT5UPLOAD.Transfer('commonUpload');
			}else{
				fnFileFormTempSave();
			} */
			dext5UploadTransfer(fnFileFormTempSave);
    	}

    	function fnFileFormTempSave() {
    		$.ajax({
				url: contextPath + "/cpes/compny/vacancy/modifyProcessTempAjax.do",
				type: 'post',
				data: $("#frm").serialize(),
				datatype: 'json'
			})
			.done(function(data) {
				if (data.result.successYn == "Y") {
					alertify.alert("<spring:message code="counsel.msg.update.ok"/>");
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
			});

    	}

		function fnVacancyDelete(actionUrl) {

			alertify.confirm(confirmDeleteMsg2, function (e) {
				if (e) {

					$.ajax({
						url: actionUrl,
						type: 'post',
						data: $("#frm").serialize(),
						datatype: 'json'
					})
					.done(function(data) {
						if (data.result.successYn == "Y") {
							alertify.alert("<spring:message code="counsel.msg.delete.success"/>", function (e){
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
					});
				}
			});
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
	<main class="colgroup" id="colgroup">
    	<article>
			<header class="sub_head">
				<div class="sub_title">
					<h2><span><spring:message code="compny.vacancy.msg.modify.title"/></span></h2>
				</div>
           	</header>
			<div id="contents" class="vacancyWrite">


				<fieldset>
					<legend>Job Vacancy registration</legend>

					<form id="frmSearch" name="frmSearch" action="${pageContext.request.contextPath}/cpes/compny/vacancy/list.do" method="post">
						<input type="hidden" id="condType" name="condType" value="${param.condType}"/>
						<input type="hidden" id="condText" name="condText" value="${param.condText}"/>
						<input type="hidden" id="currentPageNo" name="currentPageNo" value="${param.currentPageNo}"/>
						<input type="hidden" id="condSort" name="condSort" value="${param.condSort}"/>
						<input type="hidden" id="condStatCd" name="condStatCd" value="${param.condStatCd}"/>
					</form>

					<form id="frm" name="frm" action="${pageContext.request.contextPath}/cpes/compny/vacancy/writeProcessAjax.do" method="post">
						<input type="hidden" id="tempSeq" name="tempSeq" value="${result.vacancySeq}"/><!-- 직종 -->
						<input type="hidden" id="iscoCd" name="iscoCd" value="${result.iscoCd}"/><!-- 직종 -->
						<input type="hidden" id="addrCd" name="addrCd" value=""/><!-- 근무지역 -->
						<input type="hidden" id="workMornBgnTime" name="workMornBgnTime"/>
						<input type="hidden" id="workMornEndTime" name="workMornEndTime"/>
						<input type="hidden" id="workAfternnBgnTime" name="workAfternnBgnTime"/>
						<input type="hidden" id="workAfternnEndTime" name="workAfternnEndTime"/>
						<input type="hidden" id="workNightBgnTime" name="workNightBgnTime"/>
						<input type="hidden" id="workNightEndTime" name="workNightEndTime"/>
						<input type="hidden" id="imgFileGrpSeq" name="imgFileGrpSeq" value="${result.imgFileGrpSeq}">
						<input type="hidden" id="resumeFileGrpSeq" name="resumeFileGrpSeq" value="${result.resumeFileGrpSeq}">
						<input type="hidden" id="vacancyKeyword" name="vacancyKeyword"/>
						<input type="hidden" id="langLvlCdStr" name="langLvlCdStr" value=""/>
						<input type="hidden" id="vacancySeq" name="vacancySeq" value="${result.vacancySeq}"/>
						<input type="hidden" id="commonUploadResult" name="uploadResult">
						<input type="hidden" id="commonUploadFlag">
						<input type="hidden" id="actionUrl">


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
											<c:forEach items="${result.vacancyLocBeanList}" var="vacancyLoc">
												<span class="bbs_add">
													${vacancyLoc.addrCdNm}
													<input type="hidden" class="addrCd" value="${vacancyLoc.addrCd}"/>
													<input type="hidden" class="addrFullCd" value="${vacancyLoc.addrFullCd}"/>
													<input type="hidden" class="addrFullNm" value="${vacancyLoc.addrFullNm}"/>
													<button type="button" class="delete">delete</button>
												</span>
											</c:forEach>
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
												<select id="isicCdLvlOne" name="isicCdLvlOne" onchange="fnIsicCdUpperList('isicCdLvlOne','isicCd');">
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
								<div class="form_element textarea child<c:if test="${result.jobDesc != ''}"> show</c:if>">
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
								<div class="form_element textarea child<c:if test="${result.recrumtJobRefKnow != ''}"> show</c:if>">
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
								<div class="form_element textarea child<c:if test="${result.recrumtJobRefBasicSkill != ''}"> show</c:if>">
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
								<div class="form_element textarea child<c:if test="${result.recrumtJobRefWorkNeedItem != ''}"> show</c:if>">
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
								<div class="form_element textarea child<c:if test="${result.etc != ''}"> show</c:if>">
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
										<button type="button" class="btn add noround">Selection</button>
										<span class="cont"><!-- 선택사항 들어갈 자리 -->
											<span class="bbs_add">JAVA Program <button type="button">delete</button></span>
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
							<tr>
								<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title66"/></th>
								<td>
									<div id="dext5uploadArea"></div>
								</td>
							</tr>
						</tbody>
					</table>

					<div class="bbs_btn_wrap">
						<div class="bbs_center">
							<input type="button" onclick="fnGoList('frmSearch');" class="bbs_btn type01" value="<spring:message code="button.list"/>"/>
							<c:choose>
								<c:when test="${result.tempYn == 'Y'}">
									<button type="button" onClick="javascript:fnTempSave();" class="bbs_btn type02"><spring:message code="compny.vacancy.msg.title65"/></button>
									<button type="button" onClick="javascript:fnVacancyDelete('${pageContext.request.contextPath}/cpes/compny/vacancy/deleteProcessTempAjax.do');" class="bbs_btn type02"><spring:message code="button.delete"/></button>
									<input type="button"  onClick="javascript:fnVacancySave('${pageContext.request.contextPath}/cpes/compny/vacancy/writeProcessAjax.do');" value="<spring:message code="compny.vacancy.msg.title69"/>" class="bbs_btn type01" />
								<!-- counsel.msg.btn.delete -->
								</c:when>
								<c:otherwise>
									<input type="button"  onClick="javascript:fnVacancySave('${pageContext.request.contextPath}/cpes/compny/vacancy/modifyProcessAjax.do');" value="<spring:message code="button.save"/>" class="bbs_btn type01" />
									<c:if test="${result.jcAgreeStsCd != 'JAS0000000001'}"><!-- 승인상태가 아닌경우 -->
										<button type="button" onClick="javascript:fnVacancyDelete('${pageContext.request.contextPath}/cpes/compny/vacancy/deleteProcessAjax.do');" class="bbs_btn type02"><spring:message code="button.delete"/></button>
									</c:if>
								</c:otherwise>
							</c:choose>
						</div>
					</div>


					</form>
				</fieldset>

			</div>
            <!-- //contents -->
		</article>
	</main>
	<!-- //main.colgroup -->