<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>

<script>
$(document).ready(function(){

});

var commonAddr = {
	values : {
		"addrFullCd" : "",
		"addrFullNm" : "",
		"addrCd" : "",
		"addrNm" : ""
	},
	valueList : {

	},
	callbackFnNm : {
		"fnNm" : null
	},
	init : function() {
	    // init

		commonAddr.click();
	},
	callback : function(fn){

		commonAddr.callbackFnNm.fnNm = fn;
	},
	click : function (){
		// 주소 선택 결과가 inputbox (text 형태)
		$('.popAddr_text').on('click', function(e){
			commonAddr.select();
			commonAddr.input("text", e);
			$('#commonAddrPopup').show();
		});

		// 주소 선택 popup 닫기
		$('.btn_commonPopupClose').on('click', function(){
			$('#commonAddrPopup').hide();
		});
	},
	select : function(){
		$('.popup_box').find('.common_selectRow').unbind();
		$('.common_selectRow').on('click', function(e){
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
					url: contextPath + "/common/nextDepthSelectAjax.do",
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
								html += "<li><button type='button' class='common_selectRow' value='" + resultObj.lvlCd +"'>" + resultObj.nm + "</button></li>";
							}
						}

						$(e.target).closest('.popup_box').find('.dep1:eq(' + depth + ')').find('.scroll_cont ul').empty();
						$(e.target).closest('.popup_box').find('.dep1:eq(' + depth + ')').find('.scroll_cont ul').html(html);

						commonAddr.select();
					},
					error: function(xhr, status, error) {
						alertify.alert("error to connecting server");
					}
				});
			}
		});
	},
   	input : function(flag, event){
  		// select 버튼
		$('.popup_box').find('.btn_commonPopupSave').unbind();
		$('.popup_box').find('.btn_commonPopupSave').on('click', function(e){
			var selectFlag = false;
			$(e.target).closest('.popup_box').find('.dep1:last').find('li').each(function(i){
				if($(this).hasClass('on')){
					selectFlag = true;
				}
			});

			if(!selectFlag){
				alertify.alert("모든 주소정보를 선택해 주세요");
				return false;
			}

			var selectValHtml = "";
			var html = "";
			var lastSelectVal = "";
			var fullCd = "";

			// 선택한 값 세팅
			$(e.target).closest('.popup_box').find('.dep1').each(function(i){
				var selectText = $(this).find('.on').find('button').text();
				lastSelectVal = $(this).find('.on').find('button').val();
				var selectVal = $(this).find('.on').find('button').val();

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

				commonAddr.values.addrCd = lastSelectVal;
				commonAddr.values.addrNm = selectText;
			});

			commonAddr.values.addrFullCd = fullCd;
			commonAddr.values.addrFullNm = selectValHtml;

			// 입력하는 항목에 따라 분류
			if(flag == "text"){
				$(event.target).closest('div').find('.popAddr_input').val(selectValHtml);
			}else{

				// 이후 다른 입력 폼이 존재할 때 추가 작업 진행
				/* var $li = $(e.target).closest('.popup_box').find('.dep1:last').find('.on');
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
				} */
			}

			if(typeof commonAddr.callbackFnNm.fnNm == 'function'){
				//commonAddr.callbackFnNm.fnNm(JSON.stringify(commonAddr.values));
				commonAddr.callbackFnNm.fnNm(commonAddr.values);
			}

			$('#commonAddrPopup').hide();
		});
	}
};

</script>

<div id="commonAddrPopup" style="position: fixed; top: 0; right: 0; bottom: 0; left: 0; z-index: 1000; background-color: rgba(0,0,0, 0.4); overflow-x: hidden; display: none;">
	<div class="popup_box " style="position: fixed; width: 50%; top: 25%; left: 25%;">
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
											<c:forEach items="${commonLocCdList }" var="locCd">
												<li>
													<button type="button" class="common_selectRow" value="${locCd.lvlCd }"><c:out value="${locCd.nm }" /></button>
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
						<button type="button" class="bbs_btn save btn_commonPopupSave">Select</button>
						<button type="button" class="bbs_btn cancel btn_commonPopupClose">Cancel</button>
					</div>
					<button type="button" class="close btn_commonPopupClose">close of popup</button>
				</div>
			</section>
		</div>
	</div>
</div>