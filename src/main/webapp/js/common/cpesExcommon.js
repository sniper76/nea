var USER_AUTH_CD_USER = "ROLE_USER";
var USER_AUTH_CD_TRNCT = "ROLE_TRNCT";
var USER_AUTH_CD_CMPNY = "ROLE_CMPNY";//USER_AUTH_CD_COMPN
var USER_AUTH_CD_STDIT = "ROLE_STDIT";
var METHOD_POST = "POST";
var METHOD_GET = "GET";
var AJAX_DATA_TYPE_JSON = "json";
var AJAX_DATA_TYPE_HTML = "html";
var COUNSEL_METHOD_DIV_CD_DEFAULT = "CMD0000000001";
var LIKE_CATEGORY_BULLETIN = "BCT0000000008";
var LIKE_CATEGORY_COUNSEL = "BCT0000000007";
var LIKE_CATEGORY_COMMUNITY = "BCT0000000009";
var LIKE_CATEGORY_TRNCT = "BCT0000000004";
var LIKE_CATEGORY_NEA_TRNCT = "BCT0000000011";
var LIKE_CATEGORY_COMPNY = "BCT0000000001";
var LIKE_CATEGORY_VACANCY = "BCT0000000003";
var LIKE_CATEGORY_RESUME = "BCT0000000006";
var LIKE_CATEGORY_INSTT = "BCT0000000010";
var LIKE_CATEGORY_FAIR = "BCT0000000002";

var CONTRY_CD_CAMBODIA = "1";//캄보디아 국가코드(지역조회시)

// dext5 upload
var formSubmitFn = null;

var errorMsg = "<spring:message code='resume.write.insert.error'/>";

/**
 * password check
 * @returns {Boolean}
 */
function fnCheckPassword(pwd){
    //비밀번호는 8~15자 영문 대/소문자, 숫자, 특수문자(!@#$% )를 조합하여 등록해 주세요
    var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,15}$/;
    return true;
    //return reg.test(pwd);
}




/**
 * email check
 * @returns {Boolean}
 */
function fnCheckEmail(val) {
	var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;

	console.log("==============fnCheckEmail val="+regEmail.test(val));
	return regEmail.test(val);
}


/**
 * inputbox only number check
 * @returns {Boolean}
 */
function fnCheckNumber(event){
	//console.log("==============fnCheckNumber event="+event.keyCode);
	var code = event.which?event.which:event.keyCode;
	if(code < 48 || code > 57){
		//event.returnValue = false;
		 event.preventDefault();
	}
}

/**
 * null check
 * @returns {Boolean}
 */
function fnNvlCheck(val) {
	if(val == null || val == "") {
		return true;
	} else {
		return false;
	}
}

/**
 * day selectBox
 *
 */
function fnSetDaySelecteBox(id,val) {
	for(var i=1; i<=31; i++) {
		 var val2 = fnLpad(i,2,"0");
		 $("#"+id).append("<option value='"+val2+"'>"+i+"</option>");
	}

	if(val != null) {
		 $("#"+id).val(val);
	}
}


/**
 * month selectBox
 *
 */
function fnSetMonthSelecteBox(id,val) {
	for(var i=1; i<=12; i++) {
		 var val2 = fnLpad(i,2,"0");
		 $("#"+id).append("<option value='"+val2+"'>"+i+"</option>");
	}

	if(val != null) {
		 $("#"+id).val(val);
	}
}


/**
 * year selectBox
 *
 */
function fnSetYearSelecteBox(id,val) {
	var curDate = new Date();
	var curYear = curDate.getFullYear();

	for(var i=1940; i<=curYear; i++) {
		 $("#"+id).append("<option value='"+i+"'>"+i+"</option>");
	}

	if(val != null) {
		 $("#"+id).val(val);
	}
}


/**
 * lpad
 * @returns {Boolean}
 */
function fnLpad(str,padLen,padStr) {
    if (padStr.length > padLen) {
        return str;
    }
    str += ""; // 문자로
    padStr += ""; // 문자로
    while (str.length < padLen)
        str = padStr + str;
    str = str.length >= padLen ? str.substring(0, padLen) : str;
    return str;
}



/**
 * 이메일 중복체크
 * email duplicaton check
 *
 */
function fnUserEmailDupChk(id,id2) {

	if (!fnCheckEmail($("#"+id).val())) {
		alertify.alert(emailFailMsg, function (e){
			$("#"+id).focus();
		});

		return false;
	}


	var data = {
		userEmail: $("#"+id).val()
	}

	$.ajax({
		url: contextPath + "/common/getEmailDupChkAjax.do",
		method: METHOD_POST,
		data: data,
		dataType: AJAX_DATA_TYPE_JSON
	})
	.done(function(data) {
		alertify.alert(data.result.message);
		$("#"+id2).val(data.result.successYn)
	})
	.fail(function(xhr, status, errorThrown) {

	})
}

/**
 * 휴대폰 중복체크
 * cell phone duplicaton check
 *
 */
function fnUserCellPhoneDupChk(id,id2) {
	if($("#"+id).val() == "") {
		alertify.alert(cellPhoneFailMsg, function (e){
			$("#"+id).focus();
		});

		return false;
	}

	var data = {
		userCell: $("#"+id).val()
	}

	$.ajax({
		url: contextPath + "/common/getCellPhoneDupChkAjax.do",
		method: METHOD_POST,
		data: data,
		dataType: AJAX_DATA_TYPE_JSON
	})
	.done(function(data) {
		alertify.alert(data.result.message);
		$("#"+id2).val(data.result.successYn)
	})
	.fail(function(xhr, status, errorThrown) {

	})
}


/**
 * 회원가입 성공후 안내페이지로 이동
 * success user join and move step3
 *
 */
