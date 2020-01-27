<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>

    <script>
    var keywordArr = "";
    var keywordList = [];
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
    		commonPopupSet('isco');
    		commonPopupSet('addr');

    		fnCalculationCareerUpdate();

    		keywordArr += $('#ResumeKeyword').val();

    		var keywordTemp = keywordArr.split(",");
    		for(var i in keywordTemp){
    			keywordList.push(keywordTemp[i]);
    		}

    		$('#keyword').on('keydown', function(event){
    			var keywordVal = $("#keyword").val();
    			if((event.keyCode)&&(event.keyCode==13) && keywordVal.length > 1){
	    			var text = keywordVal.charAt(0);
	    			if(text == "#") {
	    				var keywordChk = true;
	    				for(var i=0; i<keywordList.length; i++) {
	    					if(keywordList[i] == keywordVal) {
	    						keywordChk = false;
	    						break;
	    					}
	    				}
	    				if(keywordChk && keywordList.length < 5) {

	    					console.log("=================keywordVal="+keywordVal);
		    				$(this).parents('.form_element').addClass('active').find('.text_box').append('<span>'+keywordVal+'<button type="button" value='+keywordVal+' onclick="fnDeleteKeyword(this)">delete</button></span>');

		    				if(keywordArr == ""){
		    					keywordArr += keywordVal;
		    				}else{
		    					keywordArr += "," + keywordVal;
		    				}

		    				keywordList.push(keywordVal);
	    				}

	    			}
	    			$("#keyword").val("");
	    			return false;
    			}

    		});

    		$('.btn_fileSelect').on('click', function(){
				$('#uploadImgFile').click();
    		});

    		$('#uploadImgFile').on('change', function(e){
				var files = e.target.files;
				var fileList = Array.prototype.slice.call(files);

				fileList.forEach(function(f){
					if(!f.type.match("image.*")){
						alertify.alert("<spring:message code='error.insertFile.onlyImgFile'/>");
						return false;
					}

					var reader = new FileReader();
					reader.onload = function(event){
						$('#uploadImg').attr("src", event.target.result);
					}
					reader.readAsDataURL(f);

				});

				$('#btn_imgAdd').hide();
				$('#uploadImg').show();
				$('#btn_imgModify').show();
    		});

    		// 저장
    		$('#btn_save').on('click', function(){

    			var profile_title = $('#profile_title').val();

				if(profile_title == ""){
					alertify.alert(resumeTitleMsg, function(){
						$('#profile_title').focus();
					});
					return false;
				}

				// 인적 사항 입력 여부 체크
				var addrFullNm = $('input[name=addrFullNm]').val();
				var addrFullCd = $('input[name=addrFullCd]').val();
				var addrCd = $('input[name=addrCd]').val();
				var marriCd = $('#marriCd').val();
				var familyCnt = $('#familyCnt').val();
				var underAge15FamilyCnt = $('#underAge15FamilyCnt').val();
				var overAge64FamilyCnt  = $('#overAge64FamilyCnt').val();
				var disablYn            = $('input[name=disablYn]:checked').val();
				var selfempYn           = $('input[name=selfempYn]:checked').val();
				var frstimeJobSeekerYn = ($('#frstimeJobSeekerYn:checked').val() == 'Y') ? 'Y' : 'N';
				var studyingYn = ($('#studyingYn:checked').val() == 'Y') ? 'Y' : 'N';
				var retMigratYn = ($('#retMigratYn:checked').val() == 'Y') ? 'Y' : 'N';
				var srvcYn = ($('#srvcYn:checked').val() == 'Y') ? 'Y' : 'N';
				var ethnicMinorYn = ($('#ethnicMinorYn:checked').val() == 'Y') ? 'Y' : 'N';

				var disablOptionCdList = [];

				$('input[name=disablOptionCd]:checked').each(function(){
					disablOptionCdList.push($(this).val());
				});

				if(addrCd == "" || typeof addrCd == "undefined"){
					alertify.alert("출생지를 입력하세요.", function(){
						fnTabCheck("tab1_focus");
						$('#addr_focus').focus();
					});
					return false;
				}

				if(marriCd == ""){
					alertify.alert("결혼 여부를 선택하세요.", function(){
						fnTabCheck("tab1_focus");
						$('#marriCd_focus').focus();
					});
					return false;
				}

				if(familyCnt == ""){
					alertify.alert("가족수를 입력해 주세요.", function(){
						fnTabCheck("tab1_focus");
						$('#familyCnt').focus();
					});
					return false;
				}

				if(underAge15FamilyCnt == ""){
					alertify.alert("15세 미만 가족수를 입력해주세요.", function(){
						fnTabCheck("tab1_focus");
						$('#underAge15FamilyCnt').focus();
					});
					return false;
				}

				if(overAge64FamilyCnt == ""){
					alertify.alert("64세 이상 가족수를 입력해주세요.", function(){
						fnTabCheck("tab1_focus");
						$('#overAge64FamilyCnt').focus();
					});
					return false;
				}

				if(disablYn == "" || typeof disablYn == "undefined"){
					alertify.alert("장애여부를 입력해주세요.", function(){
						fnTabCheck("tab1_focus");
						$('#disablYn_focus').focus();
					});
					return false;
				}

				if(disablYn == 'Y' && disablOptionCdList.length == 0){

					alertify.alert(resumeDisableMsg, function(){
						fnTabCheck("tab1_focus");
						$('#disablYn_focus').focus();
					});
					return false;
				}

				if(selfempYn == "" || typeof selfempYn == "undefined"){
					alertify.alert("자영업 여부를 선택하세요.", function(){
						fnTabCheck("tab1_focus");
						$('#selfempYn_focus').focus();
					});
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
					hopeWorkLocObj.addrFullCd = $(this).find('input[name=hopeLocFullCd]').val();
					hopeWorkLocObj.addrFullNm = $(this).find('input[name=hopeLocFullNm]').val();

					hopeWorkLocList.push(hopeWorkLocObj);
				});

				var iscoList = [];
				$('#span_isco').find('span').each(function(){
					var iscoObj = new Object();
					iscoObj.iscoCd = $(this).find('input[name=iscoCd]').val();
					iscoObj.iscoFullCd = $(this).find('input[name=iscoFullCd]').val();
					iscoObj.iscoFullNm = $(this).find('input[name=iscoFullNm]').val();
					iscoObj.iscoUpperCd = $(this).find('input[name=iscoUpperCd]').val();

					iscoList.push(iscoObj);
				});

				if(preferJobTitle == ""){
					alertify.alert("희망직업을 입력하세요.", function(){
						fnTabCheck("tab2_focus");
						$('#preferJobTitle').focus();
					});
					return false;
				}

				if(preferPosition == ""){
					alertify.alert("직책을 입력하세요.", function(){
						fnTabCheck("tab2_focus");
						$('#preferPosition').focus();
					});
					return false;
				}

				if(iscoList.length == 0){
					alertify.alert("희망직종을 선택하세요.", function(){
						fnTabCheck("tab2_focus");
						$('#hopeJob_focus').focus();
					});
					return false;
				}

				if(hopeWorkLocList.length == 0){
					alertify.alert("희망지역을 선택하세요.", function(){
						fnTabCheck("tab2_focus");
						$('#hopeLocCd_focus').focus();
					});
					return false;
				}

				if(employFormCd == ""){
					alertify.alert("희망 고용 형태를 선택하세요.", function(){
						fnTabCheck("tab2_focus");
						$('#employFormCd_focus').focus();
					});
					return false;
				}

				if(preferEmployTypeCd == "" || typeof preferEmployTypeCd == "undefined"){
					alertify.alert("희망 고용 type를 선택하세요.", function(){
						fnTabCheck("tab2_focus");
						$('#preferEmployTypeCd_focus').focus();
					});
					return false;
				}

				if(preferEmployTypeCd == "PET0000000002" && typeEmployHourDay == ""){
					alertify.alert("희망 근무시간을 선택하세요.", function(){
						fnTabCheck("tab2_focus");
						$('#typeEmployHourDay').focus();
					});
					return false;
				}

				if(preferEmployTypeCd == "PET0000000002" && typeEmployDayWeek == ""){
					alertify.alert("희망 근무일수를 선택하세요.", function(){
						fnTabCheck("tab2_focus");
						$('#typeEmployDayWeek').focus();
					});
					return false;
				}

				if(preferEmployTypeCd == "PET0000000002" && preferDayMon == "N" && preferDayTue == "N" && preferDayWed == "N" && preferDayThu == "N"
					&& preferDayFri == "N" && preferDaySat == "N" && preferDaySun == "N"){

					alertify.alert("희망 근무요일을 선택하세요.", function(){
						fnTabCheck("tab2_focus");
						$('#preferDayMon').focus();
					});
					return false;
				}

				var preferDayCnt = 0;

				if(preferDayMon == "Y"){
					preferDayCnt ++;
				}

				if(preferDayTue == "Y"){
					preferDayCnt ++;
				}

				if(preferDayWed == "Y"){
					preferDayCnt ++;
				}

				if(preferDayThu == "Y"){
					preferDayCnt ++;
				}

				if(preferDayFri == "Y"){
					preferDayCnt ++;
				}

				if(preferDaySat == "Y"){
					preferDayCnt ++;
				}

				if(preferDaySun == "Y"){
					preferDayCnt ++;
				}

				if($('#typeEmployDayWeek').val() != preferDayCnt){
					alertify.alert("희망 근무일 수와 선택한 희망근무요일 수가 같지 않습니다.", function(){
						fnTabCheck("tab2_focus");
						$('#typeEmployDayWeek').focus();
					});
					return false;
				}

				if(preferCrtctType == "" || typeof preferCrtctType == "undefined"){
					alertify.alert("희망 계약형태를 선택하세요.", function(){
						fnTabCheck("tab2_focus");
						$('#preferCrtctType_focus').focus();
					});
					return false;
				}

				if(expctMinSalaryAmt == ""){
					alertify.alert("희망 최소급여를 선택하세요.", function(){
						fnTabCheck("tab2_focus");
						$('#expctMinSalaryAmt').focus();
					});
					return false;
				}

				if(expctMaxSalaryAmt == ""){
					alertify.alert("희망 최대급여를 선택하세요.", function(){
						fnTabCheck("tab2_focus");
						$('#expctMaxSalaryAmt').focus();
					});
					return false;
				}

				if(diffProvcWorkYn == "" || typeof diffProvcWorkYn == "undefined"){
					alertify.alert("타지근무 가능여부를 선택하세요.", function(){
						fnTabCheck("tab2_focus");
						$('#diffProvcWorkYn_focus').focus();
					});
					return false;
				}

				if(workBgnAbleYn == "" || typeof workBgnAbleYn == "undefined"){
						alertify.alert("근무 시작 가능일", function(){
							fnTabCheck("tab2_focus");
   						$('#workBgnAbleYn_focus').focus();
   					});
   					return false;
				}

				if(workBgnAbleYn == "N" && workBgnAbleWithin == ""){
					alertify.alert("근무 시작 가능 개월을 입력하세요.", function(){
						fnTabCheck("tab2_focus");
   						$('#workBgnAbleWithin').focus();
   					});
   					return false;
				}

				// ~ 희망근무 조건 입력 여부 체크

				// 학력 및 전문 훈련 입력 여부 체크
				var eduDegreeCd = $('input[name=eduDegreeCd]').val();

				if(eduDegreeCd == ""){

					alertify.alert(resumeGradeMsg, function(){
						fnTabCheck("tab3_focus");
						$('#eduDegreeCd_focus').focus();
					});
					return false;
				}
				// ~ 학력 및 전문 훈련 입력 여부 체크

				// 연구 및 전문분야 입력 여부 체크

				var ss_formList = [];
				var ss_flag = false;
				var ss_focus = null;
				$('#ss_form').find('.form_contents').each(function(){
					var ss_specialStudyNm = $(this).find('input[name=ss_specialStudyNm]').val();
					var ss_bgnDt_mm = $(this).find('input[name=ss_bgnDt_mm]').val();
					var ss_bgnDt_yy = $(this).find('input[name=ss_bgnDt_yy]').val();
					var ss_endDt_mm = $(this).find('input[name=ss_endDt_mm]').val();
					var ss_endDt_yy = $(this).find('input[name=ss_endDt_yy]').val();
					var ss_insttNm = $(this).find('input[name=ss_insttNm]').val();
					var ss_cntryCd = $(this).find('input[name=ss_cntryCd]').val();
					var ss_provcCd = $(this).find('input[name=ss_provcCd]').val();

					if(ss_specialStudyNm != "" && ss_bgnDt_mm != "" && ss_bgnDt_yy != "" && ss_endDt_mm != "" && ss_endDt_yy != ""
						&& ss_insttNm != "" && ss_cntryCd != "" && ss_provcCd != ""){

						var ss_formObj = new Object();
						ss_formObj.specialStudyNm = ss_specialStudyNm;
						ss_formObj.bgnDt = ss_bgnDt_yy + "-" + ss_bgnDt_mm + "-01";
						ss_formObj.endDt = ss_endDt_yy + "-" + ss_endDt_mm + "-01";
						ss_formObj.insttNm = ss_insttNm;
						ss_formObj.cntryCd = ss_cntryCd;
						ss_formObj.provcCd = ss_provcCd;

						ss_formList.push(ss_formObj);
					}else if(ss_specialStudyNm == "" && ss_bgnDt_mm == "" && ss_bgnDt_yy == "" && ss_endDt_mm == "" && ss_endDt_yy == ""
						&& ss_insttNm == "" && ss_cntryCd == "" && ss_provcCd == ""){

					}else{
						ss_focus = $(this).find('input[name=ss_specialStudyNm]');
						ss_flag = true;
						return false;
					}
				});

				if(ss_flag){
					alertify.alert(resumeSpecialtyMsg, function(){
    					fnTabCheck("tab4_focus");
    					ss_focus.focus();
					});
					return false;
				}

				if(ss_formList.length == 0){

					alertify.alert(resumeSpecialtyLessMsg, function(){
						fnTabCheck("tab4_focus");
						$('#tab4_focus').focus();
					});
					return false;
				}

				// ~ 연구 및 전문분야 입력 여부 체크

				// 자격증 보유 여부
				var tot_proLicnsSpec = "";
				var proLicnsYn = "N";
				$('#proLicnsSpec_form').find('.form_contents').each(function(){
					var proLicnsSpec = $(this).find('input[name=proLicnsSpec]').val();

					if(tot_proLicnsSpec == ""){
						tot_proLicnsSpec += proLicnsSpec;
					}else{
						tot_proLicnsSpec += "," + proLicnsSpec;
					}

				});

				if(tot_proLicnsSpec != ""){
					proLicnsYn = "Y";
				}

				// ~ 자격증 보유 여부

				// 기타교육
				var ot_formList = [];
				var ot_flag = false;
				var ot_focus = null;
				$('#ot_form').find('.form_contents').each(function(){
					var ot_trnngEduDegreeCd = $(this).find('input[name=ot_trnngEduDegreeCd]').val();
					var ot_iscedCd          = $(this).find('input[name=ot_iscedCd]').val();
					var ot_insttNm          = $(this).find('input[name=ot_insttNm]').val();
					var ot_addrProvcCd      = $(this).find('input[name=ot_addrProvcCd]').val();
					var ot_bgnDt_mm         = $(this).find('input[name=ot_bgnDt_mm]').val();
					var ot_bgnDt_yy         = $(this).find('input[name=ot_bgnDt_yy]').val();
					var ot_endDt_mm         = $(this).find('input[name=ot_endDt_mm]').val();
					var ot_endDt_yy         = $(this).find('input[name=ot_endDt_yy]').val();

					if(ot_trnngEduDegreeCd != "" && ot_iscedCd != "" && ot_insttNm != "" && ot_addrProvcCd != "" && ot_bgnDt_mm != ""
						&& ot_bgnDt_yy != "" && ot_endDt_mm != "" && ot_endDt_yy != ""){

						var ot_formObj = new Object();
						ot_formObj.trnngEduDegreeCd = ot_trnngEduDegreeCd;
						ot_formObj.iscedCd = ot_iscedCd;
						ot_formObj.insttNm = ot_insttNm;
						ot_formObj.addrProvcCd = ot_addrProvcCd;
						ot_formObj.bgnDt = ot_bgnDt_yy + "-" + ot_bgnDt_mm + "-01";
						ot_formObj.endDt = ot_endDt_yy + "-" + ot_endDt_mm + "-01";

						ot_formList.push(ot_formObj);
					}else if(ot_trnngEduDegreeCd == "" && ot_iscedCd == "" && ot_insttNm == "" && ot_addrProvcCd == "" && ot_bgnDt_mm == ""
						&& ot_bgnDt_yy == "" && ot_endDt_mm == "" && ot_endDt_yy == ""){

					}else{

						ot_focus = $(this).find('input[name=ot_trnngEduDegreeCd]');
						ot_flag = true;
						return false;
					}
				});

				if(ot_flag){
					alertify.alert(resumeOtherMsg, function(){
						fnTabCheck("tab6_focus");
						ot_focus.focus();
					});
					return false;
				}

				if(ot_formList.length == 0){

					alertify.alert(resumeOtherLessMsg, function(){
						fnTabCheck("tab6_focus");
						$('#tab6_focus').focus();
					});
					return false;
				}

				// ~ 기타 교육

				// 어학
				var rl_formList = [];
				var rl_false = false;
				var rl_focus = null;
				var rl_langCd_native = $('#rl_langCd_native').val();

				if(rl_langCd_native == ""){
					alertify.alert(resumeNationalLanguageMsg, function(){
						fnTabCheck("tab7_focus");
						$('#rl_langCd_native_focus').focus();
					});
					return false;
				}

				var rl_formObj_native = new Object();
				rl_formObj_native.langCd = rl_langCd_native;
				rl_formObj_native.langTypeCd = "Native";

				$('.rl_form').each(function(){
					var rl_langCd = $(this).find('input[name=rl_langCd]').val();
					var rl_langLvlCd = $(this).find('input[name=rl_langLvlCd]').val();

					if(rl_langCd != "" && rl_langLvlCd != ""){

						var rl_formObj = new Object();
						rl_formObj.langCd = rl_langCd;
						rl_formObj.langLvlCd = rl_langLvlCd;
						rl_formObj.langTypeCd = "Foreign Language";

						rl_formList.push(rl_formObj);
					}else if(rl_langCd == "" && rl_langLvlCd == ""){

					}else{
						rl_focus = $(this).find('.langCd_focus');
						rl_false = true;
					}
				});

				if(rl_false){
					alertify.alert(resumeLanguageMsg, function(){
						fnTabCheck("tab7_focus");
						rl_focus.focus();
					});
					return false;
				}

				if(rl_formList.length == 0){
					alertify.alert(resumeLanguageLessMsg, function(){
						fnTabCheck("tab7_focus");
						$('#tab7_focus').focus();
					});
					return false;
				}else{
					rl_formList.push(rl_formObj_native);
				}

				// ~ 어학

				// 경력
				var careerYn = "N";
				var totCareerTermYearCnt = $('.totYear').html();
				var totCareerTermMonthCnt = $('.totMonths').html();

				if(totCareerTermYearCnt == ""){
					totCareerTermYearCnt = "0";
				}

				if(totCareerTermMonthCnt == ""){
					totCareerTermMonthCnt = "0";
				}

				if(totCareerTermYearCnt != "0" || totCareerTermMonthCnt != "0"){
					careerYn = "Y";
				}

				var exp_formList = [];
				var exp_flag = false;
				var exp_focus = null;
				$('.exp_form').each(function(){
					//직급/직책 컬럼없음
					var exp_orgnzNm     = (typeof $(this).find('input[name=exp_orgnzNm]').val() == "undefined") ? "" : $(this).find('input[name=exp_orgnzNm]').val();
					var exp_iscoCd      = (typeof $(this).find('input[name=exp_iscoCd]').val() == "undefined") ? "" : $(this).find('input[name=exp_iscoCd]').val();
					var exp_selfempYn   = (typeof $(this).find('.exp_selfempYn:checked').val() == "undefined") ? "" : $(this).find('.exp_selfempYn:checked').val();
					var exp_bgnDt_mm    = (typeof $(this).find('input[name=exp_bgnDt_mm]').val() == "undefined") ? "" : $(this).find('input[name=exp_bgnDt_mm]').val();
					var exp_bgnDt_yy    = (typeof $(this).find('input[name=exp_bgnDt_yy]').val() == "undefined") ? "" : $(this).find('input[name=exp_bgnDt_yy]').val();
					var exp_endDt_mm    = (typeof $(this).find('input[name=exp_endDt_mm]').val() == "undefined") ? "" : $(this).find('input[name=exp_endDt_mm]').val();
					var exp_endDt_yy    = (typeof $(this).find('input[name=exp_endDt_yy]').val() == "undefined") ? "" : $(this).find('input[name=exp_endDt_yy]').val();
					var exp_leaveReason = (typeof $(this).find('input[name=exp_leaveReason]').val() == "undefined") ? "" : $(this).find('input[name=exp_leaveReason]').val();

					if(exp_orgnzNm != "" && exp_iscoCd != "" && exp_selfempYn != "" && exp_bgnDt_mm != "" && exp_bgnDt_yy != ""
						&& exp_endDt_mm != "" && exp_endDt_yy != "" && exp_leaveReason != ""){

						var exp_formObj = new Object();
						exp_formObj.orgnzNm = exp_orgnzNm;
						exp_formObj.iscoCd = exp_iscoCd;
						exp_formObj.selfempYn = exp_selfempYn;
						exp_formObj.bgnDt = exp_bgnDt_yy + "-" + exp_bgnDt_mm + "-01";
						exp_formObj.endDt = exp_endDt_yy + "-" + exp_endDt_mm + "-01";
						exp_formObj.leaveReason = exp_leaveReason;

						exp_formList.push(exp_formObj);
					}else if(exp_orgnzNm == "" && exp_iscoCd == "" && exp_selfempYn == "" && exp_bgnDt_mm == "" && exp_bgnDt_yy == ""
						&& exp_endDt_mm == "" && exp_endDt_yy == "" && exp_leaveReason == ""){

					}else{
						exp_focus = $(this).find('input[name=exp_orgnzNm]');
						exp_flag = true;
					}
				});

				if(exp_flag){
					alertify.alert(resumeCareerMsg, function(){
						fnTabCheck("tab8_focus");
						exp_focus.focus();
					});
					return false;
				}

				// ~ 경력

				// skill
				var sk_formList = [];
				$('.sk_form').find('input[name=sk_skillCd]:checked').each(function(){
					sk_formList.push($(this).val());
				});
				// ~ skill

				// 추천인
				var ref_formList = [];
				var ref_flag = false;
				var ref_focus = null;
				$('.ref_form').each(function(){
					var ref_nm       = (typeof $(this).find('input[name=ref_nm]').val() == "undefined") ? "" : $(this).find('input[name=ref_nm]').val();
					var ref_orgnzNm  = (typeof $(this).find('input[name=ref_orgnzNm]').val() == "undefined") ? "" : $(this).find('input[name=ref_orgnzNm]').val();
					var ref_position = (typeof $(this).find('input[name=ref_position]').val() == "undefined") ? "" : $(this).find('input[name=ref_position]').val();
					var ref_ref      = (typeof $(this).find('input[name=ref_ref]').val() == "undefined") ? "" : $(this).find('input[name=ref_ref]').val();
					var ref_cell     = (typeof $(this).find('input[name=ref_cell]').val() == "undefined") ? "" : $(this).find('input[name=ref_cell]').val();
					var ref_email    = (typeof $(this).find('input[name=ref_email]').val() == "undefined") ? "" : $(this).find('input[name=ref_email]').val();
					var ref_addrFullNm   = (typeof $(this).find('input[name=ref_addrFullNm]').val() == "undefined") ? "" : $(this).find('input[name=ref_addrFullNm]').val();
					var ref_addrFullCd   = (typeof $(this).find('input[name=ref_addrFullCd]').val() == "undefined") ? "" : $(this).find('input[name=ref_addrFullCd]').val();
					var ref_addrCd   = (typeof $(this).find('input[name=ref_addrCd]').val() == "undefined") ? "" : $(this).find('input[name=ref_addrCd]').val();
					var ref_addrDtl  = (typeof $(this).find('input[name=ref_addrDtl]').val() == "undefined") ? "" : $(this).find('input[name=ref_addrDtl]').val();

					if(ref_nm != "" && ref_orgnzNm != "" && ref_position != "" && ref_ref != "" && ref_cell != "" && ref_email != ""
						&& ref_addrFullNm != "" && ref_addrFullCd != "" && ref_addrCd != "" && ref_addrDtl != ""){

						var ref_formObj = new Object();

						ref_formObj.nm = ref_nm;
						ref_formObj.orgnzNm = ref_orgnzNm;
						ref_formObj.position = ref_position;
						ref_formObj.ref = ref_ref;
						ref_formObj.cell = ref_cell;
						ref_formObj.email = ref_email;
						ref_formObj.addrFullNm = ref_addrFullNm;
						ref_formObj.addrCd = ref_addrCd;
						ref_formObj.addrFullCd = ref_addrFullCd;
						ref_formObj.addrDtl = ref_addrDtl;


						ref_formList.push(ref_formObj);
					}else if(ref_nm == "" && ref_orgnzNm == "" && ref_position == "" && ref_ref == "" && ref_cell == "" && ref_email == ""
						&& ref_addrFullNm == "" && ref_addrFullCd == "" && ref_addrCd == "" && ref_addrDtl == ""){

					}else{
						ref_focus = $(this).find('input[name=ref_nm]');
						ref_flag = true;
					}
				});

				if(ref_flag){
					alertify.alert(resumeReferrerMsg, function(){
						fnTabCheck("tab11_focus");
						ref_focus.focus();
					});
					return false;
				}
				// ~ 추천인

				// 약관 동의
				if(!$('#agree').prop('checked')){
					alertify.alert(resumeAgreeMsg, function(){
						fnTabCheck("tab12_focus");
						$('#agree').focus();
					});
					return false;
				}

    			alertify.confirm("이력서를 등록하시겠습니까?", function(e){
					if(e){
	    				var updateFlag = $('#updateFlag').val();

	    				// 사용자 이미지 수정
	    				if($('#uploadImgFile').val() != ""){
	    					var form = $('#imgUploadForm')[0];
	        				var formData = new FormData(form);
	        				formData.append("uploadFile", $('#uploadImgFile')[0].files[0]);
	        				formData.append("resumeSeq", $('#resumeSeq').val());

	        				$.ajax({
	        					type: 'post',
	        					url: contextPath + "/cpes/private/resume/updateUserImg.do",
	        					dataType: 'json',
	        					data: formData,
	        					contentType: false,
	        					processData: false,
	        					success: function(data) {

	        					}
	        				});
	    				}

	    				$.ajax({
	    					type: 'post',
	    					url: contextPath + "/cpes/private/resume/saveResumeUptOrCopyAjax.do",
	    					dataType: 'json',
	    					data: {
	    						"resumeSeq" : $('#resumeSeq').val(),
	    						"resumeTitle" : profile_title,
	    						"addrFullNm" : addrFullNm,
	    						"addrFullCd" : addrFullCd,
	    						"addrCd" : addrCd,
	    						"marriCd" : marriCd,
	    						"familyCnt" : familyCnt,
	    						"underAge15FamilyCnt" : underAge15FamilyCnt,
	    						"overAge64FamilyCnt" : overAge64FamilyCnt,
	    						"disablYn" : disablYn,
	    						"selfempYn" : selfempYn,
	    						"frstimeJobSeekerYn" : frstimeJobSeekerYn,
	    						"studyingYn" : studyingYn,
	    						"retMigratYn" : retMigratYn,
	    						"srvcYn" : srvcYn,
	    						"ethnicMinorYn" : ethnicMinorYn,
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
	    						"proLicnsYn" : proLicnsYn,
	    						"proLicnsSpec" : tot_proLicnsSpec,
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
	    						"resumeKeyword" : keywordArr,
	    						"careerYn" : careerYn,
	    						"totCareerTermYearCnt" : totCareerTermYearCnt,
	    						"totCareerTermMonthCnt" : totCareerTermMonthCnt,
	    						"priResumeYn" : $('#priResumeYn').val(),
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
					}
    			});
    		});

    		// 임시저장 - 필수입력체크 하지않음
    		$('#btn_tempSave').on('click', function(){
    			var profile_title = $('#profile_title').val();

    			if(profile_title == ""){
					alertify.alert(resumeTitleMsg, function(){
						$('#profile_title').focus();
					});
					return false;
				}

				// 인적 사항 입력 여부 체크
				var addrFullNm = $('input[name=addrFullNm]').val();
				var addrFullCd = $('input[name=addrFullCd]').val();
				var addrCd = $('input[name=addrCd]').val();
				var marriCd = $('#marriCd').val();
				var familyCnt = ($('#familyCnt').val() == "") ? 0 : $('#familyCnt').val();
				var underAge15FamilyCnt = ($('#underAge15FamilyCnt').val() == "") ? 0 : $('#underAge15FamilyCnt').val();
				var overAge64FamilyCnt  = ($('#overAge64FamilyCnt').val() == "") ? 0 : $('#overAge64FamilyCnt').val();
				var disablYn            = ($('input[name=disablYn]').val() == 'Y') ? 'Y' : 'N';
				var selfempYn           = ($('input[name=selfempYn]').val() == 'Y') ? 'Y' : 'N';
				var frstimeJobSeekerYn = ($('#frstimeJobSeekerYn:checked').val() == 'Y') ? 'Y' : 'N';
				var studyingYn = ($('#studyingYn:checked').val() == 'Y') ? 'Y' : 'N';
				var retMigratYn = ($('#retMigratYn:checked').val() == 'Y') ? 'Y' : 'N';
				var srvcYn = ($('#srvcYn:checked').val() == 'Y') ? 'Y' : 'N';
				var ethnicMinorYn = ($('#ethnicMinorYn:checked').val() == 'Y') ? 'Y' : 'N';
				/* var urgentJobseekYn     = ($('input[name=urgentJobseekYn]').val() == 'Y') ? 'Y' : 'N'; */

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
					hopeWorkLocObj.addrFullCd = $(this).find('input[name=hopeLocFullCd]').val();
					hopeWorkLocObj.addrFullNm = $(this).find('input[name=hopeLocFullNm]').val();

					hopeWorkLocList.push(hopeWorkLocObj);
				});

				var iscoList = [];
				$('#span_isco').find('span').each(function(){
					var iscoObj = new Object();
					iscoObj.iscoCd = $(this).find('input[name=iscoCd]').val();
					iscoObj.iscoFullCd = $(this).find('input[name=iscoFullCd]').val();
					iscoObj.iscoFullNm = $(this).find('input[name=iscoFullNm]').val();
					iscoObj.iscoUpperCd = $(this).find('input[name=iscoUpperCd]').val();

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
				var tot_proLicnsSpec = "";
				var proLicnsYn = "N";
				$('#proLicnsSpec_form').find('.form_contents').each(function(){
					var proLicnsSpec = $(this).find('input[name=proLicnsSpec]').val();

					if(tot_proLicnsSpec == ""){
						tot_proLicnsSpec += proLicnsSpec;
					}else{
						tot_proLicnsSpec += "," + proLicnsSpec;
					}

				});

				if(tot_proLicnsSpec != ""){
					proLicnsYn = "Y";
				}

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
				var rl_formList = [];
				var rl_langCd_native = $('#rl_langCd_native').val();

				var rl_formObj_native = new Object();
				rl_formObj_native.langCd = rl_langCd_native;
				rl_formObj_native.langTypeCd = "Native";

				$('.rl_form').each(function(){
					var rl_langCd = $(this).find('input[name=rl_langCd]').val();
					var rl_langLvlCd = $(this).find('input[name=rl_langLvlCd]').val();

					var rl_formObj = new Object();
					rl_formObj.langCd = rl_langCd;
					rl_formObj.langLvlCd = rl_langLvlCd;
					rl_formObj.langTypeCd = "Foreign Language";

					rl_formList.push(rl_formObj);
				});

				rl_formList.push(rl_formObj_native);

				// ~ 어학

				// 경력
				var careerYn = "N";
				var totCareerTermYearCnt = $('.totYear').html();
				var totCareerTermMonthCnt = $('.totMonths').html();

				if(totCareerTermYearCnt == ""){
					totCareerTermYearCnt = "0";
				}

				if(totCareerTermMonthCnt == ""){
					totCareerTermMonthCnt = "0";
				}

				if(totCareerTermYearCnt != "0" || totCareerTermMonthCnt != "0"){
					careerYn = "Y";
				}

				var exp_formList = [];
				$('.exp_form').each(function(){
					//직급/직책 컬럼없음
					var exp_orgnzNm     = (typeof $(this).find('input[name=exp_orgnzNm]').val() == "undefined") ? "" : $(this).find('input[name=exp_orgnzNm]').val();
   					var exp_iscoCd      = (typeof $(this).find('input[name=exp_iscoCd]').val() == "undefined") ? "" : $(this).find('input[name=exp_iscoCd]').val();
   					var exp_selfempYn   = (typeof $(this).find('.exp_selfempYn:checked').val() == "undefined") ? "" : $(this).find('.exp_selfempYn:checked').val();
   					var exp_bgnDt_mm    = (typeof $(this).find('input[name=exp_bgnDt_mm]').val() == "undefined") ? "00" : $(this).find('input[name=exp_bgnDt_mm]').val();
   					var exp_bgnDt_yy    = (typeof $(this).find('input[name=exp_bgnDt_yy]').val() == "undefined") ? "0000" : $(this).find('input[name=exp_bgnDt_yy]').val();
   					var exp_endDt_mm    = (typeof $(this).find('input[name=exp_endDt_mm]').val() == "undefined") ? "00" : $(this).find('input[name=exp_endDt_mm]').val();
   					var exp_endDt_yy    = (typeof $(this).find('input[name=exp_endDt_yy]').val() == "undefined") ? "0000" : $(this).find('input[name=exp_endDt_yy]').val();
   					var exp_leaveReason = (typeof $(this).find('input[name=exp_leaveReason]').val() == "undefined") ? "" : $(this).find('input[name=exp_leaveReason]').val();

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
					var ref_nm       = (typeof $(this).find('input[name=ref_nm]').val() == "undefined") ? "" : $(this).find('input[name=ref_nm]').val();
					var ref_orgnzNm  = (typeof $(this).find('input[name=ref_orgnzNm]').val() == "undefined") ? "" : $(this).find('input[name=ref_orgnzNm]').val();
					var ref_position = (typeof $(this).find('input[name=ref_position]').val() == "undefined") ? "" : $(this).find('input[name=ref_position]').val();
					var ref_ref      = (typeof $(this).find('input[name=ref_ref]').val() == "undefined") ? "" : $(this).find('input[name=ref_ref]').val();
					var ref_cell     = (typeof $(this).find('input[name=ref_cell]').val() == "undefined") ? "" : $(this).find('input[name=ref_cell]').val();
					var ref_email    = (typeof $(this).find('input[name=ref_email]').val() == "undefined") ? "" : $(this).find('input[name=ref_email]').val();
					var ref_addrFullNm   = (typeof $(this).find('input[name=ref_addrFullNm]').val() == "undefined") ? "" : $(this).find('input[name=ref_addrFullNm]').val();
					var ref_addrFullCd   = (typeof $(this).find('input[name=ref_addrFullCd]').val() == "undefined") ? "" : $(this).find('input[name=ref_addrFullCd]').val();
					var ref_addrCd   = (typeof $(this).find('input[name=ref_addrCd]').val() == "undefined") ? "" : $(this).find('input[name=ref_addrCd]').val();
					var ref_addrDtl  = (typeof $(this).find('input[name=ref_addrDtl]').val() == "undefined") ? "" : $(this).find('input[name=ref_addrDtl]').val();

					var ref_formObj = new Object();

					ref_formObj.nm = ref_nm;
					ref_formObj.orgnzNm = ref_orgnzNm;
					ref_formObj.position = ref_position;
					ref_formObj.ref = ref_ref;
					ref_formObj.cell = ref_cell;
					ref_formObj.email = ref_email;
					ref_formObj.addrFullNm = ref_addrFullNm;
					ref_formObj.addrCd = ref_addrCd;
					ref_formObj.addrFullCd = ref_addrFullCd;
					ref_formObj.addrDtl = ref_addrDtl;


					ref_formList.push(ref_formObj);
				});
				// ~ 추천인

				// 사용자 이미지 수정
				/* if($('#uploadImgFile').val() != ""){
   					var form = $('#imgUploadForm')[0];
   					var formData = new FormData(form);
   					formData.append("uploadFile", $('#uploadImgFile')[0].files[0]);

   					$.ajax({
   						type: 'post',
   						url: contextPath + "/cpes/private/updateUserImg.do",
   						dataType: 'json',
   						data: formData,
   						contentType: false,
   						processData: false,
   						success: function(data) {

   						}
   					});
   				} */

   				alertify.confirm("이력서를 임시 저장하시겠습니까?", function(e){
					if(e){
						$.ajax({
							type: 'post',
							url: contextPath + "/cpes/private/resume/saveResumeUptOrCopyAjax.do",
							dataType: 'json',
							data: {
								"resumeSeq" : $('#resumeSeq').val(),
								"resumeTitle" : profile_title,
								"addrFullNm" : addrFullNm,
								"addrFullCd" : addrFullCd,
								"addrCd" : addrCd,
								"marriCd" : marriCd,
								"familyCnt" : familyCnt,
								"underAge15FamilyCnt" : underAge15FamilyCnt,
								"overAge64FamilyCnt" : overAge64FamilyCnt,
								"disablYn" : disablYn,
								"selfempYn" : selfempYn,
								"frstimeJobSeekerYn" : frstimeJobSeekerYn,
								"studyingYn" : studyingYn,
								"retMigratYn" : retMigratYn,
								"srvcYn" : srvcYn,
								"ethnicMinorYn" : ethnicMinorYn,
								/* "urgentJobseekYn" : urgentJobseekYn, */
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
								"proLicnsYn" : proLicnsYn,
								"proLicnsSpec" : tot_proLicnsSpec,
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
								"resumeKeyword" : keywordArr,
								"careerYn" : careerYn,
								"totCareerTermYearCnt" : totCareerTermYearCnt,
								"totCareerTermMonthCnt" : totCareerTermMonthCnt,
								"priResumeYn" : $('#priResumeYn').val(),
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
    		iscoHtml += "<input type='hidden' name='iscoFullNm' value='" + json.commonFullNm + "'/>";
    		iscoHtml += "<input type='hidden' name='iscoFullCd' value='" + json.commonFullCd + "'/>";
    		iscoHtml += "<input type='hidden' name='iscoUpperCd' value='" + json.upperCd + "'/>";
    		iscoHtml += '<button type="button" class="delete">delete</button></span>';
			$('#span_isco').append(iscoHtml);
			$('#span_isco').closest('.form_element').addClass('active');
			fnScriptReset();
    	}

    	function fnAddrCdSet(json){
    		var addrHtml = "<span>" + json.commonFullNm + "<input type='hidden' name='addrCd' value='" + json.commonCd + "'/>";
    		addrHtml += "<input type='hidden' name='addrFullNm' value='" + json.commonFullNm + "'/>";
    		addrHtml += "<input type='hidden' name='addrFullCd' value='" + json.commonFullCd + "'/>";
    		addrHtml += "<button type='button'>delete</button></span>";

			$('#span_addr').html(addrHtml);
			$('#span_addr').closest('.form_element').addClass('active');
			fnScriptReset();
    	}

    	function fnHopeLocSet(json){
    		var addrHtml = "<span>" + json.commonNm + "<input type='hidden' name='hopeLocCd' value='" + json.commonCd + "'/>";
    		addrHtml += "<input type='hidden' name='hopeLocFullNm' value='" + json.commonFullNm + "'/>";
    		addrHtml += "<input type='hidden' name='hopeLocFullCd' value='" + json.commonFullCd + "'/>";
    		addrHtml += "<button type='button'>delete</button></span>";

			$('#span_hopeLoc').append(addrHtml);
			$('#span_hopeLoc').closest('.form_element').addClass('active');
			fnScriptReset();
    	}

    	function fnDeleteKeyword(obj) {
    		var val = $(obj).val();

    		keywordList = $.grep(keywordList, function(value) {
    			  return value != val;
    		});

    		var keywordTemp = keywordArr.split(",");
    		keywordArr = "";
    		for(var i in keywordTemp){
    			if(keywordTemp[i] != val){
	    			if(keywordArr == ""){
	    				keywordArr += keywordTemp[i];
	    			}else{
	    				keywordArr += "," + keywordTemp[i];
	    			}
    			}
    		}

    	}

    	function fnTabCheck(id){
    		var formWrap = $('#' + id).closest('.form_wrap');

    		if(!formWrap.hasClass('active')){
    			formWrap.addClass('active');
    		}
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
			<input type="hidden" id="priResumeYn" name="priResumeYn" value="${resumeDetail.priResumeYn }">
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
					<c:choose>
						<c:when test="${not empty resumeDetail.filePath }">
							<button id="btn_imgAdd" type="button" class="photo add_photo btn_fileSelect" style="display: none;">Add Photo</button>
							<img id="uploadImg" src="${pageContext.request.contextPath}/common/imgLoading.do?url=${resumeDetail.filePath}" alt="" class="photo" />
							<button id="btn_imgModify" type="button" class="modify_photo btn_fileSelect" >Modify Photo</button>
						</c:when>
						<c:otherwise>
							<button id="btn_imgAdd" type="button" class="photo add_photo btn_fileSelect" />Add Photo</button>
							<img id="uploadImg" src="../../images/board/dummy_photo.png" alt="" class="photo" style="display: none;"/>
							<button id="btn_imgModify" type="button" class="modify_photo btn_fileSelect" style="display: none;">Modify Photo</button>
						</c:otherwise>
					</c:choose>
					<form id="imgUploadForm">
						<input type="file" id="uploadImgFile" name="uploadImgFile" style="display: none;">
					</form>
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
								<form id="memberChangeFrm" action="${pageContext.request.contextPath}/cpes/private/member/modify.do" method="post">
									<a href="javascript:fnGoWrite('memberChangeFrm');" class="btn check noround">Change Personal Info</a>
								</form>
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
					<button type="button" class="open" id="tab1_focus">open for contents view</button>
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
								<span class="text_box" id="span_addr">
									<c:if test="${not empty resumeDetail.addrFullCd && not empty resumeDetail.addrFullNm}">
										<span>
											<c:out value="${resumeDetail.addrFullNm}" escapeXml="false"/>
											<input type='hidden' name='addrCd' value='${resumeDetail.addrCd}' />
											<input type='hidden' name="addrFullNm" value="${resumeDetail.addrFullNm}"/>
											<input type='hidden' name="addrFullCd" value="${resumeDetail.addrFullCd}"/>
											<button type='button'>delete</button>
										</span>
									</c:if>
								</span>
							</div>
							<button type="button" id="addr_focus" class="open popup_addr" onclick="callback(fnAddrCdSet, 'addr');" title="Open selection box"><span>Location Selection</span></button>
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
								<button type="button" class="text_box open" title="Open selection box" id="marriCd_focus">
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
								<span class="label"><spring:message code="resume.text.checkList"/></span>
								<span class="text_box"></span>
							</div>
							<div class="check_box">
								<ul class="clearfix">
								<li>
									<span>
										<input type="checkbox" id="frstimeJobSeekerYn" value="Y" <c:if test="${resumeDetail.frstimeJobSeekerYn eq 'Y' }">data-clickflag="true"</c:if>/>
										<label for="frstimeJobSeekerYn"><spring:message code="resume.text.firstJob"/></label>
									</span>
								</li>
								<li>
									<span>
										<input type="checkbox" id="studyingYn" value="Y" <c:if test="${resumeDetail.studyingYn eq 'Y' }">data-clickflag="true"</c:if>/>
										<label for="studyingYn"><spring:message code="resume.text.studyingYn"/></label>
									</span>
								</li>
								<li>
									<span>
										<input type="checkbox" id="retMigratYn" value="Y" <c:if test="${resumeDetail.retMigratYn eq 'Y' }">data-clickflag="true"</c:if>/>
										<label for="retMigratYn"><spring:message code="resume.text.retMigratYn"/></label>
									</span>
								</li>
								<li>
									<span>
										<input type="checkbox" id="srvcYn" value="Y" <c:if test="${resumeDetail.srvcYn eq 'Y' }">data-clickflag="true"</c:if>/>
										<label for="srvcYn"><spring:message code="resume.text.srvcYn"/></label>
									</span>
								</li>
								<li>
									<span>
										<input type="checkbox" id="ethnicMinorYn" value="Y" <c:if test="${resumeDetail.ethnicMinorYn eq 'Y' }">data-clickflag="true"</c:if>/>
										<label for="ethnicMinorYn"><spring:message code="resume.text.ethnicMinorYn"/></label>
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
								<button type="button" class="text_box open" title="Open selection box" id="disablYn_focus">
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
								<button type="button" class="text_box open" title="Open selection box" id="selfempYn_focus">
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

					<%-- <div class="form_box count2">
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
					</div> --%>
				<!-- //form_box -->
				</div>
			<!-- //form_contents -->
			</div>
			<!-- //form_wrap -->

			<div class="form_wrap">
				<div class="form_title">
					<h3><span class="bbs_ico necessary">Necessary</span> <spring:message code="resume.text.workingConditions"/></h3>
					<button type="button" class="open" id="tab2_focus">open for contents view</button>
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
											<input type="hidden" name="iscoCd" value="${iscoCd.iscoCd}"/>
											<input type="hidden" name="iscoFullCd" value="${iscoCd.iscoFullCd}"/>
											<input type="hidden" name="iscoFullNm" value="${iscoCd.iscoFullNm}"/>
											<input type="hidden" name="iscoUpperCd" value="${iscoCd.iscoUpperCd}"/>
											<button type="button" class="delete">delete</button>
										</span>
									</c:forEach>
								</span>
							</div>
							<button type="button" id="hopeJob_focus" class="open popup_isco" onclick="callback(fnIscoSet, 'isco');" title="Open selection box"><span>Occupation Selection</span></button>
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
								<span class="text_box" id="span_hopeLoc">
									<c:forEach items="${hopeWorkLocList }" var="hopeWork">
										<span><c:out value="${hopeWork.addrCdNm}" escapeXml="false"/>
										<input type='hidden' name="hopeLocFullNm" value="${hopeWork.addrFullNm}"/>
										<input type='hidden' name="hopeLocFullCd" value="${hopeWork.addrFullCd}"/>
										<input type='hidden' name="hopeLocCd" value="${hopeWork.addrCd}"/>
										<button type='button'>delete</button></span>
									</c:forEach>
								</span>
							</div>
							<button type="button" id="hopeLocCd_focus" class="open popup_addr" onclick="callback(fnHopeLocSet, 'addr');" title="Open selection box"><span>Location Selection</span></button>
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
								<button type="button" class="text_box open" title="Open selection box" id="employFormCd_focus">
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
								<button type="button" class="text_box open" title="Open selection box" id="preferEmployTypeCd_focus">
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
								<button type="button" class="text_box open" title="Open selection box" id="preferCrtctType_focus">
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
								<button type="button" class="text_box open" title="Open selection box" id="diffProvcWorkYn_focus">
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
								<button type="button" class="text_box open" title="Open selection box" id="workBgnAbleYn_focus">
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
					<button type="button" class="open" id="tab3_focus">open for contents view</button>
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
								<button type="button" class="text_box open" title="Open selection box" id="eduDegreeCd_focus">
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
					<button type="button" class="open" id="tab4_focus">open for contents view</button>
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

			<div class="form_wrap" id="proLicnsSpec_form">
				<div class="form_title">
					<h3><span class="bbs_ico necessary">Necessary</span> <spring:message code="resume.text.certificate"/></h3>
					<button type="button" class="open" id="tab5_focus">open for contents view</button>
				</div>
				<!-- //form_title -->
				<c:if test="${resumeDetail.proLicnsYn eq 'N' }">
					<div class="form_contents">
						<div class="form_box count2">
							<div class="form_element input">
								<div class="view_area">
									<label for="" class="label"><spring:message code="resume.text.Credentials"/></label>
									<input type="text" name="proLicnsSpec" class="text_box" />
								</div>
							</div>
						</div>
						<!-- //form_box -->

						<button type="button" class="form_close" style="display: none;">Close contents</button>
					</div>
				</c:if>

				<c:if test="${resumeDetail.proLicnsYn eq 'Y' }">
					<c:forEach items="${resumeDetail.proLicnsSpecList }" var="proLicnsSpec" varStatus="stat">
						<div class="form_contents">
							<div class="form_box count2">
								<div class="form_element input active">
									<div class="view_area">
										<label for="" class="label"><spring:message code="resume.text.Credentials"/></label>
										<input type="text" name="proLicnsSpec" class="text_box" value="${proLicnsSpec}"/>
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
				</c:if>

				<div class="form_add">
					<button type="button"><span>Add</span></button>
				</div>
			<!-- //form_add -->
			</div>
			<!-- //form_wrap -->

			<div class="form_wrap" id="ot_form">
				<div class="form_title">
					<h3><span class="bbs_ico necessary">Necessary</span> <spring:message code="resume.text.otherEducation"/></h3>
					<button type="button" class="open" id="tab6_focus">open for contents view</button>
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
					<button type="button" class="open" id="tab7_focus">open for contents view</button>
				</div>
				<!-- //form_title -->
				<div class="form_contents">
					<div class="form_box count3">
						<c:choose>
							<c:when test="${not empty langResult}">
								<div class="form_element select active">
							</c:when>
							<c:otherwise>
								<div class="form_element select">
							</c:otherwise>
						</c:choose>
							<div class="view_area">
								<span class="label"><spring:message code="resume.text.langUseCd"/></span>
								<button type="button" class="text_box open" title="Open selection box" id="rl_langCd_native_focus">
									<c:choose>
										<c:when test="${not empty langResult.langCdNm }">
											<span><c:out value="${langResult.langCdNm}" escapeXml="false"/></span>
										</c:when>
										<c:otherwise>
											<span>Open</span>
										</c:otherwise>
									</c:choose>
									<input type="hidden" id="rl_langCd_native" value="${langResult.langCd }" />
								</button>
							</div>
							<div class="select_box">
								<ul class="clearfix">
									<c:forEach items="${languageList }" var="language">
										<li>
											<button type="button" value="${language.dtlCd}">
												<span><c:out value="${language.cdNm}" escapeXml="false"/></span>
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
				<c:if test="${empty langResult.list }">
					<div class="form_contents rl_form">
						<div class="form_box count3">
							<div class="form_element select">
								<div class="view_area">
									<span class="label"><spring:message code="resume.text.langNm"/></span>
									<button type="button" class="text_box open langCd_focus" title="Open selection box">
										<span>Open</span>
										<input type="hidden" name="rl_langCd" value="" />
									</button>
								</div>
								<div class="select_box">
									<ul class="clearfix">
										<c:forEach items="${languageList }" var="language">
											<li>
												<button type="button" value="${language.dtlCd}">
													<span><c:out value="${language.cdNm}" escapeXml="false"/></span>
												</button>
											</li>
										</c:forEach>
									</ul>
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

				<c:forEach items="${langResult.list }" var="lang" varStatus="stat">
					<div class="form_contents rl_form">
						<div class="form_box count3">
							<c:choose>
								<c:when test="${not empty lang.langCd}">
									<div class="form_element select active">
								</c:when>
								<c:otherwise>
									<div class="form_element select">
								</c:otherwise>
							</c:choose>
								<div class="view_area">
									<span class="label"><spring:message code="resume.text.langNm"/></span>
									<button type="button" class="text_box open langCd_focus" title="Open selection box">
										<c:choose>
											<c:when test="${not empty lang.langCdNm }">
												<span><c:out value="${lang.langCdNm}" escapeXml="false"/></span>
											</c:when>
											<c:otherwise>
												<span>Open</span>
											</c:otherwise>
										</c:choose>
										<input type="hidden" name="rl_langCd" value="${lang.langCd }" />
									</button>
								</div>
								<div class="select_box">
									<ul class="clearfix">
										<c:forEach items="${languageList }" var="language">
											<li>
												<button type="button" value="${language.dtlCd}">
													<span><c:out value="${language.cdNm}" escapeXml="false"/></span>
												</button>
											</li>
										</c:forEach>
									</ul>
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
					<h3><!-- <span class="bbs_ico necessary">Necessary</span> --> <spring:message code="resume.text.career"/>
						<span class="tit calCareerResult">
							<span class="totYear"></span>Year
							<span class="totMonths"></span>Months
						</span>
					</h3>
					<button type="button" class="open" id="tab8_focus">open for contents view</button>
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
											<input type="radio" class="exp_selfempYn" name="exp_selfempYn" id="radio08_01" value="Y"/>
											<label for="radio08_01">Yes</label>
										</span>
									</li>
									<li>
										<span>
											<input type="radio" class="exp_selfempYn" name="exp_selfempYn" id="radio08_02" value="N"/>
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
							<%-- <c:choose>
								<c:when test="${not empty workExp.selfempYn}">
									<div class="form_element select active">
								</c:when>
								<c:otherwise>
									<div class="form_element select">
								</c:otherwise>
							</c:choose> --%>
							<div class="form_element select">
								<div class="view_area">
									<span class="label"><spring:message code="resume.text.selfemp"/></span>
									<button type="button" class="text_box open" title="Open selection box">
										<%-- <c:choose>
											<c:when test="${workExp.selfempYn eq 'Y'}">
												<span>Yes</span>
											</c:when>
											<c:when test="${workExp.selfempYn eq 'N'}">
												<span>No</span>
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
									<li>
										<span>
											<input type="radio" class="exp_selfempYn" name="exp_selfempYn${stat.count }" id="radio08_01${stat.count }" value="Y" <c:if test="${workExp.selfempYn eq 'Y' }">data-clickflag="true"</c:if>/>
											<label for="radio08_01${stat.count }">Yes</label>
										</span>
									</li>
									<li>
										<span>
											<input type="radio" class="exp_selfempYn" name="exp_selfempYn${stat.count }" id="radio08_02${stat.count }" value="N" <c:if test="${workExp.selfempYn eq 'N'}">data-clickflag="true"</c:if>/>
											<label for="radio08_02${stat.count }">No</label>
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
					<button type="button" class="open" id="tab9_focus">open for contents view</button>
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
					<button type="button" class="open" id="tab10_focus">open for contents view</button>
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
											<button type="button">delete</button>
										</span>
									</c:forEach>
								</span>
								<input type="text" id="keyword" class="input_key" />
								<input type="hidden" id="ResumeKeyword" value="${resumeDetail.resumeKeyword }" />
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
					<button type="button" class="open" id="tab11_focus">open for contents view</button>
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
									<input type="text" name="ref_email" class="text_box inputEmail" onchange="fnCheckEmail2(this);" maxlength="100"/>
								</div>
							</div>
						</div>
					<!-- //form_box -->

						<div class="form_box">
							<div class="form_element pick" id="ref_addr">
								<div class="view_area">
									<span class="label">Address</span>
									<span class="text_box common_target" data-targetnm="ref">
									</span>
								</div>
								<button type="button" class="open popup_addr target_btn" id="target_ref" onclick="callback(this.id, 'addr');" title="Open selection box"><span>Location Selection</span></button>
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
									<input type="text" name="ref_email" class="text_box inputEmail" onchange="fnCheckEmail2(this);" maxlength="100" value="${refMan.email }"/>
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
									<span class="text_box common_target" data-targetnm="ref">
										<c:if test="${not empty refMan.addrFullCd && not empty refMan.addrFullNm}">
											<span>
											<c:out value="${refMan.addrFullNm}" escapeXml="false"/>
											<input type='hidden' name="ref_addrFullNm" value="${refMan.addrFullNm}"/>
											<input type='hidden' name="ref_addrFullCd" value="${refMan.addrFullCd}"/>
											<input type='hidden' name="ref_addrCd" value="${refMan.addrCd}"/><button type='button'>delete</button></span>
										</c:if>
									</span>
								</div>
								<button type="button" class="open popup_addr target_btn" id="target_ref" onclick="callback(this.id, 'addr');" title="Open selection box"><span>Location Selection</span></button>
							</div>
							<c:choose>
								<c:when test="${not empty refMan.addrFullCd}">
									<div class="form_element no_write input active">
								</c:when>
								<c:otherwise>
									<div class="form_element no_write input">
								</c:otherwise>
							</c:choose>
								<div class="view_area">
									<label for="" class="label">detail address</label>
									<input type="text" name="ref_addrDtl" class="text_box" maxlength="" value="${refMan.addrDtl }"/>
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
					<button type="button" class="open" id="tab12_focus">open for contents view</button>
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