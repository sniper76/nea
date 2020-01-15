<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>

<div class="popup" id="booth-req-popup">
	<div class="bbs_popup">
		<section class="box_wrap">
			<div class="title_box">
				<h1 class="title"><spring:message code="jobfair.booth.ttl01" /></h1>
			</div>
			<div class="contents_box">
				<div class="pop_booth">
					<div class="booth_top">
						<div class="tit_box">
							<strong class="title"><c:out value="${jobFairInfo.fairNm }" escapeXml="false" /></strong>
						</div>
						<div class="cont_box">
							<ul class="clearfix">
							<li>
								<div class="cont">
									<strong class="title"><spring:message code="jobfair.booth.no" /></strong>
									<span class="con"><c:out value="${jobFairBooth.boothNm}" /></span>
								</div>
							</li>
							<li>
								<div class="cont">
									<strong class="title"><spring:message code="jobfair.booth.fee" /></strong>
									<span class="con">$<fmt:formatNumber type="number" maxFractionDigits="3" value="${jobFairBooth.boothFee}" /></span>
								</div>
							</li>
							</ul>
						</div>
					</div>
					<div class="booth_contents">
						<div class="tit_box">
							<strong class="title"><spring:message code="jobfair.booth.apply.ttl05" /></strong>
						</div>
						<form name="jobFairBoothReqFrm">
							<input type="hidden" name="fairSeq" value="<c:out value="${param.condSeq}" />" />
							<input type="hidden" name="boothSeq" value="<c:out value="${param.boothSeq}" />" />
							<table class="pop_booth_table">
								<caption><spring:message code="jobfair.booth.apply.ttl05" /></caption>
								<colgroup>
									<col style="width:20%;" />
									<col style="width:80%;" />
								</colgroup>
								<tbody>
								<tr>
									<th scope="row"><spring:message code="compnyNm" /></th>
									<td><c:out value="${compnyNm}" /></td>
								</tr>
								<tr>
									<th scope="row"><label for="booth_input1"><spring:message code="member.join.step.two.compnay.msg11" /></label></th>
									<td>
										<input type="text" id="booth_input1" name="mngerNm" value="<c:out value="${mngerNm}" />" maxlength="100" />
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="booth_input2"><spring:message code="mypage.instt.eduTrnng.title33" /></label></th>
									<td>
										<input type="text" id="booth_input2" name="mngerCell" value="<c:out value="${mngerCell}" />" maxlength="100" />
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="booth_input3"><spring:message code="login.stop.email" /></label></th>
									<td>
										<input type="text" id="booth_input3" name="mngerEmail" value="<c:out value="${mngerEmail}" />" maxlength="100" />
									</td>
								</tr>
								</tbody>
							</table>
						</form>
					</div>
				</div>

				<div class="button_box">
					<!-- 부스 신청 -->
					<button type="button" class="bbs_btn save small" onclick="fnBoothReqSave('<c:out value="${param.boothSeq}" />')"><spring:message code="apply.booth" /></button>
					<!-- 취소 -->
					<button type="button" class="bbs_btn cancel small" onclick="closePopup('booth-req-popup')"><spring:message code="login.findPwd.btn.cancel" /></button>
				</div>
			</div>
			<button type="button" class="close" onclick="closePopup('booth-req-popup')"><spring:message code="button.close2" /></button>
		</section>
	</div>
</div>