function fnGoJoinComplate() {
	var $form = $('<form></form>');
	var url = contextPath + "/member/joinStepThree.do";



	$form.attr('action', url);
	$form.attr('method', METHOD_POST);
	$form.appendTo('body');



	var userNm = "<input type=\"hidden\" name=\"userNmKh\" value=\""+$("#userNmKh").val()+"\">";
	var joinYn = "<input type=\"hidden\" name=\"joinYn\" value=\"Y\">";
	var userAuthCd = "<input type=\"hidden\" name=\"userAuthCd\" value=\""+$("#userAuthCd").val()+"\">";
	$form.append(userNm).append(joinYn).append(userAuthCd);
	$form.submit();
}


/**
 * inputbox only number check include .
 * @returns {Boolean}
 */
function fnCheckNumber2(event){
	var code = event.which?event.which:event.keyCode;
	if(code < 48 || code > 57){
		event.returnValue = false;
	}
}


/**
 * domain valiation
 * @returns {Boolean}
 */
function fnValidUrl(str) {
	var pattern = new RegExp('^(https?:\\/\\/)?'+ // protocol

	'((([a-z\\d]([a-z\\d-]*[a-z\\d])*)\\.)+[a-z]{2,}|'+ // domain name

	'((\\d{1,3}\\.){3}\\d{1,3}))'+ // OR ip (v4) address
	'(\\:\\d+)?(\\/[-a-z\\d%_.~+]*)*'+ // port and path

	'(\\?[;&a-z\\d%_.~+=-]*)?'+ // query string

	'(\\#[-a-z\\d_]*)?$','i'); // fragment locator

	if(!pattern.test(str)) {

		return false;

	} else {

		return true;

	}

}


/**
 * time selectBox
 *
 */
function fnSetTimeSelecteBox(id,val) {
	for(var i=1; i<=12; i++) {
		 var val2 = fnLpad(i,2,"0");
		 $("#"+id).append("<option value='"+val2+"'>"+i+"</option>");
	}

	if(val != null) {
		 $("#"+id).val(val);
	}
}

/**
 * time selectBox
 *
 */
function fnSetAmpmSelecteBox(id,val) {

	$("#"+id).append("<option value='AM'>AM</option>");
	$("#"+id).append("<option value='PM'>PM</option>");

	if(val != null) {
		 $("#"+id).val(val);
	}
}


/**
 * am pm
 *
 */
function fnGetAmPm(id) {
	var val = $("#"+id).val();
	if(val == "AM") {
		return 0;
	} else {
		return 12;
	}
}



/**
 * time selectBox
 *
 */
function fnSetSelecteBox(id,val) {

	if(id != null) {
		 $("#"+id).val(val);
	}
}

/**
 * 페이징 초기화
 *
 */
function fnRestPage(id,val) {
	$("#"+id).val(val);//페이징 정보 1페이지로 초기화
	return true;
}


/**
 * 폼 리셋
 *
 */
function fnClearForm(formId) {
    $('#'+formId)[0].reset();
}


/**
 * 등록 폼 추가 버튼
 */
function fnAddForm(){
	$('.form_add').find('button').on('click',function(e){
		var cloneHtml = $(e.target).closest('.form_wrap').find('.form_contents').last().clone();
		// 등록 폼 clone 생성시 기존에 등록된 데이터 초기화 작업
		cloneHtml.find('.form_close').show();
		cloneHtml.find('input').val('');
		cloneHtml.find('.pick').removeClass('active');
		cloneHtml.find('.pick').removeClass('on');
		cloneHtml.find('span[class=text_box]').empty();
		cloneHtml.find('.text_box:button').find('span').html('');
		cloneHtml.find('.text_box:button').closest('.select').removeClass('active');
		cloneHtml.find('.text_box').closest('.input').removeClass('active');

		/*cloneHtml.find('.dep1').each(function(i){
			if($(this).index() != 0){
				$(this).find('ul').empty();
			}else{
				$(this).find('.on').removeClass('on');
			}
		});*/

		cloneHtml.find('.select_box input:radio').each(function(){
			var radioId = $(this).attr('id');
			var radioNm = $(this).attr('name');

			var radioVal = $(e.target).closest('.form_wrap').find('.form_contents').last().find('#' + radioId).val();

			$(this).attr('id', radioId + "1");
			$(this).closest('span').find('label').attr('for', radioId + "1");
			$(this).attr('name', radioNm + "1");
			$(this).val(radioVal);
			$(this).prop('checked', false);
		});

		var targetId = cloneHtml.find('.target_btn').attr('id');
		cloneHtml.find('.target_btn').attr('id', targetId + "1");

		$(e.target).closest('.form_wrap').find('.form_contents').last().after(cloneHtml);
		//fnCodeSelect();
		fnSelectNationality();
		fnCalculationCareer();
		fnScriptReset();
		fnInputValidation('inputNo', '1');
		fnInputValidation('inputMM', '2');
		fnInputValidation('inputYY', '3');
		fnInputValidation('inputTime', '4');
		fnInputValidation('inputWeek', '5');
		//fnCheckEmail2('inputEmail');

		for(var i in commonPopupList.list){
			var obj = commonPopupList.list[i];
			obj.obj.click();
		}
	});

}

