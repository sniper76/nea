<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>

    <script>
    	$(document).ready(function() {
    		dext5uploadAllFileSet("dext5uploadArea", '', '', '', '', '', '');
		});

	</script>

	<table class="bbs_table write">
		<caption>Consulting Write -  Contents , Attach</caption>
		<colgroup>
			<col style="width:15%;" />
			<col style="width:85%;" />
		</colgroup>
		<tbody>
		<tr>
			<td colspan="2">
				<label for="content" class="skip"><spring:message code="counsel.msg.contents"/></label>
				<textarea id="qustContent" name="qustContent" cols="30" rows="10" title="Contents" class="bbs_write_content"></textarea>
			</td>
		</tr>
		<tr>
			<th scope="row"><span class="exactly"></span> <spring:message code="counsel.msg.file.add"/></th><!-- 필수 황목일 경우 exacly 에 클래스 y 추가 -->
			<td>
				<label for="attach1" class="skip"><spring:message code="counsel.msg.file.add"/></label>
				<div id="dext5uploadArea"></div>
			</td>
		</tr>
		</tbody>
	</table>

