<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.text.*" %>
<%@ page import="ony.framework.util.DateUtil"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
<%
	Calendar cal = Calendar.getInstance();
	String paramYear= request.getParameter("year");
	int year  = cal.get(Calendar.YEAR);
	if(paramYear != null) {
		year = Integer.parseInt(paramYear);
	}
%>
 <main class="colgroup" id="colgroup">
	<article>
		<header class="sub_head">
			<div class="sub_title">
				<!-- 노동시장 지표 -->
				<h2><span><spring:message code="info.lmi.tt01" /></span></h2>
			</div>
		</header>
		<div id="contents" class="lmi">

			<div class="box_calendar">
				 <div class="calendar_top clearfix">
			        <div class="month_box">
			            <div class="box_wrap">
			                <div class="date_box">
								<span class="year"><%=year%></span>
			                    <a href="javascript:fnGoYear(<%=year-1%>)" class="prev"><spring:message code="info.lmi.tt02" /></a><!-- Previous Year -->
			                    <a href="javascript:fnGoYear(<%=year+1%>)" class="next"><spring:message code="info.lmi.tt03" /></a><!-- Next Year -->
			                </div>
			            </div>
			        </div>
			    </div>
				<!-- //calendar_top -->
			</div>
			<!-- //box_calendar -->

			<c:if test="${!empty resultList}">
			<div class="labour_market">
				<div class="box_wrap">
					<c:set var="befDepth" value="${0}" />
					<c:set var="maxLen" value="${fn:length(resultList)}" />
					<c:set var="idx" value="${0}" />
					<c:forEach var="data" items="${resultList}" varStatus="status">
						<c:set var="idx" value="${idx+1}" />
							<c:if test="${befDepth >= 3 && data.depth < 3}"></ul></c:if>
							<c:if test="${befDepth < data.depth && data.depth == 3}"><ul class="clearfix"></c:if>

						<c:if test="${befDepth >= 1 && data.depth == 1}"></div></c:if>
						<c:if test="${befDepth == 0 || (befDepth >= data.depth && data.depth == 1)}"><div class="contents_box"></c:if>

						<c:if test="${data.depth == '1'}">
							<div class="labour_box title_box">
								<h4 class="h0 title"><c:out value="${data.indicItemNm}" /></h4>
								<span class="cont"><c:out value="${data.content}" /></span>
							</div>
						</c:if>

						<c:if test="${data.depth == '2'}">
							<div class="labour_box tit_box">
								<strong class="title"><c:out value="${data.indicItemNm}" /></strong>
								<span class="cont"><c:out value="${data.content}" /></span>
							</div>
						</c:if>

						<c:if test="${data.depth == '3'}">
								<li>
									<div class="labour_box cont_box">
										<strong class="title"><c:out value="${data.indicItemNm}" /></strong>
										<span class="cont"><c:out value="${data.content}" /></span>
									</div>
								</li>
						</c:if>

						<c:set var="befDepth" value="${data.depth}" />
					</c:forEach>
					<c:if test="${idx > 0 && idx == maxLen}"></div></c:if>
				</div>
			</div>
			<!-- //labour_market -->
			</c:if>

			<c:if test="${empty resultList}">
			<div class="bbs_empty">
				<p><spring:message code="counsel.msg.no.data"/></p>
			</div>
			<!-- //bbs_empty -->
			</c:if>

		</div>
		<!-- //contents -->
	</article>
</main>
<!-- //main.colgroup -->

<script>
	$(document).ready(function() {

	});
	function fnGoYear(year) {
		document.location.href = contextPath+"/info/lmi.do?year="+year;
	}
</script>