<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>

<script>
$(document).ready(function(){

});

</script>

<div id="commonPopup" style="position: fixed; top: 0; right: 0; bottom: 0; left: 0; z-index: 1000; background-color: rgba(0,0,0, 0.4); overflow-x: hidden; display: none;">
	<div class="popup_box " style="position: fixed; width: 50%; top: 25%; left: 25%;">
		<div class="bbs_popup"><!-- 팝업 가로, 세로 지정하지 않았습니다. 필요에 딸라 지정해서 사용 -->
			<section class="box_wrap">
				<div class="title_box">
					<h1 class="title"><span id="popup_title"></span> Selection</h1>
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
											<c:forEach items="${result }" var="common">
												<li>
													<button type="button" class="common_selectRow" value="${common.cd }"><c:out value="${common.cdNm }" /></button>
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