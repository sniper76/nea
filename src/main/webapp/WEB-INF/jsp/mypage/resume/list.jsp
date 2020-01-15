<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>

    <script>
    	$(document).ready(function() {
    		var resumeNotSelectMsg = "<spring:message code='resume.list.errors.msg1'/>";
    		var tempResumeSelectMsg = "<spring:message code='resume.list.errors.msg2'/>";
    		var resumeFullInsertMsg = "<spring:message code='resume.write.insert.fullCnt'/>";

    		var priResumeYnCompleteMsg = "<spring:message code='resume.list.update.priResumeYn.complete'/>";

    		var deleteCompleteMsg = "<spring:message code='resume.list.delete.complete'/>";
    		var deleteApplicErrorMsg = "<spring:message code='resume.list.delete.errors1'/>";
    		var deleteReferralErrorMsg = "<spring:message code='resume.list.delete.errors2'/>";
    		var deleteBothErrorMsg = "<spring:message code='resume.list.delete.errors3'/>";

    		// 여러개 선택할 필요가 없을것 같아 checkbox를 radio와 동일하게 동작하도록 수정
			$('.chk').on('click', function(e){
				$('.chk').prop('checked', false);

				$(e.target).prop('checked', true);
			});

    		// 대표 이력서 지정
    		$('#btn_active').on('click',function(){
    			var resumeSeq = "";
    			var tempResumeCheck = false;
    			$('.chk').each(function(){
    				if($(this).prop('checked')){
    					resumeSeq = $(this).val();
    					resumeSeq = $(this).val();

    					if($(this).closest('.contents_box').is('.incomplete')){
    						tempResumeCheck = true;
    					}
    				}
    			});

				if(resumeSeq == ""){
					alertify.alert(resumeNotSelectMsg);
					return false;
				}

				if(tempResumeCheck){
					alertify.alert(tempResumeSelectMsg);
					return false;
				}

    			$.ajax({
					type: 'post',
					url: contextPath + "/cpes/private/resume/updatePriResumeYnAjax.do",
					dataType: 'json',
					data: {
						"resumeSeq" : resumeSeq
					},
					success: function(data) {

						if(data.result == "Y"){
							alertify.alert(priResumeYnCompleteMsg, function (e){
								location.href = contextPath + "/cpes/private/resume/list.do";
							});
						}else if(data.result == "99"){
							alertify.alert("입사지원, 입사제의, 면접제의가 진행중인 대표이력서는 변경할 수 없습니다.");
						}else{
							alertify.alert(errorMsg);
						}

					},
					error: function(xhr, status, error) {
						alertify.alert(errorMsg);
					}
				});
    		});

    		// 등록 버튼
    		$('#btn_insert').on('click', function(){
				var resumeTotCnt = $('#resultListCnt').val();

				if(resumeTotCnt >= 5){
					alertify.alert(resumeFullInsertMsg);
					return false;
				}else{
					location.href = contextPath + "/cpes/private/resume/write.do";
				}
    		});

    		// 삭제 버튼
    		$('.btn_delete').on('click', function(e){
    			var resumeSeq = $(e.target).val();

				$.ajax({
					type: 'post',
					url: contextPath + "/cpes/private/resume/deleteResumeAjax.do",
					dataType: 'json',
					data: {
						"resumeSeq" : resumeSeq
					},
					success: function(data) {

						/**
						 * 이력서 삭제
						 * result
						 * 10 : 입사지원 중
						 * 20 : 채용알선이 진행중
						 * 30 : 입사지원 and 채용알선 진행중
						 * 40 : 데이터 오류 (이력서 / 임시 이력서 둘 다 존재하거나, 둘 다 존재하지 않음)
						 * 50 : 삭제 처리 실패
						 * 99 : 삭제 처리 완료
						 */
						if(data.result == "99"){
							alertify.alert(deleteCompleteMsg, function (e){
								location.href = contextPath + "/cpes/private/resume/list.do";
							});
						}else if(data.result == "10"){
							alertify.alert(deleteApplicErrorMsg);
						}else if(data.result == "20"){
							alertify.alert(deleteReferralErrorMsg);
						}else if(data.result == "30"){
							alertify.alert(deleteBothErrorMsg);
						}else{
							alertify.alert(errorMsg);
						}

					},
					error: function(xhr, status, error) {
						alertify.alert(errorMsg);
					}
				});
    		});

    		// 이력서 복사
    		$('.btn_copy').on('click', function(e){

    			var resumeTotCnt = $('#resultListCnt').val();

				if(resultListCnt >= 5){
					alertify.alert(resumeFullInsertMsg);
					return false;
				}else{
					var resumeSeq = $(e.target).val();
					var tempFlag = "";

					if($(e.target).closest('.contents_box').is('.incomplete')){
						tempFlag = "1";
					}else{
						tempFlag = "0";
					}

					$('#resumeSeq').val(resumeSeq);
					$('#tempFlag').val(tempFlag);

					$('#updateForm').attr('action', contextPath + '/cpes/private/resume/copyResume.do');
					$('#updateForm').submit();
				}

    		});

    		// 이력서 수정
    		$('.btn_modify').on('click', function(e){
    			var resumeSeq = $(e.target).val();
				var tempFlag = "";

				if($(e.target).closest('.contents_box').is('.incomplete')){
					tempFlag = "1";
				}else{
					tempFlag = "0";
				}

				$('#resumeSeq').val(resumeSeq);
				$('#tempFlag').val(tempFlag);

				$('#updateForm').attr('action', contextPath + '/cpes/private/resume/updateResume.do');
				$('#updateForm').submit();
    		});

		});

    	// 이력서 상세 화면
    	function goResumeDetail(resumeSeq, tempFlag){
			if(tempFlag == "Y"){
	    		$('#tempFlag').val("1");
			}else{
				$('#tempFlag').val("0");
			}

    		$('#resumeSeq').val(resumeSeq);
			$('#updateForm').attr('action', contextPath + '/cpes/private/resume/resumeDetail.do');
			$('#updateForm').submit();
    	}

	</script>

