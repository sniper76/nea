<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>

<script>
$(document).ready(function(){
	var insertOfferComplete = "<spring:message code='mypage.offer.insertOffer.complete'/>";

	$('.btn_commonPopupClose').on('click', function(e){
		$('.chk').prop('checked', false);
		$('#commonOfferPopup').hide();
	});

	$('.chk').on('click', function(e){
		$('.chk').prop('checked', false);

		$(e.target).prop('checked', true);
	});

	$('.btn_commonJobOffer').on('click', function(e){
		var resumeSeq = $('#commonOfferPopup').find('#offer_resumeSeq').val();
		var vacancySeq = $('#commonOfferPopup').find('input[class=chk]:checked').val();

		if(vacancySeq == "" || typeof vacancySeq == "undefined"){
			alert("입사제의에 사용할 채용공고를 선택해 주세요.");
			return false;
		}

		$.ajax({
			type: 'post',
			url: contextPath + "/cpes/compny/offer/commonOfferInsert.do",
			dataType: 'json',
			data: {
				"vacancySeq" : vacancySeq,
				"resumeSeq" : resumeSeq
			},
			success: function(data) {
				if(data.result.successYn == "Y"){
					alertify.alert(insertOfferComplete, function (e){
						$('.btn_commonPopupClose').click();
					});
				}else{

				}
			},
			error: function(xhr, status, error) {
				alertify.alert("error to connecting server");
			}
		});
	});
});

</script>

<div id="commonOfferPopup" style="position: fixed; top: 0; right: 0; bottom: 0; left: 0; z-index: 1000; background-color: rgba(0,0,0, 0.4); overflow-x: hidden; display: none;">
	<div class="popup_box " style="position: fixed; width: 50%; top: 20%; left: 25%;">
		<div class="bbs_popup"><!-- 팝업 가로, 세로 지정하지 않았습니다. 필요에 딸라 지정해서 사용 -->
			<section class="box_wrap">
				<div class="title_box">
					<h1 class="title"><span id="popup_title"></span> Selection</h1>
					<input type="hidden" id="offer_resumeSeq">
				</div>
				<div class="contents_box">
					<ul class="cv_list clearfix" style="overflow-x: scroll; height: 500px;">
						<c:forEach items="${resultList }" var="result">
							<li>
								<div class="contents_box">
									<div class="title_box">
										<span class="check">
											<input type="checkbox" class="chk" id="${result.vacancySeq }" value="${result.vacancySeq }"/>
											<label for="${result.vacancySeq }">CV Selection</label>
										</span>
										<c:out value="${result.vacancyTitle }" escapeXml="false"/>
									</div>
									<div class="cont_box">
										<span class="cont"><c:out value="${result.recrumtMemb }" escapeXml="false"/></span>
										<span class="cont"><c:out value="${result.recrumtMemb }" escapeXml="false"/></span>
										<span class="cont">
											$<fmt:formatNumber type="number" maxFractionDigits="3" value="${result.minSalaryAmt}" />
											~
											$<fmt:formatNumber type="number" maxFractionDigits="3" value="${result.maxSalaryAmt}" />
										</span>
										<span class="cont">~<c:out value="${result.endDt}" escapeXml="false"/></span>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
					<div class="button_box">
						<button type="button" class="bbs_btn save btn_commonJobOffer"><spring:message code="mypage.compny.jobOffer"/></button>
					</div>
					<button type="button" class="close btn_commonPopupClose">close of popup</button>
				</div>
			</section>
		</div>
	</div>
</div>