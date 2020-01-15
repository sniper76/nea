<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
<script src="${pageContext.request.contextPath}/js/jquery/jquery-ui.js"></script>


    <script>
    	$(document).ready(function() {

    		$("#hopeCounselDt").datepicker({
    			dateFormat: 'dd/mm/yy', //Input Display Format 변경
    			showOn: "both",
    			minDate: "0M", //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
    		});

    		$('#hopeCounselDt').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)



    		fnSetTimeSelecteBox("hopeCounselBgnTime");
    		fnSetTimeSelecteBox("hopeCounselEndTime");
    		fnSetAmpmSelecteBox("hopeCounselBgnAmpm");
    		fnSetAmpmSelecteBox("hopeCounselEndAmpm");



		});

	</script>
	<table class="bbs_table write">
		<caption>Consulting Write -  Preferred date , Other request</caption>
		<colgroup>
			<col style="width:15%;" />
			<col style="width:85%;" />
		</colgroup>
		<tbody>
		<tr>
			<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <spring:message code="counsel.msg.datetime"/></th>
			<td>
				<span class="bbs_time">
					<label for="hopeCounselDt" class="skip">date</label>
					<input type="text" id="hopeCounselDt" name="hopeCounselDt" readonly="true"/>

				</span>
				<span class="bbs_time">
					<label for="hopeCounselBgnTime" class="skip">start time</label>
					<select id="hopeCounselBgnTime" name="hopeCounselBgnTime" title="start time">
						<option value=""><spring:message code="member.join.msg.choice"/></option>
					</select>
					<select id="hopeCounselBgnAmpm" name="hopeCounselBgnAmpm" title="start time">
						<option value=""><spring:message code="member.join.msg.choice"/></option>
					</select>
				</span>
				&nbsp;-&nbsp;
				<span class="bbs_time">
					<label for="hopeCounselEndTime" class="skip">finish time</label>
					<select id="hopeCounselEndTime" name="hopeCounselEndTime" title="start time">
						<option value=""><spring:message code="member.join.msg.choice"/></option>
					</select>
					<select id="hopeCounselEndAmpm" name="hopeCounselEndAmpm" title="start time">
						<option value=""><spring:message code="member.join.msg.choice"/></option>
					</select>
				</span>
			</td>
		</tr>
		<tr>
			<th scope="row"><span class="exactly"></span> <label for="qustEtcReq"><spring:message code="counsel.msg.other"/></label></th>
			<td><textarea id="qustEtcReq" name="qustEtcReq" cols="30" rows="10" title="Contents"></textarea></td>
		</tr>
		</tbody>
	</table>
	<!-- //bbs_table write -->


