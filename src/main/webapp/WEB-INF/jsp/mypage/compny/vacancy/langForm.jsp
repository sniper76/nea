<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
<script>

  	$(document).ready(function() {
  		langIdNum++;

  	});
</script>
<div class="form_contents type2" id="langAddDiv_${idNum}">
	<table class="bbs_table write type2">
		<caption>Foreign Language Input</caption>
		<colgroup>
			<col style="width:25%" />
			<col style="width:75%" />
		</colgroup>
		<tbody>
			<tr>
				<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <label for="langCd_${idNum}"><spring:message code="compny.vacancy.msg.title34"/></label></th>
				<td>
					<select id="langCd_${idNum}" name="langCd">
						<option value=""><spring:message code="member.join.msg.choice"/></option>
						<c:forEach var="data" items="${langCd}" varStatus="status">
							<option value="${data.dtlCd}">${data.cdNm}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title35"/></th>
				<td>
					<c:forEach var="data" items="${langLvlCd}" varStatus="status">
						<span class="bbs_input_box">
							<input type="radio" name="langLvlCd_${idNum}" id="langLvlCd_${idNum}_${status.count}" value="${data.dtlCd}">
							<label for="langLvlCd_${idNum}_${status.count}">${data.cdNm}</label>
						</span>
					</c:forEach>
				</td>
			</tr>
		</tbody>
	</table>
	<button type="button" onclick="javascript:vacancy.fnRemoveLang('langAddDiv_${idNum}');" class="form_close">Close contents</button>
</div>
