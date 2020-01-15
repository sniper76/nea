<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>

    <script>
    	$(document).ready(function() {
    		var resumeTitleMsg = "<spring:message code='resume.write.errors.msg4'/>";
    		var resumePIMsg = "<spring:message code='resume.write.errors.msg5'/>";
    		var resumeDisableMsg = "<spring:message code='resume.write.errors.msg6'/>";
    		var resumeWorkingConditionsMsg = "<spring:message code='resume.write.errors.msg7'/>";
    		var resumeGradeMsg = "<spring:message code='resume.write.errors.msg8'/>";
    		var resumeSpecialtyMsg = "<spring:message code='resume.write.errors.msg9'/>";
    		var resumeSpecialtyLessMsg = "<spring:message code='resume.write.errors.msg10'/>";
    		var resumeOtherMsg = "<spring:message code='resume.write.errors.msg11'/>";
    		var resumeOtherLessMsg = "<spring:message code='resume.write.errors.msg12'/>";
    		var resumeNationalLanguageMsg = "<spring:message code='resume.write.errors.msg13'/>";
    		var resumeLanguageMsg = "<spring:message code='resume.write.errors.msg14'/>";
    		var resumeLanguageLessMsg = "<spring:message code='resume.write.errors.msg15'/>";
    		var resumeCareerMsg = "<spring:message code='resume.write.errors.msg16'/>";
    		var resumeReferrerMsg = "<spring:message code='resume.write.errors.msg17'/>";
    		var resumeAgreeMsg = "<spring:message code='resume.write.errors.msg18'/>";

    		var resumeInsertCompleteMsg = "<spring:message code='resume.write.insert.complete'/>";
    		var resumeUpdateCompleteMsg = "<spring:message code='resume.update.complete'/>";
    		var resumeFullInsertMsg = "<spring:message code='resume.write.insert.fullCnt'/>";
    		var resumeInsertErrorMsg = "<spring:message code='resume.write.insert.error'/>";
    		var resumeTempInsertCompleteMsg = "<spring:message code='resume.write.insert.tempComplete'/>";

    		setClickEvent();

    		fnAddForm();
    		fnCodeSelect();
    		fnSelectNationality();
    		fnCalculationCareer();
    		fnInputValidation('inputNo', '1');
    		fnInputValidation('inputMM', '2');
    		fnInputValidation('inputYY', '3');
    		fnInputValidation('inputTime', '4');
    		fnInputValidation('inputWeek', '5');
    		fnCheckEmail('inputEmail');
    		commonPopupSet('isco');

    		// 저장
    		$('#btn_save').on('click', function(){
				var profile_title = $('#profile_title').val();

				if(profile_title == ""){
					alertify.alert(resumeTitleMsg);
					return false;
				}

				// 인적 사항 입력 여부 체크
				var addrNm = $('input[name=addrNm]').val();
				var addrCd = $('input[name=addrCd]').val();
				var marriCd = $('#marriCd').val();
				var familyCnt = $('#familyCnt').val();
				var underAge15FamilyCnt = $('#underAge15FamilyCnt').val();
				var overAge64FamilyCnt  = $('#overAge64FamilyCnt').val();
				var disablYn            = ($('input[name=disablYn]').val() == 'Y') ? 'Y' : 'N';
				var selfempYn           = ($('input[name=selfempYn]').val() == 'Y') ? 'Y' : 'N';
				var urgentJobseekYn     = ($('input[name=urgentJobseekYn]').val() == 'Y') ? 'Y' : 'N';

				var disablOptionCdList = [];

				$('input[name=disablOptionCd]:checked').each(function(){
					disablOptionCdList.push($(this).val());
				});


				if(addrNm == "" || addrCd == "" || marriCd == "" || familyCnt == "" || underAge15FamilyCnt == "" || overAge64FamilyCnt == "" ||
						disablYn == "" || selfempYn == "" || urgentJobseekYn == ""){

					alertify.alert(resumePIMsg);
					return false;
				}else if(disablYn == 'Y' && disablOptionCdList.length == 0){

					alertify.alert(resumeDisableMsg);
					return false;
				}

				// ~ 인적 사항 입력 여부 체크

				// 희망근무 조건 입력 여부 체크

				var preferJobTitle     = $('#preferJobTitle').val();
				var preferPosition     = $('#preferPosition').val();
				var employFormCd       = $('#employFormCd').val();
				var expctMinSalaryAmt  = $('#expctMinSalaryAmt').val();
				var expctMaxSalaryAmt  = $('#expctMaxSalaryAmt').val();

				var preferEmployTypeCd = $('input[name=preferEmployTypeCd]:checked').val();

				var typeEmployHourDay = $('#typeEmployHourDay').val();
				var typeEmployDayWeek = $('#typeEmployDayWeek').val();
				var preferDayMon      = ($('#preferDayMon:checked').val() == 'Y') ? 'Y' : 'N';
				var preferDayTue      = ($('#preferDayTue:checked').val() == 'Y') ? 'Y' : 'N';
				var preferDayWed      = ($('#preferDayWed:checked').val() == 'Y') ? 'Y' : 'N';
				var preferDayThu      = ($('#preferDayThu:checked').val() == 'Y') ? 'Y' : 'N';
				var preferDayFri      = ($('#preferDayFri:checked').val() == 'Y') ? 'Y' : 'N';
				var preferDaySat      = ($('#preferDaySat:checked').val() == 'Y') ? 'Y' : 'N';
				var preferDaySun      = ($('#preferDaySun:checked').val() == 'Y') ? 'Y' : 'N';

				var nightWorkYn      = ($('#nightWorkYn:checked').val() == 'Y') ? 'Y' : 'N';
				var overTimeWorkYn      = ($('#overTimeWorkYn:checked').val() == 'Y') ? 'Y' : 'N';
				var hldayWorkYn      = ($('#hldayWorkYn:checked').val() == 'Y') ? 'Y' : 'N';

				var preferCrtctType    = $('input[name=preferCrtctType]:checked').val();
				var diffProvcWorkYn    = $('input[name=diffProvcWorkYn]:checked').val();

				var workBgnAbleYn      = $('input[name=workBgnAbleYn]:checked').val();
				var workBgnAbleWithin  = $('#workBgnAbleWithin').val();

				var hopeWorkLocList = [];

				$('#hopeLoc').find('.text_box').find('span').each(function(){
					var hopeWorkLocObj = new Object();
					hopeWorkLocObj.addrCd = $(this).find('input[name=hopeLocCd]').val();
					hopeWorkLocObj.addrFullCd = $(this).find('input[name=hopeLocCd]').val();
					hopeWorkLocObj.addrFullNm = $(this).find('input[name=hopeLocNm]').val();

					hopeWorkLocList.push(hopeWorkLocObj);
				});

				var iscoList = [];
				$('#span_isco').find('span').each(function(){
					var iscoObj = new Object();
					iscoObj.iscoCd = $(this).find('input[name=iscoCd]').val();

					iscoList.push(iscoObj);
				});

				if(preferJobTitle == "" || preferPosition == "" || employFormCd == "" || expctMinSalaryAmt == "" || expctMaxSalaryAmt == "" || preferEmployTypeCd == ""
					 || preferCrtctType == "" || diffProvcWorkYn == "" || workBgnAbleYn == "" || hopeWorkLocList.length == 0 || iscoList.length == 0){

					alertify.alert(resumeWorkingConditionsMsg);
					return false;
				}else if(preferEmployTypeCd == "PET0000000001" && (typeEmployHourDay == "" || typeEmployDayWeek == "")){
					alertify.alert(resumeWorkingConditionsMsg);
					return false;
				}else if(preferEmployTypeCd == "PET0000000001" && preferDayMon == "" && preferDayTue == "" && preferDayWed == "" && preferDayThu == ""
						&& preferDayFri == "" && preferDaySat == "" && preferDaySun == ""){

					alertify.alert(resumeWorkingConditionsMsg);
					return false;
				}else if(workBgnAbleYn == "Y" && workBgnAbleWithin == ""){

					alertify.alert(resumeWorkingConditionsMsg);
					return false;
				}

				// ~ 희망근무 조건 입력 여부 체크

				// 학력 및 전문 훈련 입력 여부 체크
				var eduDegreeCd = $('input[name=eduDegreeCd]').val();

				if(eduDegreeCd == ""){

					alertify.alert(resumeGradeMsg);
					return false;
				}
				// ~ 학력 및 전문 훈련 입력 여부 체크

				// 연구 및 전문분야 입력 여부 체크

				var ss_formList = [];

				$('#ss_form').find('.form_contents').each(function(){
					var ss_specialStudyNm = $(this).find('input[name=ss_specialStudyNm]').val();
					var ss_bgnDt_mm = $(this).find('input[name=ss_bgnDt_mm]').val();
					var ss_bgnDt_yy = $(this).find('input[name=ss_bgnDt_yy]').val();
					var ss_endDt_mm = $(this).find('input[name=ss_endDt_mm]').val();
					var ss_endDt_yy = $(this).find('input[name=ss_endDt_yy]').val();
					var ss_insttNm = $(this).find('input[name=ss_insttNm]').val();
					var ss_cntryCd = $(this).find('input[name=ss_cntryCd]').val();
					var ss_provcCd = $(this).find('input[name=ss_provcCd]').val();

					if(ss_specialStudyNm == "" || ss_specialStudyNm == "" || ss_specialStudyNm == "" || ss_specialStudyNm == "" || ss_specialStudyNm == ""
						 || ss_specialStudyNm == "" || ss_specialStudyNm == "" || ss_specialStudyNm == ""){

						alertify.alert(resumeSpecialtyMsg);
					}else{
						var ss_formObj = new Object();
						ss_formObj.specialStudyNm = ss_specialStudyNm;
						ss_formObj.bgnDt = ss_bgnDt_yy + "-" + ss_bgnDt_mm + "-01";
						ss_formObj.endDt = ss_endDt_yy + "-" + ss_endDt_mm + "-01";
						ss_formObj.insttNm = ss_insttNm;
						ss_formObj.cntryCd = ss_cntryCd;
						ss_formObj.provcCd = ss_provcCd;

						ss_formList.push(ss_formObj);
					}
				});

				if(ss_formList.length == 0){

					alertify.alert(resumeSpecialtyLessMsg);
					return false;
				}

				// ~ 연구 및 전문분야 입력 여부 체크

				// 자격증 보유 여부
				// 테이블 확인 후 진행

				// ~ 자격증 보유 여부

				// 기타교육
				var ot_formList = [];
				$('#ot_form').find('.form_contents').each(function(){
					var ot_trnngEduDegreeCd = $(this).find('input[name=ot_trnngEduDegreeCd]').val();
					var ot_iscedCd          = $(this).find('input[name=ot_iscedCd]').val();
					var ot_insttNm          = $(this).find('input[name=ot_insttNm]').val();
					var ot_addrProvcCd      = $(this).find('input[name=ot_addrProvcCd]').val();
					var ot_bgnDt_mm         = $(this).find('input[name=ot_bgnDt_mm]').val();
					var ot_bgnDt_yy         = $(this).find('input[name=ot_bgnDt_yy]').val();
					var ot_endDt_mm         = $(this).find('input[name=ot_endDt_mm]').val();
					var ot_endDt_yy         = $(this).find('input[name=ot_endDt_yy]').val();

					if(ot_trnngEduDegreeCd == "" || ot_iscedCd == "" || ot_insttNm == "" || ot_addrProvcCd == "" || ot_bgnDt_mm == "" || ot_bgnDt_yy == ""
						|| ot_endDt_mm == "" || ot_endDt_yy == ""){

						alertify.alert(resumeOtherMsg);
					}else{
						var ot_formObj = new Object();
						ot_formObj.trnngEduDegreeCd = ot_trnngEduDegreeCd;
						ot_formObj.iscedCd = ot_iscedCd;
						ot_formObj.insttNm = ot_insttNm;
						ot_formObj.addrProvcCd = ot_addrProvcCd;
						ot_formObj.bgnDt = ot_bgnDt_yy + "-" + ot_bgnDt_mm + "-01";
						ot_formObj.endDt = ot_endDt_yy + "-" + ot_endDt_mm + "-01";

						ot_formList.push(ot_formObj);
					}
				});

				if(ot_formList.length == 0){

					alertify.alert(resumeOtherLessMsg);
					return false;
				}

				// ~ 기타 교육

				// 어학
				var langUseCd = $('#langUseCd').val();

				if(langUseCd == ""){
					alertify.alert(resumeNationalLanguageMsg);
					return false;
				}

				var rl_formList = [];

				$('.rl_form').each(function(){
					var rl_langNm = $(this).find('#rl_langNm').val();
					var rl_langLvlCd = $(this).find('input[name=rl_langLvlCd]').val();

					if(rl_langNm == "" || rl_langLvlCd == ""){
						alertify.alert(resumeLanguageMsg);
					}else{
						var rl_formObj = new Object();
						rl_formObj.langLvlCd = rl_langLvlCd;
						// 외국어명 컬럼이 없음.

						rl_formList.push(rl_formObj);
					}
				});

				if(rl_formList.length == 0){
					alertify.alert(resumeLanguageLessMsg);
					return false;
				}

				// ~ 어학

				// 경력
				var exp_formList = [];
				$('.exp_form').each(function(){
					//직급/직책 컬럼없음
					var exp_orgnzNm     = $(this).find('input[name=exp_orgnzNm]').val();
					var exp_iscoCd      = $(this).find('input[name=exp_iscoCd]').val();
					var exp_selfempYn   = $(this).find('input[name=exp_selfempYn]:checked').val();
					var exp_bgnDt_mm    = $(this).find('input[name=exp_bgnDt_mm]').val();
					var exp_bgnDt_yy    = $(this).find('input[name=exp_bgnDt_yy]').val();
					var exp_endDt_mm    = $(this).find('input[name=exp_endDt_mm]').val();
					var exp_endDt_yy    = $(this).find('input[name=exp_endDt_yy]').val();
					var exp_leaveReason = $(this).find('input[name=exp_leaveReason]').val();

					if(exp_orgnzNm == "" || exp_iscoCd == "" || exp_iscoCd == "" || exp_iscoCd == "" || exp_iscoCd == ""
							|| exp_iscoCd == "" || exp_iscoCd == "" || exp_iscoCd == ""){

						alertify.alert(resumeCareerMsg);
					}else{
						var exp_formObj = new Object();
						exp_formObj.orgnzNm = exp_orgnzNm;
						exp_formObj.iscoCd = exp_iscoCd;
						exp_formObj.selfempYn = exp_selfempYn;
						exp_formObj.bgnDt = exp_bgnDt_yy + "-" + exp_bgnDt_mm + "-01";
						exp_formObj.endDt = exp_endDt_yy + "-" + exp_endDt_mm + "-01";
						exp_formObj.leaveReason = exp_leaveReason;

						exp_formList.push(exp_formObj);
					}
				});

				// ~ 경력

				// skill
				var sk_formList = [];
				$('.sk_form').find('input[name=sk_skillCd]:checked').each(function(){
					sk_formList.push($(this).val());
				});
				// ~ skill

				// 추천인
				var ref_formList = [];
				$('.ref_form').each(function(){
					var ref_nm       = $(this).find('input[name=ref_nm]').val();
					var ref_orgnzNm  = $(this).find('input[name=ref_orgnzNm]').val();
					var ref_position = $(this).find('input[name=ref_position]').val();
					var ref_ref      = $(this).find('input[name=ref_ref]').val();
					var ref_cell     = $(this).find('input[name=ref_cell]').val();
					var ref_email    = $(this).find('input[name=ref_email]').val();
					var ref_addrNm   = $(this).find('input[name=ref_addrNm]').val();
					var ref_addrCd   = $(this).find('input[name=ref_addrCd]').val();
					var ref_addrDtl  = $(this).find('input[name=ref_addrDtl]').val();

					if(ref_nm == "" || ref_orgnzNm == "" || ref_position == "" || ref_ref == "" || ref_cell == "" || ref_email == ""
							|| ref_addrNm == "" || ref_addrCd == ""
							/* || ref_addrDtl == "" */
							){

						alertify.alert(resumeReferrerMsg);
					}else{
						var ref_formObj = new Object();

						ref_formObj.nm = ref_nm;
						ref_formObj.orgnzNm = ref_orgnzNm;
						ref_formObj.position = ref_position;
						ref_formObj.ref = ref_ref;
						ref_formObj.cell = ref_cell;
						ref_formObj.email = ref_email;
						ref_formObj.addrFullNm = ref_addrNm;
						ref_formObj.addrCd = ref_addrCd;
						ref_formObj.addrFullCd = ref_addrCd;
						ref_formObj.addrDtl = ref_addrDtl;


						ref_formList.push(ref_formObj);
					}
				});
				// ~ 추천인

				// keyword
				var resumeKeyword = "";
				$('.resumeKeyword').each(function(){
					if(resumeKeyword == ""){
						resumeKeyword += $(this).val();
					}else{
						resumeKeyword += ',' + $(this).val();
					}
				});

				// 약관 동의
				if(!$('#agree').prop('checked')){
					alertify.alert(resumeAgreeMsg);
					return false;
				}

				var updateFlag = $('#updateFlag').val();

				$.ajax({
					type: 'post',
					url: contextPath + "/cpes/private/resume/saveResumeUptOrCopyAjax.do",
					dataType: 'json',
					data: {
						"resumeSeq" : $('#resumeSeq').val(),
						"resumeTitle" : profile_title,
						"addrFullNm" : addrNm,
						"addrFullCd" : addrCd,
						"addrCd" : addrCd,
						"marriCd" : marriCd,
						"familyCnt" : familyCnt,
						"underAge15FamilyCnt" : underAge15FamilyCnt,
						"overAge64FamilyCnt" : overAge64FamilyCnt,
						"disablYn" : disablYn,
						"selfempYn" : selfempYn,
						"urgentJobseekYn" : urgentJobseekYn,
						"preferJobTitle" : preferJobTitle,
						"preferPosition" : preferPosition,
						"employFormCd" : employFormCd,
						"expctMinSalaryAmt" : expctMinSalaryAmt,
						"expctMaxSalaryAmt" : expctMaxSalaryAmt,
						"preferEmployTypeCd" : preferEmployTypeCd,
						"typeEmployHourDay" : typeEmployHourDay,
						"typeEmployDayWeek" : typeEmployDayWeek,
						"preferDayMon" : preferDayMon,
						"preferDayTue" : preferDayTue,
						"preferDayWed" : preferDayWed,
						"preferDayThu" : preferDayThu,
						"preferDayFri" : preferDayFri,
						"preferDaySat" : preferDaySat,
						"preferDaySun" : preferDaySun,
						"nightWorkYn" : nightWorkYn,
						"overTimeWorkYn" : overTimeWorkYn,
						"hldayWorkYn" : hldayWorkYn,
						"preferCrtctType" : preferCrtctType,
						"diffProvcWorkYn" : diffProvcWorkYn,
						"workBgnAbleYn" : workBgnAbleYn,
						"workBgnAbleWithin" : workBgnAbleWithin,
						"langUseCd" : langUseCd,
						"disableListStr" : JSON.stringify(disablOptionCdList),
						"hopeWorkLocListStr" : JSON.stringify(hopeWorkLocList),
						"genrlEduListStr" : eduDegreeCd,
						"specialStudyListStr" : JSON.stringify(ss_formList),
						"otherTrnngListStr" : JSON.stringify(ot_formList),
						"langListStr" : JSON.stringify(rl_formList),
						"workExpListStr" : JSON.stringify(exp_formList),
						"skillListStr" : JSON.stringify(sk_formList),
						"refManListStr" : JSON.stringify(ref_formList),
						"iscoCdListStr" : JSON.stringify(iscoList),
						"resumeKeyword" : resumeKeyword,
						"tempFlag" : "0",
						"updateFlag" : updateFlag
					},
					success: function(data) {

						if("copy" == updateFlag){
							if(data.result == "Y"){
								alertify.alert(resumeInsertCompleteMsg, function (e){
									location.href = contextPath + "/cpes/private/resume/list.do";
								});
							}else if(data.result == "FULL"){
								alertify.alert(resumeFullInsertMsg, function (e){
									location.href = contextPath + "/cpes/private/resume/list.do";
								});
							}else{
								alertify.alert(resumeInsertErrorMsg);
							}
						}else if("update" == updateFlag){
							if(data.result == "Y"){
								alertify.alert(resumeUpdateCompleteMsg, function (e){
									location.href = contextPath + "/cpes/private/resume/list.do";
								});
							}else{
								alertify.alert(resumeInsertErrorMsg);
							}
						}

					},
					error: function(xhr, status, error) {
						alertify.alert(resumeInsertErrorMsg);
					}
				});
    		});

    		// 임시저장 - 필수입력체크 하지않음
    		$('#btn_tempSave').on('click', function(){
    			var profile_title = $('#profile_title').val();

				// 인적 사항 입력 여부 체크
				var addrNm = $('input[name=addrNm]').val();
				var addrCd = $('input[name=addrCd]').val();
				var marriCd = $('#marriCd').val();
				var familyCnt = ($('#familyCnt').val() == "") ? 0 : $('#familyCnt').val();
				var underAge15FamilyCnt = ($('#underAge15FamilyCnt').val() == "") ? 0 : $('#underAge15FamilyCnt').val();
				var overAge64FamilyCnt  = ($('#overAge64FamilyCnt').val() == "") ? 0 : $('#overAge64FamilyCnt').val();
				var disablYn            = ($('input[name=disablYn]').val() == 'Y') ? 'Y' : 'N';
				var selfempYn           = ($('input[name=selfempYn]').val() == 'Y') ? 'Y' : 'N';
				var urgentJobseekYn     = ($('input[name=urgentJobseekYn]').val() == 'Y') ? 'Y' : 'N';

				var disablOptionCdList = [];

				$('input[name=disablOptionCd]:checked').each(function(){
					disablOptionCdList.push($(this).val());
				});

				// ~ 인적 사항 입력 여부 체크

				// 희망근무 조건 입력 여부 체크

				var preferJobTitle     = $('#preferJobTitle').val();
				var preferPosition     = $('#preferPosition').val();
				var employFormCd       = $('#employFormCd').val();
				var expctMinSalaryAmt  = ($('#expctMinSalaryAmt').val() == "") ? 0 : $('#expctMinSalaryAmt').val();
				var expctMaxSalaryAmt  = ($('#expctMaxSalaryAmt').val() == "") ? 0 : $('#expctMaxSalaryAmt').val();

				var preferEmployTypeCd = $('input[name=preferEmployTypeCd]:checked').val();

				var typeEmployHourDay = $('#typeEmployHourDay').val();
				var typeEmployDayWeek = $('#typeEmployDayWeek').val();
				var preferDayMon      = ($('#preferDayMon:checked').val() == 'Y') ? 'Y' : 'N';
				var preferDayTue      = ($('#preferDayTue:checked').val() == 'Y') ? 'Y' : 'N';
				var preferDayWed      = ($('#preferDayWed:checked').val() == 'Y') ? 'Y' : 'N';
				var preferDayThu      = ($('#preferDayThu:checked').val() == 'Y') ? 'Y' : 'N';
				var preferDayFri      = ($('#preferDayFri:checked').val() == 'Y') ? 'Y' : 'N';
				var preferDaySat      = ($('#preferDaySat:checked').val() == 'Y') ? 'Y' : 'N';
				var preferDaySun      = ($('#preferDaySun:checked').val() == 'Y') ? 'Y' : 'N';

				var nightWorkYn      = ($('#nightWorkYn:checked').val() == 'Y') ? 'Y' : 'N';
				var overTimeWorkYn      = ($('#overTimeWorkYn:checked').val() == 'Y') ? 'Y' : 'N';
				var hldayWorkYn      = ($('#hldayWorkYn:checked').val() == 'Y') ? 'Y' : 'N';

				var preferCrtctType    = $('input[name=preferCrtctType]:checked').val();
				var diffProvcWorkYn    = $('input[name=diffProvcWorkYn]:checked').val();

				var workBgnAbleYn      = $('input[name=workBgnAbleYn]:checked').val();
				var workBgnAbleWithin  = $('#workBgnAbleWithin').val();

				var hopeWorkLocList = [];

				$('#hopeLoc').find('.text_box').find('span').each(function(){
					var hopeWorkLocObj = new Object();
					hopeWorkLocObj.addrCd = $(this).find('input[name=hopeLocCd]').val();
					hopeWorkLocObj.addrFullCd = $(this).find('input[name=hopeLocCd]').val();
					hopeWorkLocObj.addrFullNm = $(this).find('input[name=hopeLocNm]').val();

					hopeWorkLocList.push(hopeWorkLocObj);
				});

				var iscoList = [];
				$('#span_isco').find('span').each(function(){
					var iscoObj = new Object();
					iscoObj.iscoCd = $(this).find('input[name=iscoCd]').val();

					iscoList.push(iscoObj);
				});

				// ~ 희망근무 조건 입력 여부 체크

				// 학력 및 전문 훈련 입력 여부 체크
				var eduDegreeCd = $('input[name=eduDegreeCd]').val();

				// ~ 학력 및 전문 훈련 입력 여부 체크

				// 연구 및 전문분야 입력 여부 체크

				var ss_formList = [];

				$('#ss_form').find('.form_contents').each(function(){
					var ss_specialStudyNm = $(this).find('input[name=ss_specialStudyNm]').val();
					var ss_bgnDt_mm = ($(this).find('input[name=ss_bgnDt_mm]').val() == "") ? "00" : $(this).find('input[name=ss_bgnDt_mm]').val();
					var ss_bgnDt_yy = ($(this).find('input[name=ss_bgnDt_yy]').val() == "") ? "0000" : $(this).find('input[name=ss_bgnDt_yy]').val();
					var ss_endDt_mm = ($(this).find('input[name=ss_endDt_mm]').val() == "") ? "00" : $(this).find('input[name=ss_endDt_mm]').val();
					var ss_endDt_yy = ($(this).find('input[name=ss_endDt_yy]').val() == "") ? "0000" : $(this).find('input[name=ss_endDt_yy]').val();
					var ss_insttNm = $(this).find('input[name=ss_insttNm]').val();
					var ss_cntryCd = $(this).find('input[name=ss_cntryCd]').val();
					var ss_provcCd = $(this).find('input[name=ss_provcCd]').val();

					var ss_formObj = new Object();
					ss_formObj.specialStudyNm = ss_specialStudyNm;
					ss_formObj.bgnDt = ss_bgnDt_yy + "-" + ss_bgnDt_mm + "-01";
					ss_formObj.endDt = ss_endDt_yy + "-" + ss_endDt_mm + "-01";
					ss_formObj.insttNm = ss_insttNm;
					ss_formObj.cntryCd = ss_cntryCd;
					ss_formObj.provcCd = ss_provcCd;

					ss_formList.push(ss_formObj);
				});

				// ~ 연구 및 전문분야 입력 여부 체크

				// 자격증 보유 여부
				// 테이블 확인 후 진행

				// ~ 자격증 보유 여부

				// 기타교육
				var ot_formList = [];
				$('#ot_form').find('.form_contents').each(function(){
					var ot_trnngEduDegreeCd = $(this).find('input[name=ot_trnngEduDegreeCd]').val();
					var ot_iscedCd          = $(this).find('input[name=ot_iscedCd]').val();
					var ot_insttNm          = $(this).find('input[name=ot_insttNm]').val();
					var ot_addrProvcCd      = $(this).find('input[name=ot_addrProvcCd]').val();
					var ot_bgnDt_mm         = ($(this).find('input[name=ot_bgnDt_mm]').val() == "") ? "00" : $(this).find('input[name=ot_bgnDt_mm]').val();
					var ot_bgnDt_yy         = ($(this).find('input[name=ot_bgnDt_yy]').val() == "") ? "0000" : $(this).find('input[name=ot_bgnDt_yy]').val();
					var ot_endDt_mm         = ($(this).find('input[name=ot_endDt_mm]').val() == "") ? "00" : $(this).find('input[name=ot_endDt_mm]').val();
					var ot_endDt_yy         = ($(this).find('input[name=ot_endDt_yy]').val() == "") ? "0000" : $(this).find('input[name=ot_endDt_yy]').val();

					var ot_formObj = new Object();
					ot_formObj.trnngEduDegreeCd = ot_trnngEduDegreeCd;
					ot_formObj.iscedCd = ot_iscedCd;
					ot_formObj.insttNm = ot_insttNm;
					ot_formObj.addrProvcCd = ot_addrProvcCd;
					ot_formObj.bgnDt = ot_bgnDt_yy + "-" + ot_bgnDt_mm + "-01";
					ot_formObj.endDt = ot_endDt_yy + "-" + ot_endDt_mm + "-01";

					ot_formList.push(ot_formObj);
				});

				// ~ 기타 교육

				// 어학
				var langUseCd = $('#langUseCd').val();

				var rl_formList = [];

				$('.rl_form').each(function(){
					var rl_langNm = $(this).find('#rl_langNm').val();
					var rl_langLvlCd = $(this).find('input[name=rl_langLvlCd]').val();

					var rl_formObj = new Object();
					rl_formObj.langLvlCd = rl_langLvlCd;
					// 외국어명 컬럼이 없음.

					rl_formList.push(rl_formObj);
				});

				// ~ 어학

				// 경력
				var exp_formList = [];
				$('.exp_form').each(function(){
					//직급/직책 컬럼없음
					var exp_orgnzNm     = $(this).find('input[name=exp_orgnzNm]').val();
					var exp_iscoCd      = $(this).find('input[name=exp_iscoCd]').val();
					var exp_selfempYn   = $(this).find('input[name=exp_selfempYn]:checked').val();
					var exp_bgnDt_mm    = ($(this).find('input[name=exp_bgnDt_mm]').val() == "") ? "00" : $(this).find('input[name=exp_bgnDt_mm]').val();
					var exp_bgnDt_yy    = ($(this).find('input[name=exp_bgnDt_yy]').val() == "") ? "0000" : $(this).find('input[name=exp_bgnDt_yy]').val();
					var exp_endDt_mm    = ($(this).find('input[name=exp_endDt_mm]').val() == "") ? "00" : $(this).find('input[name=exp_endDt_mm]').val();
					var exp_endDt_yy    = ($(this).find('input[name=exp_endDt_yy]').val() == "") ? "0000" : $(this).find('input[name=exp_endDt_yy]').val();
					var exp_leaveReason = $(this).find('input[name=exp_leaveReason]').val();

					var exp_formObj = new Object();
					exp_formObj.orgnzNm = exp_orgnzNm;
					exp_formObj.iscoCd = exp_iscoCd;
					exp_formObj.selfempYn = exp_selfempYn;
					exp_formObj.bgnDt = exp_bgnDt_yy + "-" + exp_bgnDt_mm + "-01";
					exp_formObj.endDt = exp_endDt_yy + "-" + exp_endDt_mm + "-01";
					exp_formObj.leaveReason = exp_leaveReason;

					exp_formList.push(exp_formObj);
				});

				// ~ 경력

				// skill
				var sk_formList = [];
				$('.sk_form').find('input[name=sk_skillCd]:checked').each(function(){
					sk_formList.push($(this).val());
				});
				// ~ skill

				// 추천인
				var ref_formList = [];
				$('.ref_form').each(function(){
					var ref_nm       = $(this).find('input[name=ref_nm]').val();
					var ref_orgnzNm  = $(this).find('input[name=ref_orgnzNm]').val();
					var ref_position = $(this).find('input[name=ref_position]').val();
					var ref_ref      = $(this).find('input[name=ref_ref]').val();
					var ref_cell     = $(this).find('input[name=ref_cell]').val();
					var ref_email    = $(this).find('input[name=ref_email]').val();
					var ref_addrNm   = $(this).find('input[name=ref_addrNm]').val();
					var ref_addrCd   = $(this).find('input[name=ref_addrCd]').val();
					var ref_addrDtl  = $(this).find('input[name=ref_addrDtl]').val();

					var ref_formObj = new Object();

					ref_formObj.nm = ref_nm;
					ref_formObj.orgnzNm = ref_orgnzNm;
					ref_formObj.position = ref_position;
					ref_formObj.ref = ref_ref;
					ref_formObj.cell = ref_cell;
					ref_formObj.email = ref_email;
					ref_formObj.addrFullNm = ref_addrNm;
					ref_formObj.addrCd = ref_addrCd;
					ref_formObj.addrFullCd = ref_addrCd;
					ref_formObj.addrDtl = ref_addrDtl;


					ref_formList.push(ref_formObj);
				});
				// ~ 추천인

				// keyword
				var resumeKeyword = "";
				$('.resumeKeyword').each(function(){
					if(resumeKeyword == ""){
						resumeKeyword += $(this).val();
					}else{
						resumeKeyword += ',' + $(this).val();
					}
				});

				$.ajax({
					type: 'post',
					url: contextPath + "/cpes/private/resume/saveResumeUptOrCopyAjax.do",
					dataType: 'json',
					data: {
						"resumeSeq" : $('#resumeSeq').val(),
						"resumeTitle" : profile_title,
						"addrFullNm" : addrNm,
						"addrFullCd" : addrCd,
						"addrCd" : addrCd,
						"marriCd" : marriCd,
						"familyCnt" : familyCnt,
						"underAge15FamilyCnt" : underAge15FamilyCnt,
						"overAge64FamilyCnt" : overAge64FamilyCnt,
						"disablYn" : disablYn,
						"selfempYn" : selfempYn,
						"urgentJobseekYn" : urgentJobseekYn,
						"preferJobTitle" : preferJobTitle,
						"preferPosition" : preferPosition,
						"employFormCd" : employFormCd,
						"expctMinSalaryAmt" : expctMinSalaryAmt,
						"expctMaxSalaryAmt" : expctMaxSalaryAmt,
						"preferEmployTypeCd" : preferEmployTypeCd,
						"typeEmployHourDay" : typeEmployHourDay,
						"typeEmployDayWeek" : typeEmployDayWeek,
						"preferDayMon" : preferDayMon,
						"preferDayTue" : preferDayTue,
						"preferDayWed" : preferDayWed,
						"preferDayThu" : preferDayThu,
						"preferDayFri" : preferDayFri,
						"preferDaySat" : preferDaySat,
						"preferDaySun" : preferDaySun,
						"nightWorkYn" : nightWorkYn,
						"overTimeWorkYn" : overTimeWorkYn,
						"hldayWorkYn" : hldayWorkYn,
						"preferCrtctType" : preferCrtctType,
						"diffProvcWorkYn" : diffProvcWorkYn,
						"workBgnAbleYn" : workBgnAbleYn,
						"workBgnAbleWithin" : workBgnAbleWithin,
						"langUseCd" : langUseCd,
						"disableListStr" : JSON.stringify(disablOptionCdList),
						"hopeWorkLocListStr" : JSON.stringify(hopeWorkLocList),
						"genrlEduListStr" : eduDegreeCd,
						"specialStudyListStr" : JSON.stringify(ss_formList),
						"otherTrnngListStr" : JSON.stringify(ot_formList),
						"langListStr" : JSON.stringify(rl_formList),
						"workExpListStr" : JSON.stringify(exp_formList),
						"skillListStr" : JSON.stringify(sk_formList),
						"refManListStr" : JSON.stringify(ref_formList),
						"iscoCdListStr" : JSON.stringify(iscoList),
						"resumeKeyword" : resumeKeyword,
						"tempFlag" : "1", // 임시저장 여부 , xml에서 강제로 int로 인식함. 이유 확인불가
						"updateFlag" : $('#updateFlag').val()
					},
					success: function(data) {

						if(data.result == "Y"){
							alertify.alert(resumeTempInsertCompleteMsg, function (e){
								location.href = contextPath + "/cpes/private/resume/list.do";
							});
						}else if(data.result == "FULL"){
							alertify.alert(resumeFullInsertMsg, function (e){
								location.href = contextPath + "/cpes/private/resume/list.do";
							});
						}else{
							alertify.alert(resumeInsertErrorMsg);
						}

					},
					error: function(xhr, status, error) {
						alertify.alert(resumeInsertErrorMsg);
					}
				});
    		});

		});

    	// data-clickFlag가 true 이면 클릭 처리
    	function setClickEvent(){
    		$('input').each(function(){
    			if($(this).data('clickflag') == true){
        			$(this).click();
        		}
    		});
    	}

    	function fnIscoSet(json){
    		var iscoHtml = '<span class="bbs_add">' + json.commonNm + '<input type="hidden" class="iscoCd" name="iscoCd" value="' + json.commonCd + '"/>';
    		iscoHtml += '<button type="button" class="delete">delete</button></span>';
			$('#span_isco').append(iscoHtml);
			$('#span_isco').closest('.form_element').addClass('active');
			fnScriptReset();
    	}

	</script>