//직종 or 지역 정보 선택
function fnCodeSelect(){
	// 1depth 선택
	$('.popup_box').find('.selectRow').unbind();
	$('.popup_box').find('.selectRow').on('click', function(e){
		var depth = $(e.target).closest('.dep1').index() + 1;
		var lastDepth = $(e.target).closest('.popup_box').find('.dep1').length;
		var selectVal = $(e.target).val();

		// 선택한 li 선택 css 적용
		$(this).closest('.dep1').find('li').removeClass('on');
		$(this).closest('li').addClass('on');

		// 선택한 depth가 마지막 요소가 아닐 경우 다음 depth의 정보 조회
		if(depth != lastDepth){
			$.ajax({
				type: 'post',
				url: contextPath + "/cpes/private/resume/nextDepthSelectAjax.do",
				dataType: 'json',
				data: {
					"depth" : depth,
					"condGrpCd" : selectVal,
					"cdLength" : selectVal.length
				},
				success: function(data) {

					var html = "";
					if(data.result.length > 0){
						for(var i in data.result){
							var resultObj = data.result[i];
							html += "<li><button type='button' class='selectRow' value='" + resultObj.lvlCd +"'>" + resultObj.nm + "</button></li>";
						}
					}

					$(e.target).closest('.popup_box').find('.dep1:eq(' + depth + ')').find('.scroll_cont ul').empty();
					$(e.target).closest('.popup_box').find('.dep1:eq(' + depth + ')').find('.scroll_cont ul').html(html);
					fnCodeSelect();
					fnSelectNationality();
					fnCalculationCareer();
					fnScriptReset();
				},
				error: function(xhr, status, error) {
					alertify.alert("error to connecting server");
				}
			});
		}

	});


	// select 버튼
	$('.popup_box').find('.save').unbind();
	$('.popup_box').find('.save').on('click', function(e){
		var selectFlag = false;
		$('.popup_box').find('.dep1:last').find('li').each(function(i){
			if($(this).hasClass('on')){
				selectFlag = true;
			}
		});

		if(!selectFlag){
			alertify.alert(notFullAddrMsg);
			return false;
		}

		var selectValHtml = "";
		var html = "";
		var lastSelectVal = "";

		var formFlag = $(e.target).closest('.pick').attr('id');

		// 선택한 값 세팅
		$(e.target).closest('.popup_box').find('.dep1').each(function(i){
			var selectText = $(this).find('.on').find('button').text();
			lastSelectVal = $(this).find('.on').find('button').val();

			if(selectValHtml == ""){
				selectValHtml += selectText;
			}else{
				selectValHtml += " " + selectText;
			}
		});

		// 입력하는 항목에 따라 분류
		if(formFlag == "hopeLoc"){

			var $li = $(e.target).closest('.popup_box').find('.dep1:last').find('.on');
			html += "<span>" + $li.find('button').text() + "<input type='hidden' name='" + formFlag + "Nm' value='" + selectValHtml + "'/>";
			html += "<input type='hidden' name='" + formFlag + "Cd' value='" + lastSelectVal + "'/><button type='button'>delete</button></span>";

			// 기존에 등록된 동일한 값이 있는지 체크
			var inputFlag = false;
			$(e.target).closest('.pick').find('.text_box').find('span').each(function(i){
				if($(this).find('input:last').val() == lastSelectVal){
					inputFlag = true;
				}
			})

			if(!inputFlag){
				$(e.target).closest('.pick').find('.text_box').append(html);
				$(e.target).closest('.pick').addClass('active');
				fnSelectNationality();
				fnCalculationCareer();
				fnScriptReset();
			}
		}else{

			var $li = $(e.target).closest('.popup_box').find('.dep1:last').find('.on');
			html += "<span>" + selectValHtml + "<input type='hidden' name='" + formFlag + "Nm' value='" + selectValHtml + "'/>";
			html += "<input type='hidden' name='" + formFlag + "Cd' value='" + lastSelectVal + "'/><button type='button'>delete</button></span>";

			$(e.target).closest('.pick').find('.text_box').empty();
			$(e.target).closest('.pick').find('.text_box').append(html);
			$(e.target).closest('.pick').addClass('active');
			fnSelectNationality();
			fnCalculationCareer();
			fnScriptReset();
		}

	});

}

function fnScriptReset(){
	// 새로생성된 등록 폼 스크립트 세팅
	$('.form_close').unbind();
	//$('.form_element').find('input:text').unbind();
	$('.form_element').find('.select_box button,.select_box input:radio').unbind();
	$('.form_element').find('.open').unbind();
	$('.form_element').find('.text_box button').unbind();
	$('.form_element').find('.popup_box .close, .popup_box .cancel').unbind();

	$('.form_element').find('.text_box button').on('click', function(){
		$number=$(this).parents('.text_box').find('span').length;

		if($number==1){
			$(this).parents('.form_element').removeClass('active');
		};
		$(this).parent('span').remove();
	});

	$('.form_close').on('click', function(){
		$(this).parents('.form_contents').remove();
	});

	$('.form_element').find('.text_box button').on('click', function(){
		$number=$(this).parents('.text_box').find('span').length;

		if($number==1){
			$(this).parents('.form_element').removeClass('active');
		};
		$(this).parent('span').remove();
	});

	$('.form_element').find('input:text').on('focusin', function(){
		$('.form_element').removeClass('on');
		$(this).parents('.form_element').addClass('active on');
	});

	$('.form_element').find('input:text').on('focusout', function(){
		var $val=$(this).val();
		if($val==''){
			$(this).parents('.form_element').removeClass('active on');
		}else{
			$(this).parents('.form_element').removeClass('on');
		};
	});

	$('.form_element').find('.open').on('click', function(){
		$('.form_element').removeClass('on');
		$(this).parents('.form_element').addClass('on');
	});

	$('.form_element').find('.select_box button,.select_box input:radio').on('click', function(event){
		var $target=$(event.target),
			$text='';
			$child='';
			$cd='';
		if($target.is('input:radio')){
			$text=$(this).siblings('label').text().toLowerCase(),
			$child=$(this).attr('class');

			if($child=='have'){
				$(this).parents('.form_element').next('.child_form').addClass('show').find('.form_element').removeClass('active');
			}else if($child=='no_have'){
				$(this).parents('.form_element').next('.child_form').removeClass('show active').find('.text_box').text('');
				$(this).parents('.form_element').next('.child_form').find('.check_box input:checkbox').prop('checked', false);
			};
		}else{
			$text=$(this).find('span').text();
			$cd=$(this).val();
		};
		if($target.is('.ohter')){
			$(this).parents('.form_element').siblings('.other_child').addClass('show');
		}else{
			$(this).parents('.form_element').siblings('.other_child').removeClass('show');
		};
		$target.closest('.form_element').removeClass('on').addClass('active').find('.text_box span').text($text);
		$target.parents('.form_element').removeClass('on').addClass('active').find('.text_box input').val($cd);
	});

	$('.form_element').find('.popup_box .close, .popup_box .cancel').on('click', function(){
		$(this).parents('.form_element').removeClass('on');
	});

	fnSelectNationality();
}

