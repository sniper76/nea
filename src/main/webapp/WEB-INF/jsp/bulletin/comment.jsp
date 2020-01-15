<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>

<ul><!-- 댓글 리스트 처음에 5개 노출 -->
	<c:set var="bulletinSeq" value="0"/>
	<c:forEach var="data" items="${resultList}" varStatus="status">
	<c:set var="bulletinSeq" value="${data.bulletinSeq}"/>
	<li>
		<div class="reply_title">
			<strong class="name"><c:out value="${data.regNm}"/></strong>
			<span class="date"><c:out value="${data.regDt}"/></span>
			<c:if test="${data.modifyYn == 'Y'}">
				<button type="button" onclick="javascript:fnGoDeleteComment('commentList','${data.bulletinSeq}','${data.commentSeq}','1');" class="delete"><spring:message code="button.delete"/></button>
			</c:if>
		</div>
		<div class="reply_cont">
			<c:set var="cmt" value="${fn:replace(data.content,crcn,br)}" />
			<c:set var="cmt" value="${fn:replace(cmt,cr,br)}" />
			<c:set var="cmt" value="${fn:replace(cmt,cn,br)}" />
			<c:set var="cmt" value="${fn:replace(cmt,' ',sp)}" />
			<c:out value="${cmt}" escapeXml="false"/>
		</div>

		<div class="reply_more">
			<button type="button" onclick="javascript:fnGoCommentReplyList('reply_depth2_${paginationInfo.currentPageNo}_${status.count}','commentReplyList_${paginationInfo.currentPageNo}_${status.count}','replyCnt_${paginationInfo.currentPageNo}_${status.count}','${data.bulletinSeq}','${data.commentSeq}','2');" class="btn_more"><spring:message code="bulletin.msg.reply.nm"/></button>
			<strong id="replyCnt_${paginationInfo.currentPageNo}_${status.count}"><fmt:formatNumber type="number" maxFractionDigits="3" value="${data.commentCnt}" /></strong>
			<span id="commentByteCnt_${paginationInfo.currentPageNo}_${status.count}">0</span>/<span>300</span>
		</div>


		<div class="reply_depth2" id="reply_depth2_${paginationInfo.currentPageNo}_${status.count}"><!-- reply_depth2 -->
			<c:if test="${loginYn == 'Y'}">
			<div class="reply_form">
				<fieldset>
					<legend>Write a comment</legend>
					<div class="reply_txt">
						<textarea id="replyContent_${paginationInfo.currentPageNo}_${status.count}" title="Write a comment" onBlur="javascript:fnBytesHandler(this,'commentByteCnt_${paginationInfo.currentPageNo}_${status.count}',300);"></textarea>
					</div>
					<input type="button" onclick="javascript:fnCommentReplyWrite('${data.bulletinSeq}','${data.commentSeq}','2','1','replyContent_${paginationInfo.currentPageNo}_${status.count}','commentReplyList_${paginationInfo.currentPageNo}_${status.count}','replyCnt_${paginationInfo.currentPageNo}_${status.count}');" value="<spring:message code="button.create"/>" class="submit" />
				</fieldset>
			</div>
			</c:if>
			<div class="reply_list">
				<ul id="commentReplyList_${paginationInfo.currentPageNo}_${status.count}">
				</ul>
			</div>
		</div>

	</li>
	</c:forEach>
</ul>
<c:if test="${!empty resultList && paginationInfo.totalPageCount > paginationInfo.currentPageNo}">
	<div class="put_box" id="put_box_${paginationInfo.currentPageNo}"><!-- 댓글 리스트가 5개 이상 존재 할 때 노출 -->
		<button type="button" onclick="javascript:fnCommentList('${bulletinSeq}','commentList',${paginationInfo.currentPageNo + 1},'1','put_box_${paginationInfo.currentPageNo}');"><spring:message code="bulletin.msg.more.btn.nm"/></button>
	</div>
</c:if>
<script>
	try {
		$("#orgCommentCnt").html(fnNumberWithCommas(${paginationInfo.totalRecordCount}));
	} catch(e){}
</script>

