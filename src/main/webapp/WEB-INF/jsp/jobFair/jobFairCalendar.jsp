<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.text.*" %>
<%@ page import="ony.framework.util.DateUtil" %>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
<%!
	private String dayOfWeekName(int dayOfWeek) {
		String ret = "";
		switch(dayOfWeek) {
		case 1: ret = "Sun"; break;
		case 2: ret = "Mon"; break;
		case 3: ret = "Tue"; break;
		case 4: ret = "Wed"; break;
		case 5: ret = "Thr"; break;
		case 6: ret = "Fri"; break;
		case 7: ret = "Sat"; break;
		}
		return ret;
	}
%>
<%
	String langCd = response.getLocale().getLanguage();
	Calendar cal = Calendar.getInstance();
	String paramYear= request.getParameter("year");
	String paramMonth = request.getParameter("month");

	int year  = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH);
	int date  = cal.get(Calendar.DATE);

	if(paramYear != null) {
		year = Integer.parseInt(paramYear);
	}
	if(paramMonth != null) {
		month = Integer.parseInt(paramMonth);
		month--;
	}
	cal.set(year, month, 1);
	String monthDesc = cal.getDisplayName(Calendar.MONTH, Calendar.LONG, response.getLocale());

	int startDay = cal.getMinimum(Calendar.DATE);
	int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	int start = cal.get(Calendar.DAY_OF_WEEK);
	int newLine = 0;

	Calendar todayCal = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd");
	int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));

	SimpleDateFormat sdfDate = new SimpleDateFormat("dd");
	Calendar prevCal = Calendar.getInstance();

	String dayOfWeek = "", today = "";
%>
<main class="colgroup" id="colgroup">
	<article>
    	<header class="sub_head">
			<div class="sub_title">
				<h2>
					<span><spring:message code="menu.jobfair"/></span>
				</h2>
			</div>
      	</header>
       	<div id="contents" class="jobFairApplyList">

			<div class="box_calendar">
			    <div class="calendar_tab">
			        <a href="javascript:fnGoList()" class="list">List</a>
			        <a href="javascript:void(0)" class="cal on">Calendar</a>
			    </div>
				<!-- //calendar_tab -->

				 <div class="calendar_top clearfix">
			        <div class="month_box">
			            <div class="box_wrap">
			                <div class="date_box">
			                    <span class="month"><%=monthDesc%></span>
								<span class="year"><%=year%></span>
								<%if(month == 0) {%>
			                    <a href="javascript:fnGoMonth(<%=year-1%>, 12)" class="prev">Previous Month</a>
								<%} else {%>
			                    <a href="javascript:fnGoMonth(<%=year%>, <%=month%>)" class="prev">Previous Month</a>
								<%}%>
								<%if(month == 11) {%>
			                    <a href="javascript:fnGoMonth(<%=year+1%>, 1)" class="next">Next Month</a>
								<%} else {%>
			                    <a href="javascript:fnGoMonth(<%=year%>, <%=month+2%>)" class="next">Next Month</a>
			                    <%}%>
			                </div>
			            </div>
			        </div>

			        <div class="ex_box">
			            <span class="ex_item ncpf"><span>NCPF</span> : National Career and Productivity Fair</span>
			            <span class="ex_item pcpf"><span>PCPF</span> : Provincial Career and Productivity Fair</span>
			            <span class="ex_item ep"><span>EP</span> : Employment Forum</span>
			            <span class="ex_item mj"><span>MJ</span> : Mobile Job Fair</span>
			            <span class="ex_item rf"><span>RF</span> : Related Fair</span>
			        </div>
			    </div>
				<!-- //calendar_top -->

				<div class="calendar">
			        <table>
			            <caption>Monthly schedule</caption>
			            <colgroup>
			                <col width="14%" />
			                <col width="14%" />
			                <col width="14%" />
			                <col width="14%" />
			                <col width="14%" />
			                <col width="14%" />
			                <col width="14%" />
			            </colgroup>
			            <thead>
				            <tr>
				                <th scope="col" class="su">Sunday</th>
				                <th scope="col">Monday</th>
				                <th scope="col">Tusday</th>
				                <th scope="col">Wednseday</th>
				                <th scope="col">Thursday</th>
				                <th scope="col">Friday</th>
				                <th scope="col" class="sa">Saturday</th>
				            </tr>
			            </thead>
			            <tbody>
			            	<tr>