function fnSelectNationality(){
	//$('.btn_nationality').unbind();
	$('.btn_nationality').on('click', function(e){
		var selectVal = $(e.target).val();

		$.ajax({
			type: 'post',
			url: contextPath + "/cpes/private/resume/nextDepthSelectAjax.do",
			dataType: 'json',
			data: {
				"depth" : "99",
				"condGrpCd" : selectVal,
				"cdLength" : selectVal.length
			},
			success: function(data) {
				var html = "";
				if(data.result.length > 0){
					for(var i in data.result){
						var resultObj = data.result[i];
						html += "<li><button type='button' value='" + resultObj.lvlCd +"'><span>" + resultObj.nm + "</span></button></li>";
					}
				}

				$(e.target).closest('.form_box').find('.ul_ss_provcCd').empty();
				$(e.target).closest('.form_box').find('.ul_ss_provcCd').html(html);

				fnScriptReset();
			},
			error: function(xhr, status, error) {
				alert('error to connecting server');
			}
		});

	});
}

/**
 * 입력 validate 관련
 * flag ::
 * 1 : 숫자만 입력
 * 2 : mm (월)만 입력
 * 3 : yy (년)만 입력
 * 4 : 시간 (0 ~ 24)만 입력
 * 5 : 주(0 ~ 7) 만 입력
 */
function fnInputValidation(classNm, flag){
	$('.'+classNm).keyup(function(e){
		var checkVal = $(e.target).val();
		var regStr = null;

		if(flag == 1){
			regStr = /[^0-9]/gi;
			$(e.target).val(checkVal.replace(regStr, ''));
		}else if(flag == 2){
			regStr = /[^0-9]/gi;
			var checkInt = checkVal.replace(regStr, '');

			if(checkInt > 12 || checkInt < 1){
				checkInt = '';
			}

			$(e.target).val(checkInt);
		}else if(flag == 3){
			regStr = /[^0-9]/gi;
			var checkInt = checkVal.replace(regStr, '');

			$(e.target).val(checkInt);

			$(e.target).focusout(function(event){
				var checkLengh = $(event.target).val().length;

				if(checkLengh < 4){
					alertify.alert(yearFormatErrorMsg, function (e){
						$(event.target).focus();
					});
				}
			});
		}else if(flag == 4){
			regStr = /[^0-9]/gi;
			var checkInt = checkVal.replace(regStr, '');

			if(checkInt > 24 || checkInt < 1){
				checkInt = '';
			}
			$(e.target).val(checkInt);
		}else if(flag == 5){
			regStr = /[^0-9]/gi;
			var checkInt = checkVal.replace(regStr, '');

			if(checkInt > 7 || checkInt < 1){
				checkInt = '';
			}
			$(e.target).val(checkInt);
		}
	});
}


/**
 * 숫자 콤마 처리
 */
