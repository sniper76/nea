<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>

<c:forEach var="data" items="${resultList}" varStatus="status">
	<li>
		<div class="reply_title">
			<strong class="name">${data.regNm}</strong>
			<span class="date">${data.regDt}</span>
			<c:if test="${data.modifyYn == 'Y'}">
				<button type="button" onclick="javascript:fnGoDeleteReplyComment(this,'${data.bulletinSeq}','${data.commentSeq}','${data.upperCommentSeq}','2');" class="delete"><spring:message code="button.delete"/></button><!-- 본인 글에만 노출 -->
			</c:if>
		</div>
		<div class="reply_cont">
			<c:set var="cmt" value="${fn:replace(data.content,crcn,br)}" />
			<c:set var="cmt" value="${fn:replace(cmt,cr,br)}" />
			<c:set var="cmt" value="${fn:replace(cmt,cn,br)}" />
			<c:set var="cmt" value="${fn:replace(cmt,' ',sp)}" />
			<c:out value="${cmt}" escapeXml="false"/>
		</div>
	</li>
</c:forEach>