<main class="colgroup" id="colgroup">
	<article>
		<header class="sub_head">
			<div class="sub_title">
				<h2><span>CV List</span></h2>
			</div>
		</header>

        <div id="contents" class="resumeList">
			<div class="bbs_info clearfix"><!-- 서브페이지에 탭 메뉴가 있을 경우 클래스 tab_confirm 추가  -->
				<div class="bbs_left bbs_count">
					<!-- <strong class="currently">1</strong>
					<span class="total">/&nbsp;1</span>
					<span class="order">
						<h3 class="h0 skip">Change list order</h3>
						<button type="button">Latest</button>
						<button type="button">View</button>
						<button type="button">like</button>
					</span> -->
				</div>
			</div>
			<!-- //bbs_info -->

			<form id="updateForm" action="${pageContext.request.contextPath}/cpes/private/resume/copyResume.do" method="post">
				<input type="hidden" id="resumeSeq" name="resumeSeq">
				<input type="hidden" id="tempFlag" name="tempFlag">
			</form>

			<input type="hidden" id="resultListCnt" value="${fn:length(resultList)}">
			<div class="bbs_basic">
				<ul class="cv_list clearfix">
					<c:forEach items="${resultList }" var="result">
						<li>
							<!-- 대표 이력서일 경우 클래스 active , 작성중인 이력서일 경우 클래스 incomplete 추가 -->
							<c:choose>
								<c:when test="${result.priResumeYn eq 'Y' }">
									<div class="contents_box active">
								</c:when>
								<c:when test="${result.tempFlag eq 'Y' }">
									<div class="contents_box incomplete">
								</c:when>
								<c:otherwise>
									<div class="contents_box">
								</c:otherwise>
							</c:choose>
								<div class="title_box">
									<span class="check">
										<input type="checkbox" class="chk" id="${result.resumeSeq }" value="${result.resumeSeq }"/>
										<label for="${result.resumeSeq }">CV Selection</label>
									</span>
									<a href="javascript:goResumeDetail('${result.resumeSeq}', '${result.tempFlag }');" class="title a_detail"><c:out value="${result.resumeTitle }" escapeXml="false"/></a>
									<div class="bbs_function">
										<button type="button" class="bbs_btn noround small btn_copy" value="${result.resumeSeq }">Copy</button>
										<c:if test="${result.updateFlag eq 'true' }">
											<button type="button" class="bbs_btn noround small btn_modify" value="${result.resumeSeq }">Modify</button>
											<button type="button" class="bbs_btn noround small btn_delete" value="${result.resumeSeq }">Delete</button>
										</c:if>
									</div>
								</div>
								<div class="cont_box">
									<span class="cont"><span class="bbs_ico time">Time</span><c:out value="${result.regDt }" escapeXml="false"/></span>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
			<!-- //bbs_basic list -->

			<c:if test="${empty resultList}">
				<div class="bbs_empty">
					<p><spring:message code="counsel.msg.no.data"/></p>
					<!-- <p>No results found. <br />Please enter a search term in the search box again.</p> -->
				</div>
				<!-- //bbs_empty -->
			</c:if>
			<!-- //bbs_empty -->

			<div class="bbs_btn_wrap clearfix">
				<span class="bbs_left">

				</span>
				<span class="bbs_right">
					<button type="button" class="bbs_btn type02" id="btn_active">SELECT ACTIVE</button>
					<button type="button" class="bbs_btn type01" id="btn_insert">REGISTER NEW CV</button>
				</span>
			</div>
			<!-- //bbs_btn_wrap -->
		</div>
                <!-- //contents -->
	</article>

</main>

<!-- <div id="ex1" class="modal">
  <p>Thanks for clicking. That felt good.</p>
  <a href="#" rel="modal:close">Close</a>
</div> -->