function fnNumberWithCommas(val) {
    return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

/**
 * byte length 체크
 */
function fnGetByteLength(str) {
	var len = 0;

	for (var i = 0; i < str.length; i++) {
		if (escape(str.charAt(i)).length == 6) {
			len++;
		}
		len++;
	}
	return len;
}



/**
 * byte 제한 처리
 * obj 이벤트 개체
 * id 제한갯수 노출할 tag id
 * maxByte 제한바이트
 */
function fnBytesHandler(obj,id,maxByte){
	var text = $(obj).val();
	var byteCnt = fnGetByteLength(text);

	if(byteCnt > maxByte) {
		alertify.alert(maxByte + maxByteMsg, function (e){
			$(obj).val(fnCutByteLength(text,maxByte));
			$('#'+id).text(maxByte);
			return false;
		});
		return false;
	}

	if(id != null) {
		$('#'+id).text(byteCnt);
	}
}

/**
 * byte 자르기
 * s text
 * len 자를 바이트 수
 */
function fnCutByteLength(s, len) {

	if (s == null || s.length == 0) {
		return 0;
	}
	var size = 0;
	var rIndex = s.length;

	for ( var i = 0; i < s.length; i++) {
		size += fnGetByteLength(s.charAt(i));
		if( size == len ) {
			rIndex = i + 1;
			break;
		} else if( size > len ) {
			rIndex = i;
			break;
		}
	}

	return s.substring(0, rIndex);
}

/**
 * 이력서 경력 계산
 */

function fnCalculationCareer(){
	$('.calCareer').on('focusout', function(e){
		fnCalculationCareerUpdate();

	});
}

function fnCalculationCareerUpdate(){
	var totCareerYy = 0;
	var totCareerMm = 0;
	$('.exp_form').each(function(){
		var startMM = $(this).find('input[name=exp_bgnDt_mm]').val();
		var startYY = $(this).find('input[name=exp_bgnDt_yy]').val();
		var endMM = $(this).find('input[name=exp_endDt_mm]').val();
		var endYY = $(this).find('input[name=exp_endDt_yy]').val();

		if(startMM != "" && startYY != "" && endMM != "" && endYY != ""){
			var startDate = new Date(startYY, Number(startMM)-1, 1);
			var endDate = new Date(endYY, Number(endMM)-1, 1);

			var careerMm = Math.floor((Number(endDate.getTime()) - Number(startDate.getTime())) / (1000 * 60 * 60 * 24 * 30));

			totCareerYy += Number(Math.floor(careerMm / 12).toFixed());
			totCareerMm += Number((careerMm % 12).toFixed());

			if(totCareerMm >= 12){
				totCareerYy += 1;
				totCareerMm -= 12;
			}

		}
	});

	//$('.calCareerResult').html(totCareerYy + "Year " + totCareerMm + "Months");
	$('.totYear').html(totCareerYy);
	$('.totMonths').html(totCareerMm);
}

// 이메일 형식 체크
function fnCheckEmail2(classNm){
	var regStr = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
	var checkVal = $(classNm).val();

	if(checkVal != ""){
		if(!regStr.test(checkVal)){
			alertify.alert(emailFormatErrorMsg, function(){
				$(classNm).val('');
				$(classNm).focus();
			});
		}
	}

}



/**
 * hour selectBox
 *
 */
function fnSetHourSelecteBox(id,val) {
	for(var i=1; i<=12; i++) {
		 var val2 = fnLpad(i,2,"0");
		 $("#"+id).append("<option value='"+val2+"'>"+i+"</option>");
	}

	if(val != null) {
		 $("#"+id).val(val);
	}
}


/**
 * minute selectBox
 *
 */
function fnSetMinuteSelecteBox(id,val) {
	$("#"+id).append("<option value='00'>00</option>");
	$("#"+id).append("<option value='10'>10</option>");
	$("#"+id).append("<option value='20'>20</option>");
	$("#"+id).append("<option value='30'>30</option>");
	$("#"+id).append("<option value='40'>40</option>");
	$("#"+id).append("<option value='50'>50</option>");

	if(val != null) {
		 $("#"+id).val(val);
	}
}


/**
 * day work hour selectBox
 *
 */
function fnSetDayHourSelecteBox(id,val) {
	for(var i=0; i<=24; i++) {
		 $("#"+id).append("<option value='"+i+"'>"+i+"</option>");
	}

	if(val != null) {
		 $("#"+id).val(val);
	}
}


/**
 * minute selectBox
 *
 */
function fnSetWeekDaySelecteBox(id,val) {
	for(var i=1; i<=7; i++) {
		 $("#"+id).append("<option value='"+i+"'>"+i+"</option>");
	}

	if(val != null) {
		 $("#"+id).val(val);
	}
}


/**
 * hour selectBox
 *
 */
function fnSetHour24SelecteBox(id,val) {
	for(var i=0; i<=23; i++) {
		 var val2 = fnLpad(i,2,"0");
		 $("#"+id).append("<option value='"+val2+"'>"+i+"</option>");
	}

	if(val != null) {
		 $("#"+id).val(val);
	}
}


/**
 * inputbox only number check
 * @returns {Boolean}
 */
function fnCheckDecimalNumber(obj,limit){
	var prev = "";
	var regexp = /^\d*(\.\d{0,2})?$/;
	//var regexpNew = new RegExp(regexp);

	if($(obj).val().search(regexp) == -1) {
		$(obj).val(prev);
	} else {
		prev = $(obj).val();
	}
}


function fnActiveChk(obj) {
	if($(obj).val() == "") {
		$(obj).parent().removeClass("active");

	} else {
		$(obj).parent().addClass("active");
	}
}
/**
 * 이력서 경력 계산
 */

/*function fnCalculationCareer(){
	$('.calCareer').on('focusout', function(e){

		var totCareerYy = 0;
		var totCareerMm = 0;
		$('.exp_form').each(function(){
			var startMM = $(this).find('input[name=exp_bgnDt_mm]').val();
			var startYY = $(this).find('input[name=exp_bgnDt_yy]').val();
			var endMM = $(this).find('input[name=exp_endDt_mm]').val();
			var endYY = $(this).find('input[name=exp_endDt_yy]').val();

			if(startMM != "" && startYY != "" && endMM != "" && endYY != ""){
				var startDate = new Date(startYY, Number(startMM)-1, 1);
				var endDate = new Date(endYY, Number(endMM)-1, 1);

				var careerMm = ((Number(endDate.getTime()) - Number(startDate.getTime())) / (1000 * 60 * 60 * 24 * 30)).toFixed();

				totCareerYy += Number((careerMm / 12).toFixed());
				totCareerMm += Number((careerMm % 12).toFixed());

			}

		});

		$('.calCareerResult').html(totCareerYy + "Year " + totCareerMm + "Months");

	});
}*/

// 공통 주소 레이어 세팅
function commonAddrSet(){
	$.ajax({
		type: 'post',
		url: contextPath + "/common/viewAddrPopup.do",
		dataType: 'html',
		success: function(data) {
			$('#div_commonAddr').html(data);
			commonAddr.init();
		},
		error: function(xhr, status, error) {
			alertify.alert("error to connecting server");
		}
	});
}

/**
 * 공통 레이어 팝업 세팅
 * @param flag
 * @returns
 */
function commonPopupSet(flag, lastDepthFlag){
	$.ajax({
		type: 'post',
		url: contextPath + "/common/viewCommonPopup.do",
		data: {
			"flag" : flag
		},
		dataType: 'html',
		success: function(data) {
			var cloneDiv = $('#div_common').clone();
			$('#div_common').after(cloneDiv);
			cloneDiv.addClass(flag);
			cloneDiv.html(data);
			cloneDiv.find('#popup_title').html(flag.toUpperCase());

			commonPopupList.init(flag, lastDepthFlag);
		},
		error: function(xhr, status, error) {
			alertify.alert("error to connecting server");
		}
	});
}


var commonPopupList = {
	list : [],
	init : function(flag, lastDepthFlag){
		var commonPopupObj = new Object();
		commonPopupObj.flag = flag;
		var obj = new commonPopup(flag, lastDepthFlag);
		obj.init();
		commonPopupObj.obj = obj;
		commonPopupList.list.push(commonPopupObj);
	},
	reset : function(flag){
		for(var i in commonPopupList.list){
			var obj = commonPopupList.list[i];
			if(flag == obj.flag){
				obj.obj.select();
			}
		}
	}
}

function callback(fn, flag){
	for(var i in commonPopupList.list){
		var obj = commonPopupList.list[i];
		if(flag == obj.flag){
			obj.obj.callback(fn);
		}
	}
}

function commonPopup(flag, lastDepthFlag){
	this.values = {
		"commonFullCd" : "",
		"commonFullNm" : "",
		"commonCd" : "",
		"commonNm" : ""
	};
	this.valueList = [];
	this.config = flag;
	this.callbackFnNm = null;
	this.eventObj = null;
	this.lastDepthFlag = lastDepthFlag;
	this.buttonEvent = null;
	this.targetId = "";
	this.init = function() {
	    // init
		this.click();
		this.select();
		this.input();
	};
	this.callback = function(fn){
		this.callbackFnNm = fn;
		this.init();
	};
	this.select = function(){
		var config = this.config;
		$('.' + config).find('.common_selectRow').unbind();
		$('.' + config).find('.common_selectRow').on('click', function(e){
			var depth = $(e.target).closest('.dep1').index() + 1;
			var lastDepth = $(e.target).closest('.popup_box').find('.dep1').length;
			var selectVal = $(e.target).val();

			// 선택한 li 선택 css 적용
			$(this).closest('.dep1').find('li').removeClass('on');
			$(this).closest('li').addClass('on');

			// 선택한 depth가 마지막 요소가 아닐 경우 다음 depth의 정보 조회
			if(depth != lastDepth){
				$.ajax({
					type: 'post',
					url: contextPath + "/common/nextDepthCdSelectAjax.do",
					dataType: 'json',
					data: {
						"flag" : config,
						"depth" : depth,
						"cd" : selectVal,
						"condGrpCd" : selectVal,
						"cdLength" : selectVal.length
					},
					success: function(data) {

						var html = "";
						if(data.result.length > 0){
							for(var i in data.result){
								var resultObj = data.result[i];
								html += "<li><button type='button' class='common_selectRow' value='" + resultObj.cd +"'>" + resultObj.cdNm + "</button></li>";
							}
						}

						$(e.target).closest('.popup_box').find('.dep1:eq(' + depth + ')').find('.scroll_cont ul').empty();
						$(e.target).closest('.popup_box').find('.dep1:eq(' + depth + ')').find('.scroll_cont ul').html(html);

						commonPopupList.reset(config);
					},
					error: function(xhr, status, error) {
						alertify.alert("error to connecting server");
					}
				});
			}
		});
	};
	this.input = function(){
  		// select 버튼
  		var config = this.config;
  		var eventObj = this.eventObj;
  		var values = this.values;
  		var callbackFnNm = this.callbackFnNm;
  		var popupClose = this.popupClose;
  		var lastDepthFlag = this.lastDepthFlag;
  		var targetId = this.targetId;

		$('.' + config).find('.btn_commonPopupSave').unbind();
		$('.' + config).find('.btn_commonPopupSave').on('click', function(e){
			if(!lastDepthFlag){
				var selectFlag = false;
				$(e.target).closest('.popup_box').find('.dep1:last').find('li').each(function(i){
					if($(this).hasClass('on')){
						selectFlag = true;
					}
				});

				if(!selectFlag){
					alertify.alert("모든 정보를 선택해 주세요");
					return false;
				}
			}

			var selectValHtml = "";
			var html = "";
			var fullCd = "";

			// 선택한 값 세팅
			$(e.target).closest('.popup_box').find('.dep1').each(function(i){
				var selectText = $(this).find('.on').find('button').text();
				var selectVal = $(this).find('.on').find('button').val();

				if(selectText != "" && selectVal != ""){
					if(selectValHtml == ""){
						selectValHtml += selectText;
					}else{
						selectValHtml += " " + selectText;
					}

					if(fullCd == ""){
						fullCd += selectVal;
					}else{
						fullCd += ","+selectVal;
					}

					values.commonCd = selectVal;
					values.commonNm = selectText;
				}

			});

			values.commonFullCd = fullCd;
			values.commonFullNm = selectValHtml;

			// 입력하는 항목에 따라 분류
			/*if(flag == "text"){

				if(config == "addr"){
					$('.popup_input_' + config).val(values.commonFullNm);
				}else if(config == "isco"){
					$('.popup_input_' + config).val(values.commonNm);
				}
			}else{

				// 이후 다른 입력 폼이 존재할 때 추가 작업 진행
				 var $li = $(e.target).closest('.popup_box').find('.dep1:last').find('.on');
				html += "<span>" + selectValHtml + "<input type='hidden' name='" + formFlag + "Nm' value='" + selectValHtml + "'/>";
				html += "<input type='hidden' name='" + formFlag + "Cd' value='" + lastSelectVal + "'/><button type='button'>delete</button></span>";

				var $li = $(e.target).closest('.popup_box').find('.dep1:last').find('.on');
				html += "<span>" + $li.find('button').text() + "<input type='hidden' name='" + formFlag + "Nm' value='" + selectValHtml + "'/>";
				html += "<input type='hidden' name='" + formFlag + "Cd' value='" + lastSelectVal + "'/><button type='button'>delete</button></span>";

				// 기존에 등록된 동일한 값이 있는지 체크
				var inputFlag = false;
				$(e.target).closest('.pick').find('.text_box').find('span').each(function(i){
					if($(this).find('input:last').val() == lastSelectVal){
						inputFlag = true;
					}
				})

				if(!inputFlag){
					$(e.target).closest('.pick').find('.text_box').append(html);
					$(e.target).closest('.pick').addClass('active');
				}
			}*/

			if(typeof callbackFnNm == 'function'){
				callbackFnNm(values);
			}else{

				// 이력서 추천인에서 사용
				var targetnm = $('#' + callbackFnNm).closest('.form_element').find('.common_target').data('targetnm');

				var addrHtml = "<span>" + values.commonFullNm + "<input type='hidden' name='" + targetnm + "_" + config + "Cd' value='" + values.commonCd + "'/>";
	    		addrHtml += "<input type='hidden' name='" + targetnm + "_" + config + "FullNm' value='" + values.commonFullNm + "'/>";
	    		addrHtml += "<input type='hidden' name='" + targetnm + "_" + config + "FullCd' value='" + values.commonFullCd + "'/>";
	    		addrHtml += "<button type='button'>delete</button></span>";

	    		var form_element = $('#' + callbackFnNm).closest('.form_element');
	    		form_element.find('.common_target').html(addrHtml);
	    		form_element.addClass('active');
			}

			popupClose(config);
			$('.' + config).find('#commonPopup').hide();
		});
	};
	this.click = function (){
		// 주소 선택 결과가 inputbox (text 형태)
		var flag = this.config;
		$('.popup_' + flag).on('click', function(e){
			$('.' + flag).find('#commonPopup').show();
		});

		// 공통 popup 닫기
		var popupClose = this.popupClose;
		$('.btn_commonPopupClose').unbind();
		$('.btn_commonPopupClose').on('click', function(e){
			popupClose(flag);
			$(e.target).closest('#commonPopup').hide();
		});
	};
	this.popupClose = function(flag){
		$('.' + flag).find('.dep1').each(function(i){
			if(i > 0){
				$(this).find('.scroll_cont ul').empty();
			}else{
				$(this).find('.scroll_cont ul li').removeClass('on');
			}
		});
	};
}

/**
 * 입사 제의 팝업
 * @param flag
 * @returns
 */
function commonOfferPopup(resumeSeq){

	$.ajax({
		type: 'post',
		url: contextPath + "/cpes/compny/offer/checkVacancyCnt.do",
		dataType: 'json',
		success: function(data) {

			if(data.result > 0){

				if($('#commonOfferPopup').length < 1){
					$.ajax({
						type: 'post',
						url: contextPath + "/cpes/compny/offer/vacancyListPopup.do",
						dataType: 'html',
						success: function(data) {
							var cloneDiv = $('#div_common').clone();
							$('#div_common').after(cloneDiv);
							cloneDiv.html(data);

							$('#offer_resumeSeq').val(resumeSeq);
							$('#commonOfferPopup').show();

						},
						error: function(xhr, status, error) {
							alertify.alert("error to connecting server");
						}
					});
				}else{

					$('#offer_resumeSeq').val(resumeSeq);
					$('#commonOfferPopup').show();
				}
			}

		},
		error: function(xhr, status, error) {
			alertify.alert("error to connecting server");
		}
	});

}
function fnViewMap(mapUrl, w, h, popupNm) {
	var dualScreenLeft = window.screenLeft != undefined ? window.screenLeft : window.screenX;
    var dualScreenTop = window.screenTop != undefined ? window.screenTop : window.screenY;

    var width = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width;
    var height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height;

    var systemZoom = width / window.screen.availWidth;
   	var left = (width - w) / 2 / (systemZoom + dualScreenLeft);
   	var top = (height - h) / 2 / (systemZoom + dualScreenTop);

	window.open(mapUrl, popupNm, 'scrollbars=yes, width=' + w / systemZoom + ', height=' + h / systemZoom + ', top=' + top + ', left=' + left);
}

/**
 * dext5upload 업로드 후 콜백 함수
 *
 * commonUploadFlag
 * I : 등록 (fnFileFormSave)
 * TI : 임시등록 (fnFileFormTempSave)
 *
 * @param uploadID
 * @returns
 */
function DEXT5UPLOAD_OnTransfer_Complete(uploadID) {
    var resultJson = DEXT5UPLOAD.GetAllFileListForJson(uploadID);
    $('#commonUploadResult').val(JSON.stringify(resultJson));

    var commonUploadFlag = $('#commonUploadFlag').val();

    if(typeof formSubmitFn == 'function'){
		formSubmitFn();
	}

    /*if(commonUploadFlag == "I"){
    	fnFileFormSave();
    }else if(commonUploadFlag == "TI"){
    	fnFileFormTempSave();
    }*/
}


function setCookie(cookieName, value, exdays){
	var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}

function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}

