<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
    <script>
	  	$(document).ready(function() {
     		$('#trnngDt_${param.idNum}').datepicker({
    			dateFormat: 'dd/mm/yy', //Input Display Format 변경
    			showOn: "both"
    		});

    		$('#trnngDt_${param.idNum}').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
		});

  	</script>

<li id="historyLiId_${param.idNum}">
	<div class="contents_box">
		<div class="cont_box">
			<span class="bbs_time">
				<label for="trnngDt_${param.idNum}" class="skip">date</label>
				<input type="text" id="trnngDt_${param.idNum}" name="trnngDt" readonly>
			</span>
			<span class="name">
				<label for="trnngNm_${param.idNum}" class="skip"><spring:message code="mypage.instt.eduTrnng.title4"/></label>
				<input type="text" id="trnngNm_${param.idNum}" name="trnngNm" maxlength="200" placeholder="<spring:message code="mypage.instt.eduTrnng.title4"/>" />
			</span>
			<span class="id">
				<label for="eduProgramId_${param.idNum}" class="skip"><spring:message code="mypage.instt.eduTrnng.title34"/></label>
				<input type="text" id="eduProgramId_${param.idNum}" name="eduProgramId" maxlength="50" placeholder="<spring:message code="mypage.instt.eduTrnng.title34"/>" />
			</span>
		</div>
		<div class="button_box">
			<button type="button" class="add" onclick="fnPrgmHistoryAdd();"><spring:message code="mypage.instt.eduTrnng.title13"/></button>
			<button type="button" class="del" onclick="fnPrgmHistoryDel(this);"><spring:message code="button.delete"/></button>
		</div>
	</div>
</li>