<%	prevCal.set(year, month, 1);
	prevCal.add(Calendar.DATE, start*-1);

	for(int i = 1; i < start; i++) {
		prevCal.add(Calendar.DATE, 1);
%>								<td class="no<%	if(prevCal.get(Calendar.DAY_OF_WEEK) == 1) {%> su<%} else if(prevCal.get(Calendar.DAY_OF_WEEK) == 7) { %> sa<%}%>">
									<div class="cont">
										<span class="num"><%=Integer.parseInt(sdfDate.format(prevCal.getTime()))%><span><%=dayOfWeekName(prevCal.get(Calendar.DAY_OF_WEEK))%></span></span>
				                        <c:if test="${!empty jobFairList}">
							            <ul>
											<% request.setAttribute("currDate", Integer.parseInt(sdf.format(prevCal.getTime()))); %>
											<c:forEach var="data" items="${jobFairList}" varStatus="status">
												<c:if test="${data.fairBgnDt <= currDate && data.fairEndDt >= currDate}">
							                 <li title="<c:out value="${data.fairNm}" escapeXml="false" />">
							                 	<a href="javascript:fnGoView('<c:out value="${data.fairSeq}" />')" class="item <c:if test="${data.fairStsCd == 'FAS0000000004'}">closed</c:if> <c:choose><c:when test="${data.fairDivCd == 'FDC0000000001'}">ncpf</c:when><c:when test="${data.fairDivCd == 'FDC0000000002'}">pcpf</c:when><c:when test="${data.fairDivCd == 'FDC0000000003'}">ep</c:when><c:when test="${data.fairDivCd == 'FDC0000000004'}">mj</c:when><c:when test="${data.fairDivCd == 'FDC0000000005'}">rf</c:when></c:choose>"><c:out value="${data.fairNm}" escapeXml="false" /></a>
							                 </li>
												</c:if>
							   				</c:forEach>
							            </ul>
							            </c:if>
									</div>
								</td>
<%		newLine++;
	}
	for(int index = 1; index <= endDay; index++) {
		if(Integer.parseInt(sdf.format(cal.getTime())) == intToday) {
			today = "today";
		} else {
			today = "";
		}
		if(cal.get(Calendar.DAY_OF_WEEK) == 1) {
			dayOfWeek = "su";
		} else if(cal.get(Calendar.DAY_OF_WEEK) == 7) {
			dayOfWeek = "sa";
		} else {
			dayOfWeek = "";
		}
%>				                <td class="<%=dayOfWeek%> <%=today%>">
				                    <div class="cont">
				                        <span class="num"><%=index%><span><%=dayOfWeekName(cal.get(Calendar.DAY_OF_WEEK))%></span></span>
				                        <c:if test="${!empty jobFairList}">
							            <ul>
											<% request.setAttribute("currDate", Integer.parseInt(sdf.format(cal.getTime()))); %>
											<c:forEach var="data" items="${jobFairList}" varStatus="status">
												<c:if test="${data.fairBgnDt <= currDate && data.fairEndDt >= currDate}">
							                 <li title="<c:out value="${data.fairNm}" escapeXml="false" />">
							                 	<a href="javascript:fnGoView('<c:out value="${data.fairSeq}" />')" class="item <c:if test="${data.fairStsCd == 'FAS0000000004'}">closed</c:if> <c:choose><c:when test="${data.fairDivCd == 'FDC0000000001'}">ncpf</c:when><c:when test="${data.fairDivCd == 'FDC0000000002'}">pcpf</c:when><c:when test="${data.fairDivCd == 'FDC0000000003'}">ep</c:when><c:when test="${data.fairDivCd == 'FDC0000000004'}">mj</c:when><c:when test="${data.fairDivCd == 'FDC0000000005'}">rf</c:when></c:choose>"><c:out value="${data.fairNm}" escapeXml="false" /></a>
							                 </li>
												</c:if>
							   				</c:forEach>
							            </ul>
							            </c:if>
				                    </div>
				                </td>
<%		newLine++;
		if(newLine == 7) {
%>							</tr>
<%			if(index <= endDay) {
%>							<tr>
<%  			}
  			newLine = 0;
		}
		cal.add(Calendar.DATE, 1);
	}

	while(newLine > 0 && newLine < 7) {
%>
				                <td class="no<%	if(cal.get(Calendar.DAY_OF_WEEK) == 1) {%> su<%} else if(cal.get(Calendar.DAY_OF_WEEK) == 7) { %> sa<%}%>">
				                    <div class="cont">
				                        <span class="num"><%=Integer.parseInt(sdfDate.format(cal.getTime()))%><span><%=dayOfWeekName(cal.get(Calendar.DAY_OF_WEEK))%></span></span>
				                        <c:if test="${!empty jobFairList}">
							            <ul>
											<% request.setAttribute("currDate", Integer.parseInt(sdf.format(cal.getTime()))); %>
											<c:forEach var="data" items="${jobFairList}" varStatus="status">
												<c:if test="${data.fairBgnDt <= currDate && data.fairEndDt >= currDate}">
							                 <li>
							                 	<a href="javascript:fnGoView('<c:out value="${data.fairSeq}" />')" class="item <c:if test="${data.fairStsCd == 'FAS0000000004'}">closed</c:if> <c:choose><c:when test="${data.fairDivCd == 'FDC0000000001'}">ncpf</c:when><c:when test="${data.fairDivCd == 'FDC0000000002'}">pcpf</c:when><c:when test="${data.fairDivCd == 'FDC0000000003'}">ep</c:when><c:when test="${data.fairDivCd == 'FDC0000000004'}">mj</c:when><c:when test="${data.fairDivCd == 'FDC0000000005'}">rf</c:when></c:choose>"><c:out value="${data.fairNm}" escapeXml="false" /></a>
							                 </li>
												</c:if>
							   				</c:forEach>
							            </ul>
							            </c:if>
				                    </div>
				                </td>
<%  	newLine++;
		cal.add(Calendar.DATE, 1);
	}
%>			            </tbody>
			        </table>
			    </div>
				<!-- //calendar -->
			</div>
			<!-- //box_calendar -->

		</div>
		<!-- //contents -->
	</article>
</main>
<!-- //main.colgroup -->

<form name="viewFrm" action="${pageContext.request.contextPath}/jobFair/view.do" method="post">
	<input type="hidden" name="returnUrl" />
	<input type="hidden" name="condSeq" />
	<input type="hidden" name="year" />
	<input type="hidden" name="month" />
</form>

<script>
	$(document).ready(function() {

	});
	function fnGoList() {
		document.location.href = contextPath+"/jobFair/jobFairList.do";
	}
	function fnGoMonth(year, month) {
		document.location.href = contextPath+"/jobFair/jobFairCalendar.do?year="+year+"&month="+month;
	}
	function fnGoView(fairSeq) {
		var f = $("[name=viewFrm]")[0];
		f.returnUrl.value = "${pageContext.request.contextPath}/jobFair/jobFairCalendar.do";
   		f.condSeq.value = fairSeq;
   		f.year.value = "<%=year%>";
   		f.month.value = "<%=month+1%>";
   		f.submit();
	}
</script>