function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}

/**
 * 대용량 파일 업로드 적용
 *
 * parameter
 *
 * id : 대용량 파일 업로드를 적용할 요소 id
 * editFlag : 대용량 파일 업로드 모드
 *  - '' or 'edit' : 에디트 모드 (등록 가능) (기본형)
 *  - 'view' : 뷰어 모드 (다운로드만 가능)
 *
 * viewFlag : 추가한 파일의 표시 방식
 *  - '' or 'false' : 리스트 방식 (기본형)
 *  - 'true' : thumbs 방식 (적용시 업로드 파일은 img 형태의 파일만 가능)
 *
 * maxOneFile : 업로드시 파일당 용량 제한
 *  - '' or '0' : 용량 제한 없음
 *  - B(byte), KB(kilobyte), MB(megabyte), GB(gigabyte) 로 입력. ex) '10MB'
 *
 * maxTotalFile : 업로드시 전체 파일용량 제한
 *  - '' or '0' : 용량 제한 없음.
 *  - B(byte), KB(kilobyte), MB(megabyte), GB(gigabyte) 로 입력. ex) '10MB'
 *
 * maxTotalCount : 업로드시 최대 파일 개수 제한
 *  - '' or '0' : 제한 없음.
 *
 * extList : 업로드할 파일 확장자 제한 (viewFlag 가 true 이면 적용되지 않음)
 *  - '' : 제한 없음
 *  - '확장자1,확장자2' 형태로 지정 ex) 'jpeg,jpg'
 *
 * id 를 제외한 parameter 제외 가능
 *  - default : edit 모드, 리스트 타입, 파일용량/개수 제한없음, 모든 확장자 등록가능
 *
 * @param id
 * @param editFlag
 * @param viewFlag
 * @param maxOneFile
 * @param maxTotalFile
 * @param maxTotalCount
 * @param extList
 * @returns
 */