<main class="colgroup" id="colgroup">
	<article>
		<header class="sub_head">
			<div class="sub_title">
				<h2>
					<c:choose>
						<c:when test="${updateFlag eq 'copy'}">
							<span><spring:message code="resume.text.resumeInsert"/></span>
						</c:when>
						<c:otherwise>
							<span><spring:message code="resume.text.resumeUpdate"/></span>
						</c:otherwise>
					</c:choose>
				</h2>
			</div>
		</header>

		<div id="contents" class="resumeUpdate">
			<input type="hidden" id="resumeSeq" name="resumeSeq" value="${resumeDetail.resumeSeq }">
			<input type="hidden" id="updateFlag" name="updateFlag" value="${updateFlag}">
			<c:choose>
				<c:when test="${not empty resumeDetail.resumeTitle}">
					<div class="profile_title active">
				</c:when>
				<c:otherwise>
					<div class="profile_title">
				</c:otherwise>
			</c:choose>
				<label for="profile_title">Please input your CV Title</label>
				<input type="text" id="profile_title" name="resumeTitle" maxlength="500" value="${resumeDetail.resumeTitle }"/>
			</div>

			<div class="profile_box">
				<div class="img_box"><!-- 등록된 사진이 있는 경우 주석 사용 -->
					<button type="button" class="photo add_photo">Add Photo</button>
					<!-- <img src="../../images/board/dummy_photo.png" alt="" class="photo" />
					<button type="button" class="modify_photo">Modify Photo</button> -->
				</div>
				<div class="contents_box">
					<div class="title_box">
						<strong class="title"><c:out value="${memberBean.userNmKh }" escapeXml="false"/></strong>
					</div>
					<div class="cont_box">
						<ul class="clearfix">
						<li>
							<div class="cont">
								<strong class="title">email</strong>
								<span class="con"><c:out value="${memberBean.userEmail }" escapeXml="false"/></span>
							</div>
						</li>
						<li>
							<div class="cont">
								<strong class="title">Mobile</strong>
								<span class="con"><c:out value="${memberBean.userCell }" escapeXml="false"/></span>
							</div>
						</li>
						<li>
							<div class="cont">
								<strong class="title">address</strong>
								<span class="con">
									<address>
										<c:out value="${memberBean.addrCdNm }" escapeXml="false"/>
										<c:out value="${memberBean.addrDtl }" escapeXml="false"/>
									</address>
								</span>
							</div>
						</li>
						<li>
							<div class="cont">
								<a href="" class="btn check noround">Change Personal Info</a>
							</div>
						</li>
						</ul>
					</div>
				</div>
			</div>
			<!-- //profile_box -->

			<div class="form_wrap active">
				<div class="form_title">
					<h3><span class="bbs_ico necessary">Necessary</span> <spring:message code="resume.text.personalInformation"/></h3>
					<span class="cont"><span class="exactly y">necessary</span>Necessary</span>
					<button type="button" class="open">open for contents view</button>
				</div>
				<!-- //form_title -->
				<div class="form_contents">
					<div class="form_box">
						<c:choose>
							<c:when test="${not empty resumeDetail.addrFullCd && not empty resumeDetail.addrFullNm}">
								<div class="form_element pick active" id="addr">
							</c:when>
							<c:otherwise>
								<div class="form_element pick" id="addr">
							</c:otherwise>
						</c:choose>

							<div class="view_area">
								<span class="label"><spring:message code="resume.text.placeOfBirth"/></span>
								<span class="text_box">
									<c:if test="${not empty resumeDetail.addrFullCd && not empty resumeDetail.addrFullNm}">
										<span><c:out value="${resumeDetail.addrFullNm}" escapeXml="false"/><input type='hidden' name="addrNm" value="${resumeDetail.addrFullNm}"/>
										<input type='hidden' name="addrCd" value="${resumeDetail.addrFullCd}"/><button type='button'>delete</button></span>
									</c:if>
								</span>
							</div>
							<button type="button" class="open" title="Open selection box"><span>Location Selection</span></button>
							<div class="popup_box ">
								<div class="bbs_popup"><!-- 팝업 가로, 세로 지정하지 않았습니다. 필요에 딸라 지정해서 사용 -->
									<section class="box_wrap">
										<div class="title_box">
											<h1 class="title">Location Selection</h1>
										</div>
										<div class="contents_box">
											<div class="pop_scroll_box count4"><!-- 한줄에 들어갈 개수 변경해야 할 경우 클래스 count2 ~ count5 추가 -->
												<ul class="clearfix">
													<li class="dep1">
														<div class="scroll_box">
															<div class="scroll_title">
																<strong>Province</strong>
															</div>
															<div class="scroll_cont">
																<ul>
																	<c:forEach items="${locCdList }" var="locCd">
																		<li>
																			<button type="button" class="selectRow" value="${locCd.lvlCd }"><c:out value="${locCd.nm }" escapeXml="false"/></button>
																		</li>
																	</c:forEach>
																</ul>
															</div>
														</div>
													</li>
													<li class="dep1">
														<div class="scroll_box">
															<div class="scroll_title">
																<strong>District</strong>
															</div>
															<div class="scroll_cont">
																<ul>

																</ul>
															</div>
														</div>
													</li>
													<li class="dep1">
														<div class="scroll_box">
															<div class="scroll_title">
																<strong>Commune</strong>
															</div>
															<div class="scroll_cont">
																<ul>

																</ul>
															</div>
														</div>
													</li>
													<li class="dep1">
														<div class="scroll_box">
															<div class="scroll_title">
																<strong>Village</strong>
															</div>
															<div class="scroll_cont">
																<ul>

																</ul>
															</div>
														</div>
													</li>
												</ul>
											</div>
											<div class="button_box">
												<button type="button" class="bbs_btn save">Select</button>
												<button type="button" class="bbs_btn cancel">Cancel</button>
											</div>
											<button type="button" class="close">close of popup</button>
										</div>
									</section>
								</div>
							</div>
						</div>
					</div>
				<!-- //form_box -->

					<div class="form_box count3">
						<c:choose>
							<c:when test="${not empty resumeDetail.marriCd }">
								<div class="form_element select active">
							</c:when>
							<c:otherwise>
								<div class="form_element select">
							</c:otherwise>
						</c:choose>
							<div class="view_area">
								<span class="label"><spring:message code="resume.text.maritalStatus"/></span>
								<button type="button" class="text_box open" title="Open selection box">
									<c:choose>
										<c:when test="${not empty resumeDetail.marriCd }">
											<span><c:out value="${resumeDetail.marriCdNm}" escapeXml="false"/></span>
										</c:when>
										<c:otherwise>
											<span>Open</span>
										</c:otherwise>
									</c:choose>
									<input type="hidden" id="marriCd" name="marriCd" value="${resumeDetail.marriCd }">
								</button>
							</div>
							<div class="select_box">
								<ul class="clearfix">
									<c:forEach items="${maritaStatusIdList }" var="maritaStatus">
										<li>
											<button type="button" value="${maritaStatus.dtlCd }">
												<span><c:out value="${maritaStatus.cdNm }" escapeXml="false"/></span>
											</button>
										</li>
									</c:forEach>
									<!-- <li><button type="button" class="ohter"><span>기타</span></button></li> -->
								</ul>
							</div>
						</div>
						<div class="form_element input other_child">
							<div class="view_area">
								<label for="" class="label">Others</label>
								<input type="text" id="" class="text_box" />
							</div>
						</div>
					</div>
				<!-- //form_box -->

					<div class="form_box count3">
						<c:choose>
							<c:when test="${not empty resumeDetail.familyCnt }">
								<div class="form_element input active">
							</c:when>
							<c:otherwise>
								<div class="form_element input">
							</c:otherwise>
						</c:choose>

							<div class="view_area">
								<label for="" class="label"><spring:message code="resume.text.insertFamilyCnt"/></label>
								<input type="text" id="familyCnt" class="text_box inputNo" name="familyCnt" value="${resumeDetail.familyCnt }"/>
							</div>
						</div>
						<c:choose>
							<c:when test="${not empty resumeDetail.underAge15FamilyCnt }">
								<div class="form_element input active">
							</c:when>
							<c:otherwise>
								<div class="form_element input">
							</c:otherwise>
						</c:choose>
							<div class="view_area">
								<label for="" class="label"><spring:message code="resume.text.insertUnderAge15"/></label>
								<input type="text" id="underAge15FamilyCnt" class="text_box inputNo" name="underAge15FamilyCnt" value="${resumeDetail.underAge15FamilyCnt }"/>
							</div>
						</div>
						<c:choose>
							<c:when test="${not empty resumeDetail.overAge64FamilyCnt }">
								<div class="form_element input active">
							</c:when>
							<c:otherwise>
								<div class="form_element input">
							</c:otherwise>
						</c:choose>
							<div class="view_area">
								<label for="" class="label"><spring:message code="resume.text.insertOverAge65"/></label>
								<input type="text" id="overAge64FamilyCnt" class="text_box inputNo" name="overAge64FamilyCnt" value="${resumeDetail.overAge64FamilyCnt }"/>
							</div>
						</div>
					</div>
				<!-- //form_box -->

					<div class="form_box">
						<div class="form_element check">
							<div class="view_area">
								<span class="label">해당하는 사항이 있다면 체크해주세요.</span>
								<span class="text_box"></span>
							</div>
							<div class="check_box">
								<ul class="clearfix">
								<li>
									<span>
										<input type="checkbox" id="checkbox01_1"/>
										<label for="checkbox01_1">첫 구직활동</label>
									</span>
								</li>
								<li>
									<span>
										<input type="checkbox" id="checkbox01_2" />
										<label for="checkbox01_2">학교나 대학교에서 공부</label>
									</span>
								</li>
								<li>
									<span>
										<input type="checkbox" id="checkbox01_3" />
										<label for="checkbox01_3">해외 근무 후 귀국한 사람</label>
									</span>
								</li>
								<li>
									<span>
										<input type="checkbox" id="checkbox01_4" />
										<label for="checkbox01_4">이전 서비스를 이용</label>
									</span>
								</li>
								<li>
									<span>
										<input type="checkbox" id="checkbox01_5" />
										<label for="checkbox01_5">소수 민족</label>
									</span>
								</li>
								</ul>
							</div>
						</div>
					</div>
				<!-- //form_box -->

					<div class="form_box">
						<div class="form_element select have_child">
							<div class="view_area">
								<span class="label"><spring:message code="resume.text.insertDisabl"/></span>
								<button type="button" class="text_box open" title="Open selection box">
									<span>Open</span>
								</button>
							</div>
							<div class="select_box">
								<ul class="clearfix">
								<li>
									<span>
										<input type="radio" name="disablYn" class="have" id="radio01_1" value="Y" <c:if test="${resumeDetail.disablYn eq 'Y' }">data-clickflag="true"</c:if>/>
										<label for="radio01_1">Yes</label>
									</span>
								</li>
								<li>
									<span>
										<input type="radio" name="disablYn" class="no_have" id="radio01_2" value="N" <c:if test="${resumeDetail.disablYn eq 'N' }">data-clickflag="true"</c:if>/>
										<label for="radio01_2">No</label>
									</span>
								</li>
								</ul>
							</div>
						</div>
						<div class="child_form">
							<div class="form_element check">
								<div class="view_area">
									<span class="label">Please check any disabilities</span>
									<span class="text_box">

									</span>
								</div>
								<div class="check_box count4">
									<ul class="clearfix">
										<c:forEach items="${disablOptionCdList }" var="disablOptionCd">
											<c:choose>
												<c:when test="${empty disableList }">
													<li>
														<span>
															<input type="checkbox" name="disablOptionCd" id="disablOptionCd${disablOptionCd.dtlCd }" value="${disablOptionCd.dtlCd }"/>
															<label for="disablOptionCd${disablOptionCd.dtlCd }"><c:out value="${disablOptionCd.cdNm }" escapeXml="false"/></label>
														</span>
													</li>
												</c:when>
												<c:otherwise>
													<c:set var="disablFlag" value="false" />
													<c:forEach items="${disableList }" var="disable">
														<c:if test="${disablOptionCd.dtlCd eq disable.disableCd }">
															<c:set var="disablFlag" value="true" />
														</c:if>
													</c:forEach>

													<c:choose>
														<c:when test="${disablFlag eq 'true'}">
															<li>
																<span>
																	<input type="checkbox" name="disablOptionCd" id="disablOptionCd${disablOptionCd.dtlCd }" value="${disablOptionCd.dtlCd }" data-clickflag="true"/>
																	<label for="disablOptionCd${disablOptionCd.dtlCd }"><c:out value="${disablOptionCd.cdNm }" escapeXml="false"/></label>
																</span>
															</li>
														</c:when>
														<c:otherwise>
															<li>
																<span>
																	<input type="checkbox" name="disablOptionCd" id="disablOptionCd${disablOptionCd.dtlCd }" value="${disablOptionCd.dtlCd }"/>
																	<label for="disablOptionCd${disablOptionCd.dtlCd }"><c:out value="${disablOptionCd.cdNm }" escapeXml="false"/></label>
																</span>
															</li>
														</c:otherwise>
													</c:choose>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
					</div>
				<!-- //form_box -->

					<div class="form_box count2">
						<c:choose>
							<c:when test="${not empty resumeDetail.selfempYn}">
								<div class="form_element select active">
							</c:when>
							<c:otherwise>
								<div class="form_element select">
							</c:otherwise>
						</c:choose>
							<div class="view_area">
								<span class="label"><spring:message code="resume.text.insertSelfemp"/></span>
								<button type="button" class="text_box open" title="Open selection box">
									<c:choose>
										<c:when test="${resumeDetail.selfempYn eq 'Y' }">
											<span>Yes</span>
										</c:when>
										<c:when test="${resumeDetail.selfempYn eq 'N' }">
											<span>No</span>
										</c:when>
										<c:otherwise>
											<span>Open</span>
										</c:otherwise>
									</c:choose>
								</button>
							</div>
							<div class="select_box">
								<ul class="clearfix">
								<li>
									<span>
										<input type="radio" name="selfempYn" id="radio02_1" value="Y" <c:if test="${resumeDetail.selfempYn eq 'Y' }">checked="checked"</c:if>/>
										<label for="radio02_1">Yes</label>
									</span>
								</li>
								<li>
									<span>
										<input type="radio" name="selfempYn" id="radio02_2" value="N" <c:if test="${resumeDetail.selfempYn eq 'N' }">checked="checked"</c:if>/>
										<label for="radio02_2">No</label>
									</span>
								</li>
								</ul>
							</div>
						</div>
					</div>
				<!-- //form_box -->

					<div class="form_box count2">
						<c:choose>
							<c:when test="${not empty resumeDetail.urgentJobseekYn}">
								<div class="form_element select active">
							</c:when>
							<c:otherwise>
								<div class="form_element select">
							</c:otherwise>
						</c:choose>
							<div class="view_area">
								<span class="label"><spring:message code="resume.text.insertUrgentJobseek"/></span>
								<button type="button" class="text_box open" title="Open selection box">
									<c:choose>
										<c:when test="${resumeDetail.urgentJobseekYn eq 'Y' }">
											<span>Yes</span>
										</c:when>
										<c:when test="${resumeDetail.urgentJobseekYn eq 'N' }">
											<span>No</span>
										</c:when>
										<c:otherwise>
											<span>Open</span>
										</c:otherwise>
									</c:choose>
								</button>
							</div>
							<div class="select_box">
								<ul class="clearfix">
								<li>
									<span>
										<input type="radio" name="urgentJobseekYn" id="radio03_1"  value="Y" <c:if test="${resumeDetail.urgentJobseekYn eq 'Y' }">checked="checked"</c:if>/>
										<label for="radio03_1">Yes</label>
									</span>
								</li>
								<li>
									<span>
										<input type="radio" name="urgentJobseekYn" id="radio03_2"  value="N" <c:if test="${resumeDetail.urgentJobseekYn eq 'N' }">checked="checked"</c:if>/>
										<label for="radio03_2">No</label>
									</span>
								</li>
								</ul>
							</div>
						</div>
					</div>
				<!-- //form_box -->
				</div>
			<!-- //form_contents -->
			</div>
			<!-- //form_wrap -->

			<div class="form_wrap">
				<div class="form_title">
					<h3><span class="bbs_ico necessary">Necessary</span> <spring:message code="resume.text.workingConditions"/></h3>
					<button type="button" class="open">open for contents view</button>
				</div>
				<div class="form_contents">
					<div class="form_box count3">
						<c:choose>
							<c:when test="${not empty resumeDetail.preferJobTitle}">
								<div class="form_element input active">
							</c:when>
							<c:otherwise>
								<div class="form_element input">
							</c:otherwise>
						</c:choose>

							<div class="view_area">
								<label for="" class="label"><spring:message code="resume.text.preferJobTitle"/></label>
								<input type="text" id="preferJobTitle" name="preferJobTitle" class="text_box" maxlength="150" value="${resumeDetail.preferJobTitle}"/>
							</div>
						</div>
						<c:choose>
							<c:when test="${not empty resumeDetail.preferPosition}">
								<div class="form_element input active">
							</c:when>
							<c:otherwise>
								<div class="form_element input">
							</c:otherwise>
						</c:choose>
							<div class="view_area">
								<label for="" class="label"><spring:message code="resume.text.preferPosition"/></label>
								<input type="text" id="preferPosition" name="preferPosition" class="text_box" maxlength="50" value="${resumeDetail.preferPosition}"/>
							</div>
						</div>
					</div>
					<!-- //form_box -->

					<div class="form_box">
						<c:choose>
							<c:when test="${not empty iscoList}">
								<div class="form_element pick active">
							</c:when>
							<c:otherwise>
								<div class="form_element pick">
							</c:otherwise>
						</c:choose>
							<div class="view_area">
								<span class="label"><spring:message code="resume.text.hopeJob"/></span>
								<span class="text_box" id="span_isco">
									<c:forEach items="${iscoList }" var="iscoCd">
										<span>
											<c:out value="${iscoCd.iscoCdNm }" escapeXml="false"/>
											<input type="hidden" class="iscoCd" name="iscoCd" value="${iscoCd.iscoCd}"/>
											<button type="button" class="delete">delete</button>
										</span>
									</c:forEach>
								</span>
							</div>
							<button type="button" class="open popup_isco" onclick="callback(fnIscoSet, 'isco');" title="Open selection box"><span>Occupation Selection</span></button>
							<!-- <div class="popup_box">
								<div class="bbs_popup">
									<section class="box_wrap">
										<div class="title_box">
											<h1 class="title">Occupation Selection</h1>
										</div>
										<div class="contents_box">
											<div class="pop_scroll_box count4">
												<ul class="clearfix">
													<li class="dep1">
														<div class="scroll_box">
															<div class="scroll_title">
																<strong>Province</strong>
															</div>
															<div class="scroll_cont">
																<ul>

																</ul>
															</div>
														</div>
													</li>
													<li class="dep1">
														<div class="scroll_box">
															<div class="scroll_title">
																<strong>District</strong>
															</div>
															<div class="scroll_cont">
																<ul>
																</ul>
															</div>
														</div>
													</li>
													<li class="dep1">
														<div class="scroll_box">
															<div class="scroll_title">
																<strong>Commune</strong>
															</div>
															<div class="scroll_cont">
																<ul>
																</ul>
															</div>
														</div>
													</li>
													<li class="dep1">
														<div class="scroll_box">
															<div class="scroll_title">
																<strong>Village</strong>
															</div>
															<div class="scroll_cont">
																<ul>
																</ul>
															</div>
														</div>
													</li>
												</ul>
											</div>
											<div class="button_box">
												<button type="button" class="bbs_btn save">Select</button>
												<button type="button" class="bbs_btn cancel">Cancel</button>
											</div>
											<button type="button" class="close">close of popup</button>
										</div>
									</section>
								</div>
							</div> -->
						</div>
					</div>
			<!-- //form_box -->

					<div class="form_box">
						<c:choose>
							<c:when test="${not empty hopeWorkLocList }">
								<div class="form_element pick active" id="hopeLoc">
							</c:when>
							<c:otherwise>
								<div class="form_element pick" id="hopeLoc">
							</c:otherwise>
						</c:choose>

							<div class="view_area">
								<span class="label"><spring:message code="resume.text.hopeLocCd"/></span>
								<span class="text_box">
									<c:forEach items="${hopeWorkLocList }" var="hopeWork">
										<span><c:out value="${hopeWork.addrCdNm}" escapeXml="false"/><input type='hidden' name="hopeLocNm" value="${hopeWork.addrFullNm}"/>
										<input type='hidden' name="hopeLocCd" value="${hopeWork.addrFullCd}"/><button type='button'>delete</button></span>
									</c:forEach>
								</span>
							</div>
							<button type="button" class="open" title="Open selection box"><span>Location Selection</span></button>
							<div class="popup_box">
								<div class="bbs_popup"><!-- 팝업 가로, 세로 지정하지 않았습니다. 필요에 딸라 지정해서 사용 -->
									<section class="box_wrap">
										<div class="title_box">
											<h1 class="title">Location Selection</h1>
										</div>
										<div class="contents_box">
											<div class="pop_scroll_box count4"><!-- 한줄에 들어갈 개수 변경해야 할 경우 클래스 count2 ~ count5 추가 -->
												<ul class="clearfix">
													<li class="dep1">
														<div class="scroll_box">
															<div class="scroll_title">
																<strong>Province</strong>
															</div>
															<div class="scroll_cont">
																<ul>
																	<c:forEach items="${locCdList }" var="locCd">
																		<li>
																			<button type="button" class="selectRow" value="${locCd.lvlCd }"><c:out value="${locCd.nm }" /></button>
																		</li>
																	</c:forEach>
																</ul>
															</div>
														</div>
													</li>
													<li class="dep1">
														<div class="scroll_box">
															<div class="scroll_title">
																<strong>District</strong>
															</div>
															<div class="scroll_cont">
																<ul>
																</ul>
															</div>
														</div>
													</li>
													<li class="dep1">
														<div class="scroll_box">
															<div class="scroll_title">
																<strong>Commune</strong>
															</div>
															<div class="scroll_cont">
																<ul>
																</ul>
															</div>
														</div>
													</li>
													<li class="dep1">
														<div class="scroll_box">
															<div class="scroll_title">
																<strong>Village</strong>
															</div>
															<div class="scroll_cont">
																<ul>
																</ul>
															</div>
														</div>
													</li>
												</ul>
											</div>
											<div class="button_box">
												<button type="button" class="bbs_btn save">Select</button>
												<button type="button" class="bbs_btn cancel">Cancel</button>
											</div>
											<button type="button" class="close">close of popup</button>
										</div>
									</section>
								</div>
							</div>
						</div>
					</div>
			<!-- //form_box -->

					<div class="form_box count3">
						<c:choose>
							<c:when test="${not empty resumeDetail.employFormCd}">
								<div class="form_element select active">
							</c:when>
							<c:otherwise>
								<div class="form_element select">
							</c:otherwise>
						</c:choose>
							<div class="view_area">
								<span class="label"><spring:message code="resume.text.employFormCd"/></span>
								<button type="button" class="text_box open" title="Open selection box">
									<c:choose>
										<c:when test="${not empty resumeDetail.employFormCd}">
											<span><c:out value="${resumeDetail.employFormCdNm}" escapeXml="false"/></span>
										</c:when>
										<c:otherwise>
											<span>Open</span>
										</c:otherwise>
									</c:choose>
									<input type="hidden" id="employFormCd" name="employFormCd" value="${resumeDetail.employFormCd}">
								</button>
							</div>
							<div class="select_box">
								<ul class="clearfix">
									<c:forEach items="${employmentFormList }" var="employmentForm">
										<li>
											<button type="button" value="${employmentForm.dtlCd }">
												<span><c:out value="${employmentForm.cdNm }" escapeXml="false"/></span>
											</button>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
			<!-- //form_box -->

					<div class="form_box">
						<%-- <c:choose>
							<c:when test="${not empty resumeDetail.preferEmployTypeCd }">
								<div class="form_element select have_child active">
							</c:when>
							<c:otherwise>
								<div class="form_element select have_child">
							</c:otherwise>
						</c:choose> --%>
						<div class="form_element select have_child">
							<div class="view_area">
								<span class="label"><spring:message code="resume.text.preferEmployTypeCd"/></span>
								<button type="button" class="text_box open" title="Open selection box">
									<%-- <c:choose>
										<c:when test="${not empty resumeDetail.preferEmployTypeCdNm }">
											<span><c:out value="${resumeDetail.preferEmployTypeCdNm}" /></span>
										</c:when>
										<c:otherwise>
											<span>Open</span>
										</c:otherwise>
									</c:choose> --%>
									<span>Open</span>
								</button>
							</div>
							<div class="select_box">
								<ul class="clearfix">
									<c:forEach items="${preferEmploymtTypeCdList}" var="preferEmploymtTypeCd">
										<li>
											<span>
												<!-- partTime 일 경우 근무시간 및 근무 일수 노출을 위해  분기처리 -->
												<c:choose>
													<c:when test="${preferEmploymtTypeCd.dtlCd eq 'PET0000000001'}">
														<input type="radio" name="preferEmployTypeCd" class="no_have" id="preferEmploymtTypeCd${preferEmploymtTypeCd.dtlCd}" value="${preferEmploymtTypeCd.dtlCd }" <c:if test="${resumeDetail.preferEmployTypeCd eq preferEmploymtTypeCd.dtlCd }">data-clickflag="true"</c:if>/>
													</c:when>
													<c:otherwise>
														<input type="radio" name="preferEmployTypeCd" class="have" id="preferEmploymtTypeCd${preferEmploymtTypeCd.dtlCd}" value="${preferEmploymtTypeCd.dtlCd }" <c:if test="${resumeDetail.preferEmployTypeCd eq preferEmploymtTypeCd.dtlCd }">data-clickflag="true"</c:if>/>
													</c:otherwise>
												</c:choose>
												<label for="preferEmploymtTypeCd${preferEmploymtTypeCd.dtlCd}"><c:out value="${preferEmploymtTypeCd.cdNm}" escapeXml="false"/></label>
											</span>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>

						<div class="child_form">
							<c:choose>
								<c:when test="${not empty resumeDetail.typeEmployHourDay}">
									<div class="form_element input count3 active">
								</c:when>
								<c:otherwise>
									<div class="form_element input count3">
								</c:otherwise>
							</c:choose>
								<div class="view_area">
									<label for="" class="label"><spring:message code="resume.text.typeEmployHourDay"/></label>
									<input type="text" id="typeEmployHourDay" name="typeEmployHourDay" class="text_box inputTime" maxlength="2" value="${resumeDetail.typeEmployHourDay}"/>
								</div>
							</div>
							<c:choose>
								<c:when test="${not empty resumeDetail.typeEmployDayWeek}">
									<div class="form_element input count3 active">
								</c:when>
								<c:otherwise>
									<div class="form_element input count3">
								</c:otherwise>
							</c:choose>
								<div class="view_area">
									<label for="" class="label"><spring:message code="resume.text.typeEmployDayWeek"/></label>
									<input type="text" id="typeEmployDayWeek" name="typeEmployDayWeek" class="text_box inputWeek" maxlength="1" value="${resumeDetail.typeEmployDayWeek}"/>
								</div>
							</div>
							<div class="form_element check">
								<div class="view_area">
									<span class="label"><spring:message code="resume.text.hopeWorkDay"/></span>
									<span class="text_box"></span>
								</div>
								<div class="check_box">
									<ul class="clearfix">
									<li>
										<span>
											<input type="checkbox" id="preferDayMon" name="preferDayMon" value="Y" <c:if test="${resumeDetail.preferDayMon eq 'Y' }">data-clickflag="true"</c:if>/>
											<label for="preferDayMon">Monday</label>
										</span>
									</li>
									<li>
										<span>
											<input type="checkbox" id="preferDayTue" name="preferDayTue" value="Y" <c:if test="${resumeDetail.preferDayTue eq 'Y' }">data-clickflag="true"</c:if>/>
											<label for="preferDayTue">Tuesday</label>
										</span>
									</li>
									<li>
										<span>
											<input type="checkbox" id="preferDayWed" name="preferDayWed" value="Y" <c:if test="${resumeDetail.preferDayWed eq 'Y' }">data-clickflag="true"</c:if>/>
											<label for="preferDayWed">Wednesday</label>
										</span>
									</li>
									<li>
										<span>
											<input type="checkbox" id="preferDayThu" name="preferDayThu" value="Y" <c:if test="${resumeDetail.preferDayThu eq 'Y' }">data-clickflag="true"</c:if>/>
											<label for="preferDayThu">Thursday</label>
										</span>
									</li>
									<li>
										<span>
											<input type="checkbox" id="preferDayFri" name="preferDayFri" value="Y" <c:if test="${resumeDetail.preferDayFri eq 'Y' }">data-clickflag="true"</c:if>/>
											<label for="preferDayFri">Friday</label>
										</span>
									</li>
									<li>
										<span>
											<input type="checkbox" id="preferDaySat" name="preferDaySat" value="Y" <c:if test="${resumeDetail.preferDaySat eq 'Y' }">data-clickflag="true"</c:if>/>
											<label for="preferDaySat">Saturday</label>
										</span>
									</li>
									<li>
										<span>
											<input type="checkbox" id="preferDaySun" name="preferDaySun" value="Y" <c:if test="${resumeDetail.preferDaySun eq 'Y' }">data-clickflag="true"</c:if>/>
											<label for="preferDaySun">Sunday</label>
										</span>
									</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
			<!-- //form_box -->

					<div class="form_box count3">
						<c:choose>
							<c:when test="${not empty resumeDetail.preferCrtctType }">
								<div class="form_element select have_child active">
							</c:when>
							<c:otherwise>
								<div class="form_element select have_child">
							</c:otherwise>
						</c:choose>
							<div class="view_area">
								<span class="label"><spring:message code="resume.text.preferCrtctType"/></span>
								<button type="button" class="text_box open" title="Open selection box">
									<c:choose>
										<c:when test="${not empty resumeDetail.preferCrtctTypeNm }">
											<span><c:out value="${resumeDetail.preferCrtctTypeNm}" escapeXml="false"/></span>
										</c:when>
										<c:otherwise>
											<span>Open</span>
										</c:otherwise>
									</c:choose>
								</button>
							</div>
							<div class="select_box">
								<ul class="clearfix">
									<c:forEach items="${termOfEmploymentContractList }" var="termOfEmploymentContract">
										<li>
											<span>
												<input type="radio" name="preferCrtctType" id="termOfEmploymentContract${termOfEmploymentContract.dtlCd}" value="${termOfEmploymentContract.dtlCd}" <c:if test="${resumeDetail.preferCrtctType eq termOfEmploymentContract.dtlCd }">checked="checked"</c:if>/>
												<label for="termOfEmploymentContract${termOfEmploymentContract.dtlCd}"><c:out value="${termOfEmploymentContract.cdNm }" escapeXml="false"/></label>
											</span>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
			<!-- //form_box -->

					<div class="form_box">
						<div class="form_element check">
							<div class="view_area">
								<span class="label"><spring:message code="resume.text.overtimeAvailability"/></span>
								<span class="text_box">
									<c:if test="">

									</c:if>
								</span>
							</div>
							<div class="check_box">
								<ul class="clearfix">
								<li>
									<span>
										<input type="checkbox" id="nightWorkYn" name="nightWorkYn" value="Y" <c:if test="${resumeDetail.nightWorkYn eq 'Y' }">data-clickflag="true"</c:if> />
										<label for="nightWorkYn">Night shift(pm 10:00~am 05:00)</label>
									</span>
								</li>
								<li>
									<span>
										<input type="checkbox" id="overTimeWorkYn" name="overTimeWorkYn" value="Y" <c:if test="${resumeDetail.overTimeWorkYn eq 'Y' }">data-clickflag="true"</c:if>/>
										<label for="overTimeWorkYn">Overtime</label>
									</span>
								</li>
								<li>
									<span>
										<input type="checkbox" id="hldayWorkYn" name="hldayWorkYn" value="Y" <c:if test="${resumeDetail.hldayWorkYn eq 'Y' }">data-clickflag="true"</c:if>/>
										<label for="hldayWorkYn">Work on Sunday/Public Holidays</label>
									</span>
								</li>
								</ul>
							</div>
						</div>
					</div>
			<!-- //form_box -->

					<div class="form_box count3_half">
						<c:choose>
							<c:when test="${not empty resumeDetail.expctMinSalaryAmt}">
								<div class="form_element input active">
							</c:when>
							<c:otherwise>
								<div class="form_element input">
							</c:otherwise>
						</c:choose>

							<div class="view_area">
								<label for="" class="label"><spring:message code="resume.text.expctSalaryAmt"/></label>
								<input type="text" id="expctMinSalaryAmt" name="expctMinSalaryAmt inputNo" class="text_box" value="${resumeDetail.expctMinSalaryAmt}"/>
							</div>
						</div>
						<span class="form_element">~</span>
						<c:choose>
							<c:when test="${not empty resumeDetail.expctMaxSalaryAmt}">
								<div class="form_element input active">
							</c:when>
							<c:otherwise>
								<div class="form_element input">
							</c:otherwise>
						</c:choose>
							<div class="view_area">
								<label for="" class="label"><spring:message code="resume.text.expctSalaryAmt"/></label>
								<input type="text" id="expctMaxSalaryAmt" name="expctMaxSalaryAmt inputNo" class="text_box" value="${resumeDetail.expctMaxSalaryAmt}"/>
							</div>
						</div>
					</div>
			<!-- //form_box -->

					<div class="form_box count3">
						<c:choose>
							<c:when test="${not empty resumeDetail.diffProvcWorkYn}">
								<div class="form_element select have_child active">
							</c:when>
							<c:otherwise>
								<div class="form_element select have_child">
							</c:otherwise>
						</c:choose>

							<div class="view_area">
								<span class="label"><spring:message code="resume.text.diffProvcWork"/></span>
								<button type="button" class="text_box open" title="Open selection box">
									<c:choose>
										<c:when test="${resumeDetail.diffProvcWorkYn eq 'Y' }">
											<span>Yes</span>
										</c:when>
										<c:when test="${resumeDetail.diffProvcWorkYn eq 'N' }">
											<span>No</span>
										</c:when>
										<c:otherwise>
											<span>Open</span>
										</c:otherwise>
									</c:choose>
								</button>
							</div>
							<div class="select_box">
								<ul class="clearfix">
								<li>
									<span>
										<input type="radio" name="diffProvcWorkYn" id="radio06_1" value="Y" <c:if test="${resumeDetail.diffProvcWorkYn eq 'Y' }">checked="checked"</c:if>/>
										<label for="radio06_1">Yes</label>
									</span>
								</li>
								<li>
									<span>
										<input type="radio" name="diffProvcWorkYn" id="radio06_2" value="N" <c:if test="${resumeDetail.diffProvcWorkYn eq 'N' }">checked="checked"</c:if>/>
										<label for="radio06_2">No</label>
									</span>
								</li>
								</ul>
							</div>
						</div>
					</div>
			<!-- //form_box -->

					<div class="form_box count3">
						<div class="form_element select">
							<div class="view_area">
								<span class="label"><spring:message code="resume.text.workBgnAble"/></span>
								<button type="button" class="text_box open" title="Open selection box">
									<span>Open</span>
								</button>
							</div>
							<div class="select_box">
								<ul class="clearfix">
								<li>
									<span>
										<input type="radio" name="workBgnAbleYn" id="radio07_1" value="Y" <c:if test="${resumeDetail.workBgnAbleYn eq 'Y' }">data-clickflag="true"</c:if>/>
										<label for="radio07_1"><spring:message code="resume.text.workBgnAbleY"/></label>
									</span>
								</li>
								<li>
									<span>
										<input type="radio" name="workBgnAbleYn" class="ohter" id="radio07_2" value="N" <c:if test="${resumeDetail.workBgnAbleYn eq 'N' }">data-clickflag="true"</c:if>/>
										<label for="radio07_2"><spring:message code="resume.text.workBgnAbleN"/></label>
									</span>
								</li>
								</ul>
							</div>
						</div>
						<c:choose>
							<c:when test="${not empty resumeDetail.workBgnAbleWithin}">
								<div class="form_element input other_child active">
							</c:when>
							<c:otherwise>
								<div class="form_element input other_child">
							</c:otherwise>
						</c:choose>

							<div class="view_area">
								<label for="" class="label">Months</label>
								<input type="text" id="workBgnAbleWithin" name="workBgnAbleWithin" class="text_box inputNo" value="${resumeDetail.workBgnAbleWithin}" />
							</div>
						</div>
					</div>
			<!-- //form_box -->
				</div>
			</div>
			<!-- //form_wrap -->

			<div class="form_wrap">
				<div class="form_title">
					<h3><span class="bbs_ico necessary">Necessary</span> <spring:message code="resume.text.eduproFessionalTraining"/></h3>
					<button type="button" class="open">open for contents view</button>
				</div>
				<!-- //form_title -->
				<div class="form_contents">
					<div class="form_box count2">
						<c:choose>
							<c:when test="${not empty genrlEdu.eduDegreeCd }">
								<div class="form_element select active">
							</c:when>
							<c:otherwise>
								<div class="form_element select">
							</c:otherwise>
						</c:choose>
							<div class="view_area">
								<span class="label"><spring:message code="resume.text.eduDegreeCd"/></span>
								<button type="button" class="text_box open" title="Open selection box">
									<c:choose>
										<c:when test="${not empty genrlEdu.eduDegreeCdNm }">
											<span><c:out value="${genrlEdu.eduDegreeCdNm}" escapeXml="false"/></span>
										</c:when>
										<c:otherwise>
											<span>Open</span>
										</c:otherwise>
									</c:choose>
									<input type="hidden" name="eduDegreeCd" value="${genrlEdu.eduDegreeCd }">
								</button>
							</div>
							<div class="select_box">
								<ul class="clearfix">
									<c:forEach items="${educationDegreeCodeList }" var="educationDegreeCode">
										<li>
											<button type="button" value="${educationDegreeCode.dtlCd }">
												<span><c:out value="${educationDegreeCode.cdNm }" escapeXml="false"/></span>
											</button>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
						<div class="form_element select">
							<div class="view_area">
								<span class="label"><spring:message code="resume.text.technicalVocational"/></span>
								<button type="button" class="text_box open" title="Open selection box">
									<span>Open</span>
									<input type="hidden" name="" value="">
								</button>
							</div>
							<div class="select_box">
								<ul class="clearfix">
									<c:forEach items="${educationDegreeCodeList }" var="educationDegreeCode">
										<li>
											<button type="button" value="${educationDegreeCode.dtlCd }">
												<span><c:out value="${educationDegreeCode.cdNm }" escapeXml="false"/></span>
											</button>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
					<!-- //form_box -->
				</div>
			<!-- //form_contents -->
			</div>
			<!-- //form_wrap -->

			<div class="form_wrap" id="ss_form">
				<div class="form_title">
					<h3><span class="bbs_ico necessary">Necessary</span> <spring:message code="resume.text.researchAndSpecialty"/></h3>
					<button type="button" class="open">open for contents view</button>
				</div>
				<!-- //form_title -->
				<c:if test="${empty specialStudyList}">
					<div class="form_contents">
						<div class="form_box count3">
							<div class="form_element input">
								<div class="view_area">
									<label for="" class="label"><spring:message code="resume.text.specialStudyNm"/></label>
									<input type="text" name="ss_specialStudyNm" class="text_box" maxlength="250"/>
								</div>
							</div>
							<div class="form_date">
								<strong class="skip"><spring:message code="resume.text.studyPeriod"/></strong>
								<div class="form_element input mm">
									<div class="view_area">
										<label for="" class="label">MM</label>
										<input type="text" name="ss_bgnDt_mm" class="text_box inputMM" maxlength="2"/>
									</div>
								</div>
								<div class="form_element input yy">
									<div class="view_area">
										<label for="" class="label">YYYY</label>
										<input type="text" name="ss_bgnDt_yy" class="text_box inputYY" maxlength="4"/>
									</div>
								</div>
								<span class="form_element">~</span>
								<div class="form_element input mm">
									<div class="view_area">
										<label for="" class="label">MM</label>
										<input type="text" name="ss_endDt_mm" class="text_box inputMM" maxlength="2" />
									</div>
								</div>
								<div class="form_element input yy">
									<div class="view_area">
										<label for="" class="label">YYYY</label>
										<input type="text" name="ss_endDt_yy" class="text_box inputYY" maxlength="4"/>
									</div>
								</div>
							</div>
						</div>
						<!-- //form_box -->

						<div class="form_box">
							<div class="form_element input">
								<div class="view_area">
									<label for="" class="label"><spring:message code="resume.text.insttNm"/></label>
									<input type="text" name="ss_insttNm" class="text_box" maxlength="150"/>
								</div>
							</div>
						</div>
					<!-- //form_box -->

						<div class="form_box count2">
							<div class="form_element select">
								<div class="view_area">
									<span class="label"><spring:message code="resume.text.cntryCd"/></span>
									<button type="button" class="text_box open" title="Open selection box">
										<span>Open</span>
										<input type="hidden" name="ss_cntryCd" value="" />
									</button>
								</div>
								<div class="select_box">
									<ul class="clearfix">
										<c:forEach items="${nationalityList }" var="nationality">
											<li><button type="button" class="btn_nationality" value="${nationality.lvlCd }">
												<span><c:out value="${nationality.nm}" escapeXml="false"/></span></button>
											</li>
										</c:forEach>
									</ul>
								</div>
							</div>
							<div class="form_element select">
								<div class="view_area">
									<span class="label"><spring:message code="resume.text.provcCd"/></span>
									<button type="button" class="text_box open" title="Open selection box">
										<span>Open</span>
										<input type="hidden" name="ss_provcCd" value="" />
									</button>
								</div>
								<div class="select_box">
									<ul class="clearfix ul_ss_provcCd">

									</ul>
								</div>
							</div>
						</div>
					<!-- //form_box -->
						<button type="button" class="form_close" style="display: none;">Close contents</button>
					</div>
				</c:if>

				<c:forEach items="${specialStudyList }" var="specialStudy" varStatus="stat">
					<div class="form_contents">
						<div class="form_box count3">
							<c:choose>
								<c:when test="${not empty specialStudy.specialStudyNm }">
									<div class="form_element input active">
								</c:when>
								<c:otherwise>
									<div class="form_element input">
								</c:otherwise>
							</c:choose>
								<div class="view_area">
									<label for="" class="label"><spring:message code="resume.text.specialStudyNm"/></label>
									<input type="text" name="ss_specialStudyNm" class="text_box" maxlength="250" value="${specialStudy.specialStudyNm }"/>
								</div>
							</div>
							<div class="form_date">
								<strong class="skip"><spring:message code="resume.text.studyPeriod"/></strong>
								<c:choose>
									<c:when test="${not empty specialStudy.bgnDtMm }">
										<div class="form_element input mm active">
									</c:when>
									<c:otherwise>
										<div class="form_element input mm">
									</c:otherwise>
								</c:choose>
									<div class="view_area">
										<label for="" class="label">MM</label>
										<input type="text" name="ss_bgnDt_mm" class="text_box inputMM" maxlength="2" value="${specialStudy.bgnDtMm }"/>
									</div>
								</div>
								<c:choose>
									<c:when test="${not empty specialStudy.bgnDtYy }">
										<div class="form_element input yy active">
									</c:when>
									<c:otherwise>
										<div class="form_element input yy">
									</c:otherwise>
								</c:choose>
									<div class="view_area">
										<label for="" class="label">YYYY</label>
										<input type="text" name="ss_bgnDt_yy" class="text_box inputYY" maxlength="4" value="${specialStudy.bgnDtYy }"/>
									</div>
								</div>
								<span class="form_element">~</span>
								<c:choose>
									<c:when test="${not empty specialStudy.endDtMm }">
										<div class="form_element input mm active">
									</c:when>
									<c:otherwise>
										<div class="form_element input mm">
									</c:otherwise>
								</c:choose>
									<div class="view_area">
										<label for="" class="label">MM</label>
										<input type="text" name="ss_endDt_mm" class="text_box inputMM" maxlength="2" value="${specialStudy.endDtMm }"/>
									</div>
								</div>
								<c:choose>
									<c:when test="${not empty specialStudy.endDtYy }">
										<div class="form_element input yy active">
									</c:when>
									<c:otherwise>
										<div class="form_element input yy">
									</c:otherwise>
								</c:choose>
									<div class="view_area">
										<label for="" class="label">YYYY</label>
										<input type="text" name="ss_endDt_yy" class="text_box inputYY" maxlength="4" value="${specialStudy.endDtYy }"/>
									</div>
								</div>
							</div>
						</div>
						<!-- //form_box -->

						<div class="form_box">
							<c:choose>
								<c:when test="${not empty specialStudy.insttNm }">
									<div class="form_element input active">
								</c:when>
								<c:otherwise>
									<div class="form_element input">
								</c:otherwise>
							</c:choose>
								<div class="view_area">
									<label for="" class="label"><spring:message code="resume.text.insttNm"/></label>
									<input type="text" name="ss_insttNm" class="text_box" maxlength="150" value="${specialStudy.insttNm}"/>
								</div>
							</div>
						</div>
					<!-- //form_box -->

						<div class="form_box count2">
							<c:choose>
								<c:when test="${not empty specialStudy.cntryCd }">
									<div class="form_element select active">
								</c:when>
								<c:otherwise>
									<div class="form_element select">
								</c:otherwise>
							</c:choose>
								<div class="view_area">
									<span class="label"><spring:message code="resume.text.cntryCd"/></span>
									<button type="button" class="text_box open" title="Open selection box">
										<c:choose>
											<c:when test="${not empty specialStudy.cntryCdNm }">
												<span><c:out value="${specialStudy.cntryCdNm}" escapeXml="false"/></span>
											</c:when>
											<c:otherwise>
												<span>Open</span>
											</c:otherwise>
										</c:choose>
										<input type="hidden" name="ss_cntryCd" value="${specialStudy.cntryCd }" />
									</button>
								</div>
								<div class="select_box">
									<ul class="clearfix">
										<c:forEach items="${nationalityList }" var="nationality">
											<li><button type="button" class="btn_nationality" value="${nationality.lvlCd }">
												<span><c:out value="${nationality.nm}" escapeXml="false"/></span></button>
											</li>
										</c:forEach>
									</ul>
								</div>
							</div>

							<c:choose>
								<c:when test="${not empty specialStudy.provcCd }">
									<div class="form_element select active">
								</c:when>
								<c:otherwise>
									<div class="form_element select">
								</c:otherwise>
							</c:choose>
								<div class="view_area">
									<span class="label"><spring:message code="resume.text.provcCd"/></span>
									<button type="button" class="text_box open" title="Open selection box">
										<c:choose>
											<c:when test="${not empty specialStudy.provcCdNm }">
												<span><c:out value="${specialStudy.provcCdNm}" escapeXml="false"/></span>
											</c:when>
											<c:otherwise>
												<span>Open</span>
											</c:otherwise>
										</c:choose>
										<input type="hidden" name="ss_provcCd" value="${specialStudy.provcCd}" />
									</button>
								</div>
								<div class="select_box">
									<ul class="clearfix ul_ss_provcCd">

									</ul>
								</div>
							</div>
						</div>
					<!-- //form_box -->
						<c:choose>
							<c:when test="${stat.count eq 1}">
								<button type="button" class="form_close" style="display: none;">Close contents</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="form_close">Close contents</button>
							</c:otherwise>
						</c:choose>
					</div>
				</c:forEach>

				<div class="form_add">
					<button type="button"><span>Add</span></button>
				</div>
			<!-- //form_add -->
			</div>
			<!-- //form_wrap -->

			<div class="form_wrap">
				<div class="form_title">
					<h3><span class="bbs_ico necessary">Necessary</span> <spring:message code="resume.text.certificate"/></h3>
					<button type="button" class="open">open for contents view</button>
				</div>
				<!-- //form_title -->
				<div class="form_contents">
					<div class="form_box count2">
						<div class="form_element input">
							<div class="view_area">
								<label for="" class="label"><spring:message code="resume.text.Credentials"/></label>
								<input type="text" id="" class="text_box" />
							</div>
						</div>
					</div>
					<!-- //form_box -->

					<button type="button" class="form_close" style="display: none;">Close contents</button>
				</div>

				<div class="form_add">
					<button type="button"><span>Add</span></button>
				</div>
			<!-- //form_add -->
			</div>
			<!-- //form_wrap -->

			<div class="form_wrap" id="ot_form">
				<div class="form_title">
					<h3><span class="bbs_ico necessary">Necessary</span> <spring:message code="resume.text.otherEducation"/></h3>
					<button type="button" class="open">open for contents view</button>
				</div>
				<!-- //form_title -->
				<c:if test="${empty otherTrnngList}">
					<div class="form_contents">
						<div class="form_box count3">
							<div class="form_element input">
								<div class="view_area">
									<label for="" class="label"><spring:message code="resume.text.level"/></label>
									<input type="text" name="ot_trnngEduDegreeCd" class="text_box" maxlength="10" />
								</div>
							</div>
							<div class="form_element input">
								<div class="view_area">
									<label for="" class="label"><spring:message code="resume.text.major"/></label>
									<input type="text" name="ot_iscedCd" class="text_box" maxlength="10"/>
								</div>
							</div>
						</div>
						<!-- //form_box -->

						<div class="form_box">
							<div class="form_element input">
								<div class="view_area">
									<label for="" class="label"><spring:message code="resume.text.organizationName"/></label>
									<input type="text" name="ot_insttNm" class="text_box" maxlength="250"/>
								</div>
							</div>
						</div>
					<!-- //form_box -->

						<div class="form_box count3">
							<div class="form_element select">
								<div class="view_area">
									<span class="label"><spring:message code="resume.text.addrProvcCd"/></span>
									<button type="button" class="text_box open" title="Open selection box">
										<span>Open</span>
										<input type="hidden" name="ot_addrProvcCd" value="" />
									</button>
								</div>
								<div class="select_box">
									<ul class="clearfix">
										<c:forEach items="${locCdList }" var="locCd">
											<li>
												<button type="button" class="selectRow" value="${locCd.lvlCd }">
													<span><c:out value="${locCd.nm }" escapeXml="false"/></span>
												</button>
											</li>
										</c:forEach>
									</ul>
								</div>
							</div>
							<div class="form_date">
								<strong class="skip"><spring:message code="resume.text.studyPeriod"/></strong>
								<div class="form_element input mm">
									<div class="view_area">
										<label for="" class="label">MM</label>
										<input type="text" name="ot_bgnDt_mm" class="text_box inputMM" maxlength="2" />
									</div>
								</div>
								<div class="form_element input yy">
									<div class="view_area">
										<label for="" class="label">YYYY</label>
										<input type="text" name="ot_bgnDt_yy" class="text_box inputYY" maxlength="4"/>
									</div>
								</div>
								<span class="form_element">~</span>
								<div class="form_element input mm">
									<div class="view_area">
										<label for="" class="label">MM</label>
										<input type="text" name="ot_endDt_mm" class="text_box inputMM" maxlength="2" />
									</div>
								</div>
								<div class="form_element input yy">
									<div class="view_area">
										<label for="" class="label">YYYY</label>
										<input type="text" name="ot_endDt_yy" class="text_box inputYY" maxlength="4"/>
									</div>
								</div>
							</div>
						</div>
					<!-- //form_box -->
						<button type="button" class="form_close" style="display: none;">Close contents</button>
					</div>
				</c:if>

				<c:forEach items="${otherTrnngList}" var="otherTrnng" varStatus="stat">
					<div class="form_contents">
						<div class="form_box count3">
							<c:choose>
								<c:when test="${not empty otherTrnng.trnngEduDegreeCd }">
									<div class="form_element input active">
								</c:when>
								<c:otherwise>
									<div class="form_element input">
								</c:otherwise>
							</c:choose>
								<div class="view_area">
									<label for="" class="label"><spring:message code="resume.text.level"/></label>
									<input type="text" name="ot_trnngEduDegreeCd" class="text_box" maxlength="10" value="${otherTrnng.trnngEduDegreeCd }" />
								</div>
							</div>
							<c:choose>
								<c:when test="${not empty otherTrnng.iscedCd }">
									<div class="form_element input active">
								</c:when>
								<c:otherwise>
									<div class="form_element input">
								</c:otherwise>
							</c:choose>
								<div class="view_area">
									<label for="" class="label"><spring:message code="resume.text.major"/></label>
									<input type="text" name="ot_iscedCd" class="text_box" maxlength="10" value="${otherTrnng.iscedCd }"/>
								</div>
							</div>
						</div>
						<!-- //form_box -->

						<div class="form_box">
							<c:choose>
								<c:when test="${not empty otherTrnng.insttNm }">
									<div class="form_element input active">
								</c:when>
								<c:otherwise>
									<div class="form_element input">
								</c:otherwise>
							</c:choose>
								<div class="view_area">
									<label for="" class="label"><spring:message code="resume.text.organizationName"/></label>
									<input type="text" name="ot_insttNm" class="text_box" maxlength="250" value="${otherTrnng.insttNm}"/>
								</div>
							</div>
						</div>
					<!-- //form_box -->

						<div class="form_box count3">
							<c:choose>
								<c:when test="${not empty otherTrnng.addrProvcCd}">
									<div class="form_element select active">
								</c:when>
								<c:otherwise>
									<div class="form_element select">
								</c:otherwise>
							</c:choose>

								<div class="view_area">
									<span class="label"><spring:message code="resume.text.addrProvcCd"/></span>
									<button type="button" class="text_box open" title="Open selection box">
										<c:choose>
											<c:when test="${not empty otherTrnng.addrProvcCdNm}">
												<span><c:out value="${otherTrnng.addrProvcCdNm}" escapeXml="false"/></span>
											</c:when>
											<c:otherwise>
												<span>Open</span>
											</c:otherwise>
										</c:choose>
										<input type="hidden" name="ot_addrProvcCd" value="${otherTrnng.addrProvcCd }" />
									</button>
								</div>
								<div class="select_box">
									<ul class="clearfix">
										<c:forEach items="${locCdList }" var="locCd">
											<li>
												<button type="button" class="selectRow" value="${locCd.lvlCd }">
													<span><c:out value="${locCd.nm }" escapeXml="false"/></span>
												</button>
											</li>
										</c:forEach>
									</ul>
								</div>
							</div>
							<div class="form_date">
								<strong class="skip"><spring:message code="resume.text.studyPeriod"/></strong>
								<c:choose>
									<c:when test="${not empty otherTrnng.bgnDtMm }">
										<div class="form_element input mm active">
									</c:when>
									<c:otherwise>
										<div class="form_element input mm">
									</c:otherwise>
								</c:choose>
									<div class="view_area">
										<label for="" class="label">MM</label>
										<input type="text" name="ot_bgnDt_mm" class="text_box inputMM" maxlength="2" value="${otherTrnng.bgnDtMm}" />
									</div>
								</div>
								<c:choose>
									<c:when test="${not empty otherTrnng.bgnDtYy }">
										<div class="form_element input yy active">
									</c:when>
									<c:otherwise>
										<div class="form_element input yy">
									</c:otherwise>
								</c:choose>
									<div class="view_area">
										<label for="" class="label">YYYY</label>
										<input type="text" name="ot_bgnDt_yy" class="text_box inputYY" maxlength="4" value="${otherTrnng.bgnDtYy}"/>
									</div>
								</div>
								<span class="form_element">~</span>
								<c:choose>
									<c:when test="${not empty otherTrnng.bgnDtMm }">
										<div class="form_element input mm active">
									</c:when>
									<c:otherwise>
										<div class="form_element input mm">
									</c:otherwise>
								</c:choose>
									<div class="view_area">
										<label for="" class="label">MM</label>
										<input type="text" name="ot_endDt_mm" class="text_box inputMM" maxlength="2" value="${otherTrnng.endDtMm}" />
									</div>
								</div>
								<c:choose>
									<c:when test="${not empty otherTrnng.bgnDtYy }">
										<div class="form_element input yy active">
									</c:when>
									<c:otherwise>
										<div class="form_element input yy">
									</c:otherwise>
								</c:choose>
									<div class="view_area">
										<label for="" class="label">YYYY</label>
										<input type="text" name="ot_endDt_yy" class="text_box inputYY" maxlength="4" value="${otherTrnng.endDtYy}"/>
									</div>
								</div>
							</div>
						</div>
					<!-- //form_box -->
						<c:choose>
							<c:when test="${stat.count eq 1 }">
								<button type="button" class="form_close" style="display: none;">Close contents</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="form_close">Close contents</button>
							</c:otherwise>
						</c:choose>

					</div>
				</c:forEach>

				<div class="form_add">
					<button type="button"><span>Add</span></button>
				</div>
			<!-- //form_add -->
			</div>
			<!-- //form_wrap -->

			<div class="form_wrap" id="rl_form">
				<div class="form_title">
					<h3><span class="bbs_ico necessary">Necessary</span> <spring:message code="resume.text.languageStudy"/></h3>
					<button type="button" class="open">open for contents view</button>
				</div>
				<!-- //form_title -->
				<div class="form_contents">
					<div class="form_box count3">
						<c:choose>
							<c:when test="${not empty resumeDetail.langUseCd }">
								<div class="form_element input active">
							</c:when>
							<c:otherwise>
								<div class="form_element input">
							</c:otherwise>
						</c:choose>
							<div class="view_area">
								<label for="" class="label"><spring:message code="resume.text.langUseCd"/></label>
								<input type="text" id="langUseCd" name="langUseCd" class="text_box" maxlength="10" value="${resumeDetail.langUseCd}"/>
							</div>
						</div>
					</div>
					<!-- //form_box -->
				</div>
			<!-- //form_contents -->
				<c:if test="${empty langList }">
					<div class="form_contents rl_form">
						<div class="form_box count3">
							<div class="form_element input">
								<div class="view_area">
									<label for="" class="label"><spring:message code="resume.text.langNm"/></label>
									<input type="text" name="rl_langNm" class="text_box" />
								</div>
							</div>
							<div class="form_element select">
								<div class="view_area">
									<span class="label"><spring:message code="resume.text.langLvlCd"/></span>
									<button type="button" class="text_box open" title="Open selection box">
										<span>Open</span>
										<input type="hidden" name="rl_langLvlCd" value="" />
									</button>
								</div>
								<div class="select_box">
									<ul class="clearfix">
										<c:forEach items="${languageLevelList }" var="languageLevel">
											<li>
												<button type="button" value="${languageLevel.dtlCd}">
													<span><c:out value="${languageLevel.cdNm}" escapeXml="false"/></span>
												</button>
											</li>
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
						<!-- //form_box -->
						<button type="button" class="form_close" style="display: none;">Close contents</button>
					</div>
				</c:if>

				<c:forEach items="${langList }" var="lang" varStatus="stat">
					<div class="form_contents rl_form">
						<div class="form_box count3">
							<div class="form_element input">
								<div class="view_area">
									<label for="" class="label"><spring:message code="resume.text.langNm"/></label>
									<input type="text" name="rl_langNm" class="text_box" />
								</div>
							</div>

							<c:choose>
								<c:when test="${not empty lang.langLvlCd}">
									<div class="form_element select active">
								</c:when>
								<c:otherwise>
									<div class="form_element select">
								</c:otherwise>
							</c:choose>
								<div class="view_area">
									<span class="label"><spring:message code="resume.text.langLvlCd"/></span>
									<button type="button" class="text_box open" title="Open selection box">
										<c:choose>
											<c:when test="${not empty lang.langLvlCdNm }">
												<span><c:out value="${lang.langLvlCdNm}" escapeXml="false"/></span>
											</c:when>
											<c:otherwise>
												<span>Open</span>
											</c:otherwise>
										</c:choose>
										<input type="hidden" name="rl_langLvlCd" value="${lang.langLvlCd }" />
									</button>
								</div>
								<div class="select_box">
									<ul class="clearfix">
										<c:forEach items="${languageLevelList }" var="languageLevel">
											<li>
												<button type="button" value="${languageLevel.dtlCd}">
													<span><c:out value="${languageLevel.cdNm}" escapeXml="false"/></span>
												</button>
											</li>
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
						<!-- //form_box -->
						<c:choose>
							<c:when test="${stat.count eq 1 }">
								<button type="button" class="form_close" style="display: none;">Close contents</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="form_close">Close contents</button>
							</c:otherwise>
						</c:choose>
					</div>
				</c:forEach>
				<!-- //form_contents -->

				<div class="form_add">
					<button type="button"><span>Add</span></button>
				</div>
			<!-- //form_add -->
			</div>
			<!-- //form_wrap -->

			<div class="form_wrap">
				<div class="form_title">
					<h3><!-- <span class="bbs_ico necessary">Necessary</span> --> <spring:message code="resume.text.career"/> <span class="tit calCareerResult"></span></h3>
					<button type="button" class="open">open for contents view</button>
				</div>
				<!-- //form_title -->
				<c:if test="${empty workExpList }">
					<div class="form_contents exp_form">
						<div class="form_box count3">
							<div class="form_element input">
								<div class="view_area">
									<label for="" class="label"><spring:message code="resume.text.orgnzNm"/></label>
									<input type="text" name="exp_orgnzNm" class="text_box" maxlength="250"/>
								</div>
							</div>
						</div>
						<!-- //form_box -->

						<div class="form_box count3">
							<div class="form_element input">
								<div class="view_area">
									<label for="" class="label"><spring:message code="resume.text.iscoCd"/></label>
									<input type="text" name="exp_iscoCd" class="text_box" maxlength="10"/>
								</div>
							</div>
							<div class="form_element input">
								<div class="view_area">
									<label for="" class="label"><spring:message code="resume.text.position"/></label>
									<input type="text" name="" class="text_box" />
								</div>
							</div>
						</div>
					<!-- //form_box -->

						<div class="form_box count3">
							<div class="form_element select">
								<div class="view_area">
									<span class="label"><spring:message code="resume.text.selfemp"/></span>
									<button type="button" class="text_box open" title="Open selection box"><span>Open</span></button>
								</div>
								<div class="select_box">
									<ul class="clearfix">
									<li>
										<span>
											<input type="radio" name="exp_selfempYn" id="radio08_01" />
											<label for="radio08_01">Yes</label>
										</span>
									</li>
									<li>
										<span>
											<input type="radio" name="exp_selfempYn" id="radio08_02" />
											<label for="radio08_02">No</label>
										</span>
									</li>
									</ul>
								</div>
							</div>
							<div class="form_date">
								<strong class="skip"><spring:message code="resume.text.expTerm"/></strong>
								<div class="form_element input mm">
									<div class="view_area">
										<label for="" class="label">MM</label>
										<input type="text" name="exp_bgnDt_mm" class="text_box calCareer inputMM" maxlength="2"/>
									</div>
								</div>
								<div class="form_element input yy">
									<div class="view_area">
										<label for="" class="label">YY</label>
										<input type="text" name="exp_bgnDt_yy" class="text_box calCareer inputYY" maxlength="4"/>
									</div>
								</div>
								<span class="form_element">~</span>
								<div class="form_element input mm">
									<div class="view_area">
										<label for="" class="label">MM</label>
										<input type="text" name="exp_endDt_mm" class="text_box calCareer inputMM" maxlength="2" />
									</div>
								</div>
								<div class="form_element input yy">
									<div class="view_area">
										<label for="" class="label">YY</label>
										<input type="text" name="exp_endDt_yy" class="text_box calCareer inputYY" maxlength="4" />
									</div>
								</div>
							</div>
						</div>
					<!-- //form_box -->

						<div class="form_box">
							<div class="form_element input">
								<div class="view_area">
									<label for="" class="label"><spring:message code="resume.text.leaveReason"/></label>
									<input type="text" name="exp_leaveReason" class="text_box" maxlength="500"/>
								</div>
							</div>
						</div>
					<!-- //form_box -->
						<button type="button" class="form_close" style="display: none;">Close contents</button>
					</div>
				</c:if>

				<c:forEach items="${workExpList }" var="workExp" varStatus="stat">
					<div class="form_contents exp_form">
						<div class="form_box count3">
							<c:choose>
								<c:when test="${not empty workExp.orgnzNm}">
									<div class="form_element input active">
								</c:when>
								<c:otherwise>
									<div class="form_element input">
								</c:otherwise>
							</c:choose>
								<div class="view_area">
									<label for="" class="label"><spring:message code="resume.text.orgnzNm"/></label>
									<input type="text" name="exp_orgnzNm" class="text_box" maxlength="250" value="${workExp.orgnzNm}"/>
								</div>
							</div>
						</div>
						<!-- //form_box -->

						<div class="form_box count3">
							<c:choose>
								<c:when test="${not empty workExp.iscoCd}">
									<div class="form_element input active">
								</c:when>
								<c:otherwise>
									<div class="form_element input">
								</c:otherwise>
							</c:choose>
								<div class="view_area">
									<label for="" class="label"><spring:message code="resume.text.iscoCd"/></label>
									<input type="text" name="exp_iscoCd" class="text_box" maxlength="10" value="${workExp.iscoCd}"/>
								</div>
							</div>
							<div class="form_element input">
								<div class="view_area">
									<label for="" class="label"><spring:message code="resume.text.position"/></label>
									<input type="text" name="" class="text_box" />
								</div>
							</div>
						</div>
					<!-- //form_box -->

						<div class="form_box count3">
							<c:choose>
								<c:when test="${not empty workExp.selfempYn}">
									<div class="form_element select active">
								</c:when>
								<c:otherwise>
									<div class="form_element select">
								</c:otherwise>
							</c:choose>
								<div class="view_area">
									<span class="label"><spring:message code="resume.text.selfemp"/></span>
									<button type="button" class="text_box open" title="Open selection box">
										<c:choose>
											<c:when test="${workExp.selfempYn eq 'Y'}">
												<span>Yes</span>
											</c:when>
											<c:when test="${workExp.selfempYn eq 'N'}">
												<span>No</span>
											</c:when>
											<c:otherwise>
												<span>Open</span>
											</c:otherwise>
										</c:choose>
									</button>
								</div>
								<div class="select_box">
									<ul class="clearfix">
									<li>
										<span>
											<input type="radio" name="exp_selfempYn" id="radio08_01" value="Y" <c:if test="${workExp.selfempYn eq 'Y'}">checked="checked"</c:if>/>
											<label for="radio08_01">Yes</label>
										</span>
									</li>
									<li>
										<span>
											<input type="radio" name="exp_selfempYn" id="radio08_02" value="N" <c:if test="${workExp.selfempYn eq 'N'}">checked="checked"</c:if>/>
											<label for="radio08_02">No</label>
										</span>
									</li>
									</ul>
								</div>
							</div>
							<div class="form_date">
								<strong class="skip"><spring:message code="resume.text.expTerm"/></strong>
								<c:choose>
									<c:when test="${not empty workExp.bgnDtMm}">
										<div class="form_element input mm active">
									</c:when>
									<c:otherwise>
										<div class="form_element input mm">
									</c:otherwise>
								</c:choose>
									<div class="view_area">
										<label for="" class="label">MM</label>
										<input type="text" name="exp_bgnDt_mm" class="text_box calCareer inputMM" maxlength="2" value="${workExp.bgnDtMm }"/>
									</div>
								</div>
								<c:choose>
									<c:when test="${not empty workExp.bgnDtYy}">
										<div class="form_element input yy active">
									</c:when>
									<c:otherwise>
										<div class="form_element input yy">
									</c:otherwise>
								</c:choose>
									<div class="view_area">
										<label for="" class="label">YY</label>
										<input type="text" name="exp_bgnDt_yy" class="text_box calCareer inputYY" maxlength="4" value="${workExp.bgnDtYy }"/>
									</div>
								</div>
								<span class="form_element">~</span>
								<c:choose>
									<c:when test="${not empty workExp.endDtMm}">
										<div class="form_element input mm active">
									</c:when>
									<c:otherwise>
										<div class="form_element input mm">
									</c:otherwise>
								</c:choose>
									<div class="view_area">
										<label for="" class="label">MM</label>
										<input type="text" name="exp_endDt_mm" class="text_box calCareer inputMM" maxlength="2" value="${workExp.endDtMm }"/>
									</div>
								</div>
								<c:choose>
									<c:when test="${not empty workExp.endDtYy}">
										<div class="form_element input yy active">
									</c:when>
									<c:otherwise>
										<div class="form_element input yy">
									</c:otherwise>
								</c:choose>
									<div class="view_area">
										<label for="" class="label">YY</label>
										<input type="text" name="exp_endDt_yy" class="text_box calCareer inputYY" maxlength="4" value="${workExp.endDtYy }"/>
									</div>
								</div>
							</div>
						</div>
					<!-- //form_box -->

						<div class="form_box">
							<c:choose>
								<c:when test="${not empty workExp.leaveReason}">
									<div class="form_element input active">
								</c:when>
								<c:otherwise>
									<div class="form_element input">
								</c:otherwise>
							</c:choose>
								<div class="view_area">
									<label for="" class="label"><spring:message code="resume.text.leaveReason"/></label>
									<input type="text" name="exp_leaveReason" class="text_box" maxlength="500" value="${workExp.leaveReason}"/>
								</div>
							</div>
						</div>
					<!-- //form_box -->
						<c:choose>
							<c:when test="${stat.count eq 1 }">
								<button type="button" class="form_close" style="display: none;">Close contents</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="form_close">Close contents</button>
							</c:otherwise>
						</c:choose>
					</div>
				</c:forEach>

				<div class="form_add">
					<button type="button"><span>Add</span></button>
				</div>
			<!-- //form_add -->
			</div>
			<!-- //form_wrap -->

			<div class="form_wrap">
				<div class="form_title">
					<h3>Skill</h3>
					<button type="button" class="open">open for contents view</button>
				</div>
				<!-- //form_title -->
				<div class="form_contents sk_form">
					<c:forEach items="${skillCdList}" var="skillCd">
						<div class="form_box">
							<div class="form_element check child">
								<div class="view_area">
									<span class="label"><c:out value="${skillCd.cdNm }" escapeXml="false"/></span>
									<span class="text_box">

									</span>
									<button type="button" class="child_open">open for contents view</button>
								</div>
								<div class="check_box">
									<ul class="clearfix">
										<c:forEach items="${skillCd.list }" var="cd">
											<c:choose>
												<c:when test="${empty skillList }">
													<li>
														<span>
															<input type="checkbox" id="skill${cd.dtlCd }" name="sk_skillCd" value="${cd.dtlCd }" />
															<label for="skill${cd.dtlCd }"><c:out value="${cd.cdNm }" escapeXml="false"/></label>
														</span>
													</li>
												</c:when>
												<c:otherwise>
													<c:set var="skillFlag" value="false" />
													<c:forEach items="${skillList }" var="skill">
														<c:if test="${cd.dtlCd eq skill.skillCd }">
															<c:set var="skillFlag" value="true" />
														</c:if>
													</c:forEach>

													<c:choose>
														<c:when test="${skillFlag eq 'true'}">
															<li>
																<span>
																	<input type="checkbox" id="skill${cd.dtlCd }" name="sk_skillCd" value="${cd.dtlCd }" data-clickflag="true" />
																	<label for="skill${cd.dtlCd }"><c:out value="${cd.cdNm }" escapeXml="false"/></label>
																</span>
															</li>
														</c:when>
														<c:otherwise>
															<li>
																<span>
																	<input type="checkbox" id="skill${cd.dtlCd }" name="sk_skillCd" value="${cd.dtlCd }" />
																	<label for="skill${cd.dtlCd }"><c:out value="${cd.cdNm }" escapeXml="false"/></label>
																</span>
															</li>
														</c:otherwise>
													</c:choose>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
					</c:forEach>
				<!-- //form_box -->
				</div>
			<!-- //form_contents -->
			</div>
			<!-- //form_wrap -->

			<div class="form_wrap">
				<div class="form_title">
					<h3>Keyword</h3>
					<button type="button" class="open">open for contents view</button>
				</div>
				<!-- //form_title -->
				<div class="form_contents">
					<div class="form_box">
						<c:choose>
							<c:when test="${not empty resumeDetail.resumeKeywordList}">
								<div class="form_element keyword active">
							</c:when>
							<c:otherwise>
								<div class="form_element keyword">
							</c:otherwise>
						</c:choose>

							<div class="view_area">
								<label for="keyword" class="skip">Keyword input</label>
								<span class="text_box">
									<c:forEach items="${resumeDetail.resumeKeywordList }" var="resumeKeyword">
										<span>
											<c:out value="${resumeKeyword}" escapeXml="false" />
											<input type="hidden" class="resumeKeyword" value="${resumeKeyword}" />
											<button type="button">delete</button>
										</span>
									</c:forEach>
								</span>
								<input type="text" id="keyword" class="input_key" />
							</div>
						</div>
						<div class="keyword_info">
							<strong>※ After entering #+ keyword and press enter button, you can add a keyword.</strong>
							<span>Please enter keywords about related your interesting and preference. Keyword will be used for searching and  matching CV and referral.</span>
						</div>
					</div>
					<!-- //form_box -->
				</div>
				<!-- //form_contents -->
			</div>

			<div class="form_wrap">
				<div class="form_title">
					<h3><spring:message code="resume.text.refMan"/></h3>
					<button type="button" class="open">open for contents view</button>
				</div>
				<!-- //form_title -->

				<c:if test="${empty refManList }">
					<div class="form_contents ref_form">
						<div class="form_box count3">
							<div class="form_element input">
								<div class="view_area">
									<label for="" class="label"><spring:message code="resume.text.refNm"/></label>
									<input type="text" name="ref_nm" class="text_box" maxlength="250" />
								</div>
							</div>
						</div>
						<!-- //form_box -->

						<div class="form_box count3">
							<div class="form_element input">
								<div class="view_area">
									<label for="" class="label"><spring:message code="resume.text.refOrgnzNm"/></label>
									<input type="text" name="ref_orgnzNm" class="text_box" maxlength="250"/>
								</div>
							</div>
							<div class="form_element input">
								<div class="view_area">
									<label for="" class="label"><spring:message code="resume.text.refPosition"/></label>
									<input type="text" name="ref_position" class="text_box" maxlength="250"/>
								</div>
							</div>
							<div class="form_element input">
								<div class="view_area">
									<label for="" class="label"><spring:message code="resume.text.refRef"/></label>
									<input type="text" name="ref_ref" class="text_box" maxlength="250"/>
								</div>
							</div>
						</div>
					<!-- //form_box -->

						<div class="form_box count3">
							<div class="form_element input">
								<div class="view_area">
									<label for="" class="label"><spring:message code="resume.text.refCell"/></label>
									<input type="text" name="ref_cell" class="text_box inputNo" maxlength="25"/>
								</div>
							</div>
							<div class="form_element input">
								<div class="view_area">
									<label for="" class="label"><spring:message code="resume.text.refEmail"/></label>
									<input type="text" name="ref_email" class="text_box inputEmail" maxlength="100"/>
								</div>
							</div>
						</div>
					<!-- //form_box -->

						<div class="form_box">
							<div class="form_element pick" id="ref_addr">
								<div class="view_area">
									<span class="label">Address</span>
									<span class="text_box">
									</span>
								</div>
								<button type="button" class="open" title="Open selection box"><span>Location Selection</span></button>
								<div class="popup_box">
									<div class="bbs_popup"><!-- 팝업 가로, 세로 지정하지 않았습니다. 필요에 딸라 지정해서 사용 -->
										<section class="box_wrap">
											<div class="title_box">
												<h1 class="title">Location Selection</h1>
											</div>
											<div class="contents_box">
												<div class="pop_scroll_box count4"><!-- 한줄에 들어갈 개수 변경해야 할 경우 클래스 count2 ~ count5 추가 -->
													<ul class="clearfix">
														<li class="dep1">
															<div class="scroll_box">
																<div class="scroll_title">
																	<strong>Province</strong>
																</div>
																<div class="scroll_cont">
																	<ul>
																		<c:forEach items="${locCdList }" var="locCd">
																			<li>
																				<button type="button" class="selectRow" value="${locCd.lvlCd }"><c:out value="${locCd.nm }" escapeXml="false"/></button>
																			</li>
																		</c:forEach>
																	</ul>
																</div>
															</div>
														</li>
														<li class="dep1">
															<div class="scroll_box">
																<div class="scroll_title">
																	<strong>District</strong>
																</div>
																<div class="scroll_cont">
																	<ul>
																	</ul>
																</div>
															</div>
														</li>
														<li class="dep1">
															<div class="scroll_box">
																<div class="scroll_title">
																	<strong>Commune</strong>
																</div>
																<div class="scroll_cont">
																	<ul>
																	</ul>
																</div>
															</div>
														</li>
														<li class="dep1">
															<div class="scroll_box">
																<div class="scroll_title">
																	<strong>Village</strong>
																</div>
																<div class="scroll_cont">
																	<ul>
																	</ul>
																</div>
															</div>
														</li>
													</ul>
												</div>
												<div class="button_box">
													<button type="button" class="bbs_btn save">Select</button>
													<button type="button" class="bbs_btn cancel">Cancel</button>
												</div>
												<button type="button" class="close">close of popup</button>
											</div>
										</section>
									</div>
								</div>
							</div>
							<div class="form_element no_write input">
								<div class="view_area">
									<label for="" class="label">detail address</label>
									<input type="text" name="ref_addrDtl" class="text_box" maxlength=""/>
								</div>
							</div>
						</div>
					<!-- //form_box -->
						<button type="button" class="form_close" style="display: none;">Close contents</button>
					</div>
				</c:if>

				<c:forEach items="${refManList }" var="refMan" varStatus="stat">
					<div class="form_contents ref_form">
						<div class="form_box count3">
							<c:choose>
								<c:when test="${not empty refMan.nm }">
									<div class="form_element input active">
								</c:when>
								<c:otherwise>
									<div class="form_element input">
								</c:otherwise>
							</c:choose>
								<div class="view_area">
									<label for="" class="label"><spring:message code="resume.text.refNm"/></label>
									<input type="text" name="ref_nm" class="text_box" maxlength="250" value="${refMan.nm }"/>
								</div>
							</div>
						</div>
						<!-- //form_box -->

						<div class="form_box count3">
							<c:choose>
								<c:when test="${not empty refMan.orgnzNm }">
									<div class="form_element input active">
								</c:when>
								<c:otherwise>
									<div class="form_element input">
								</c:otherwise>
							</c:choose>
								<div class="view_area">
									<label for="" class="label"><spring:message code="resume.text.refOrgnzNm"/></label>
									<input type="text" name="ref_orgnzNm" class="text_box" maxlength="250" value="${refMan.orgnzNm}"/>
								</div>
							</div>
							<c:choose>
								<c:when test="${not empty refMan.position }">
									<div class="form_element input active">
								</c:when>
								<c:otherwise>
									<div class="form_element input">
								</c:otherwise>
							</c:choose>
								<div class="view_area">
									<label for="" class="label"><spring:message code="resume.text.refPosition"/></label>
									<input type="text" name="ref_position" class="text_box" maxlength="250" value="${refMan.position }"/>
								</div>
							</div>
							<c:choose>
								<c:when test="${not empty refMan.ref }">
									<div class="form_element input active">
								</c:when>
								<c:otherwise>
									<div class="form_element input">
								</c:otherwise>
							</c:choose>
								<div class="view_area">
									<label for="" class="label"><spring:message code="resume.text.refRef"/></label>
									<input type="text" name="ref_ref" class="text_box" maxlength="250" value="${refMan.ref }"/>
								</div>
							</div>
						</div>
					<!-- //form_box -->

						<div class="form_box count3">
							<c:choose>
								<c:when test="${not empty refMan.cell }">
									<div class="form_element input active">
								</c:when>
								<c:otherwise>
									<div class="form_element input">
								</c:otherwise>
							</c:choose>
								<div class="view_area">
									<label for="" class="label"><spring:message code="resume.text.refCell"/></label>
									<input type="text" name="ref_cell" class="text_box inputNo" maxlength="25" value="${refMan.cell }"/>
								</div>
							</div>
							<c:choose>
								<c:when test="${not empty refMan.email }">
									<div class="form_element input active">
								</c:when>
								<c:otherwise>
									<div class="form_element input">
								</c:otherwise>
							</c:choose>
								<div class="view_area">
									<label for="" class="label"><spring:message code="resume.text.refEmail"/></label>
									<input type="text" name="ref_email" class="text_box inputEmail" maxlength="100" value="${refMan.email }"/>
								</div>
							</div>
						</div>
					<!-- //form_box -->

						<div class="form_box">
							<c:choose>
								<c:when test="${not empty refMan.addrFullCd}">
									<div class="form_element pick active" id="ref_addr">
								</c:when>
								<c:otherwise>
									<div class="form_element pick" id="ref_addr">
								</c:otherwise>
							</c:choose>

								<div class="view_area">
									<span class="label">Address</span>
									<span class="text_box">
										<c:if test="${not empty refMan.addrFullCd && not empty refMan.addrFullNm}">
											<span><c:out value="${refMan.addrFullNm}" escapeXml="false"/><input type='hidden' name="ref_addrNm" value="${refMan.addrFullNm}"/>
											<input type='hidden' name="ref_addrCd" value="${refMan.addrFullCd}"/><button type='button'>delete</button></span>
										</c:if>
									</span>
								</div>
								<button type="button" class="open" title="Open selection box"><span>Location Selection</span></button>
								<div class="popup_box">
									<div class="bbs_popup"><!-- 팝업 가로, 세로 지정하지 않았습니다. 필요에 딸라 지정해서 사용 -->
										<section class="box_wrap">
											<div class="title_box">
												<h1 class="title">Location Selection</h1>
											</div>
											<div class="contents_box">
												<div class="pop_scroll_box count4"><!-- 한줄에 들어갈 개수 변경해야 할 경우 클래스 count2 ~ count5 추가 -->
													<ul class="clearfix">
														<li class="dep1">
															<div class="scroll_box">
																<div class="scroll_title">
																	<strong>Province</strong>
																</div>
																<div class="scroll_cont">
																	<ul>
																		<c:forEach items="${locCdList }" var="locCd">
																			<li>
																				<button type="button" class="selectRow" value="${locCd.lvlCd }"><c:out value="${locCd.nm }" escapeXml="false"/></button>
																			</li>
																		</c:forEach>
																	</ul>
																</div>
															</div>
														</li>
														<li class="dep1">
															<div class="scroll_box">
																<div class="scroll_title">
																	<strong>District</strong>
																</div>
																<div class="scroll_cont">
																	<ul>
																	</ul>
																</div>
															</div>
														</li>
														<li class="dep1">
															<div class="scroll_box">
																<div class="scroll_title">
																	<strong>Commune</strong>
																</div>
																<div class="scroll_cont">
																	<ul>
																	</ul>
																</div>
															</div>
														</li>
														<li class="dep1">
															<div class="scroll_box">
																<div class="scroll_title">
																	<strong>Village</strong>
																</div>
																<div class="scroll_cont">
																	<ul>
																	</ul>
																</div>
															</div>
														</li>
													</ul>
												</div>
												<div class="button_box">
													<button type="button" class="bbs_btn save">Select</button>
													<button type="button" class="bbs_btn cancel">Cancel</button>
												</div>
												<button type="button" class="close">close of popup</button>
											</div>
										</section>
									</div>
								</div>
							</div>
							<div class="form_element no_write input">
								<div class="view_area">
									<label for="" class="label">detail address</label>
									<input type="text" name="ref_addrDtl" class="text_box" maxlength="" value=""/>
								</div>
							</div>
						</div>
					<!-- //form_box -->
						<c:choose>
							<c:when test="${stat.count eq 1 }">
								<button type="button" class="form_close" style="display: none;">Close contents</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="form_close">Close contents</button>
							</c:otherwise>
						</c:choose>
					</div>
				</c:forEach>

				<div class="form_add">
					<button type="button"><span>Add</span></button>
				</div>
			<!-- //form_add -->
			</div>
			<!-- //form_wrap -->

			<div class="form_wrap active">
				<div class="form_title">
					<h3><span class="bbs_ico necessary">Necessary</span> Declaration and agreement</h3>
					<button type="button" class="open">open for contents view</button>
				</div>
				<!-- //form_title -->
				<div class="form_contents">
					<div class="form_box">
						<div class="form_element info">
							<div class="view_area">
								<span class="text_box">
									I solemnly declare that all the information provided above are true and accurate from the best of my knowledge. <br />I agree to allow the National Employment Agency (NEA) to provide all the above information to any employers and (or) make any public disclosure deemed necessary. <br />I agree to continue update NEA about my latest status and to notify NEA about the esults of my job search, referral and placement. <br />In case of any inaccuracy, default and/or contravention, I shall be held liable to all applicable laws and regulations.
								</span>
							</div>
							<div class="agree_box">
								<span>
									<input type="checkbox" id="agree" />
									<label for="agree">I firmly agree to above described <strong>[Necessary]</strong></label>
								</span>
							</div>
						</div>
					</div>
					<!-- //form_box -->
				</div>
			<!-- //form_contents -->
			</div>
			<!-- //form_wrap -->

			<div class="bbs_btn_wrap form_btnbox">
				<div class="bbs_center">
					<c:if test="${tempFlag eq '20'}">
						<button type="button" class="bbs_btn type02" id="btn_tempSave">TEMPORARY SAVE</button>
					</c:if>
					<button type="button" class="bbs_btn type01" id="btn_save">SAVE</button>
				</div>
			</div>

		</div>
			           <!-- //contents -->
	</article>
</main>
	<!-- //main.colgroup -->