function dext5uploadAllFileSet(id, editFlag, viewFlag, maxOneFile, maxTotalFile, maxTotalCount, extList){
	DEXT5UPLOAD.config.UploadHolder = id;
	if(editFlag == "view"){
		DEXT5UPLOAD.config.Mode = 'view'; // edit, view
	}else{
		DEXT5UPLOAD.config.Mode = 'edit';
	}

	if(viewFlag == "true"){
		DEXT5UPLOAD.config.Views = 'thumbs';
		DEXT5UPLOAD.config.ExtensionAllowOrLimit = '1';
		DEXT5UPLOAD.config.ExtensionArr = 'jpeg,bmp,jpg,gif,png';
	}
	if(maxOneFile != ""){
		DEXT5UPLOAD.config.MaxOneFileSize = maxOneFile;
	}
	if(maxTotalFile != ""){
		DEXT5UPLOAD.config.MaxTotalFileSize = maxTotalFile;
	}
	if(maxTotalCount != ""){
		DEXT5UPLOAD.config.MaxTotalFileCount = maxTotalCount;
	}
	if(extList != "" && viewFlag != "true"){
		DEXT5UPLOAD.config.ExtensionAllowOrLimit = '1';
		DEXT5UPLOAD.config.ExtensionArr = extList;
	}

	new Dext5Upload("commonUpload");
}

function dext5UploadTransfer(functionNm){
	formSubmitFn = functionNm;

	var uploadCnt = DEXT5UPLOAD.GetTotalFileCount("commonUpload");
	if(uploadCnt > 0){
		// 파일전송
		DEXT5UPLOAD.Transfer('commonUpload');
	}else{
		if(typeof formSubmitFn == 'function'){
			formSubmitFn();
		}
	}
}

function dext5AddUploadFile(fileGrpSeq){
	$.ajax({
		type: 'post',
		url: contextPath + "/common/selectDext5upload.do",
		dataType: 'json',
		data: {
			"fileGrpSeq" : fileGrpSeq,
		},
		success: function(data) {

			if(data.result.length > 0){
				for(var i in data.result){
					var obj = data.result[i];
					DEXT5UPLOAD.AddUploadedFile(obj.fileSeq, obj.originalNm, obj.saveFilePath, obj.fileSize, '', 'commonUpload');
				}
			}

		},
		error: function(xhr, status, error) {
			alertify.alert(errorMsg);
		}
	});
}

jQuery.fn.serializeObject = function() {
	var arrayData, objectData;
	arrayData = this.serializeArray();
	objectData = {};
	$.each(arrayData, function() {
		var value;
		if (this.value != null) {
			value = this.value;
		} else {
			value = '';
		}
		if (objectData[this.name] != null) {
			if (!objectData[this.name].push) {
				objectData[this.name] = [objectData[this.name]];
			}
			objectData[this.name].push(value);
		} else {
			objectData[this.name] = value;
		}
	});
	return objectData;
};

function fnNoImage(obj) {
	$(obj).attr("src", contextPath + "/images/contents/recruitment_dummy.png");

}
function fnNoImageSoon(obj) {
	$(obj).attr("src", contextPath + "/images/template/wait.jpg");
}
function closePopup(objName) {
	$("#"+objName).remove();
}

// 페이징 처리
function fnPagination(p, callbackFuncName, targetObjName) {
	var paging = "";
	var pageCnt = p.pageSize;
	if(!callbackFuncName) {
		callbackFuncName = "fnSetPageing"
	}
	if(!targetObjName) {
		targetObjName = ".pagination"
	}
	if(p.totalPageCount < p.pageSize) {
		pageCnt = p.totalPageCount;
	}
	if(p.currentPageNo > p.pageSize) {
		paging += '<a href="javascript:'+callbackFuncName+'('+p.firstPageNo+')" class="prev_end">First page</a>';
		paging += '<a href="javascript:'+callbackFuncName+'('+p,firstPageNoOnPageList+')" class="prev_one">Prev page</a>';
	}
	for(let i = 1; i <= pageCnt; i++) {
		if(p.currentPageNo == i) {
			paging += '<strong title="Current page">'+i+'</strong>&nbsp;';
		} else {
			paging += '<a href="javascript:'+callbackFuncName+'('+i+')" title="Go to page '+i+'">'+i+'</a>&nbsp;';
		}
	}
	if(p.lastPageNo > p.pageSize) {
		paging += '<a href="javascript:'+callbackFuncName+'('+p,lastPageNoOnPageList+')" class="next_one">Next page</a>';
		paging += '<a href="javascript:'+callbackFuncName+'('+p.lastPageNo+')" class="next_end">Last page</a>';
	}
	$(targetObjName).empty();
	$(targetObjName).append(paging);
}

//이미지 원본 보기
function fnImgViewPopup(title, saveFilePath) {
	if($("#"+id).length == 0) {
		var id = "booth-layout-popup";
		var imgHTML = "";
		imgHTML += '<div class="popup" id="'+id+'">';
		imgHTML += '	<div class="bbs_popup" style="width:1000px; height: 800px;">';
		imgHTML += '		<section class="box_wrap">';
		imgHTML += '			<div class="title_box">';
		imgHTML += '				<h1 class="title">'+title+'</h1>';
		imgHTML += '			</div>';
		imgHTML += '			<div class="contents_box">';
		imgHTML += '				<div class="box type3">';
		imgHTML += '					<div class="box_wrap">';
		imgHTML += '						<div class="box_img">';
		imgHTML += '							<div class="inner">';
		imgHTML += '								<img src="'+contextPath+'/common/imgLoading.do?url='+saveFilePath+'" alt="image" onerror="fnNoImageSoon(this)" />';
		imgHTML += '							</div>';
		imgHTML += '						</div>';
		imgHTML += '					</div>';
		imgHTML += '				</div>';
		imgHTML += '				<div class="button_box">';
		imgHTML += '					<button type="button" class="bbs_btn cancel small" onclick="closePopup(\''+id+'\')">'+btnclose+'</button>';
		imgHTML += '				</div>';
		imgHTML += '			</div>';
		imgHTML += '			<button type="button" class="close" onclick="closePopup(\''+id+'\')">'+btnclose+'</button>';
		imgHTML += '		</section>';
		imgHTML += '	</div>';
		imgHTML += '</div>';
		$(document.body).append(imgHTML);
	}
	$("#"+id).show();
}

//null처리
function nvl(val, rep) {
	var ret = "";
	if(val == null || $.trim(val) == '') {
		ret = (rep == null || $.trim(rep) == '') ? "" :  rep;
	}  else {
		ret = val;
	}
	return ret;
}