<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>

<main class="colgroup" id="colgroup">
	<article>
		<header class="sub_head">
			<div class="sub_title">
				<h2><span><spring:message code="mypage.compny.vacancy.intvw.video.ttl01"/></span></h2>
			</div>
		</header>
    	<div id="contents" class="vacancyIntvwVideoList">

			<div class="bbs_basic">
				<form name="inputFrm" method="post">
					<input type="hidden" name="userSeq" value="<c:out value="${member.userSeq}" />" />
					<input type="hidden" name="intvwSeq" value="<c:out value="${param.intvwSeq}" />" />
					<fieldset>
						<legend>Write a post</legend>
						<div class="bbs_write_top"><span><span class="exactly y"><spring:message code="mypage.compny.vacancy.intvw.video.lbl13" /></span><spring:message code="mypage.compny.vacancy.intvw.video.lbl13" /></span></div>
						<table class="bbs_table write">
							<caption><spring:message code="mypage.compny.vacancy.intvw.video.msg09" /></caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
							<tbody>
							<tr>
								<th scope="row"><span class="exactly"></span> <spring:message code="mypage.compny.vacancy.intvw.video.lbl04" /><!-- Job seeker --></th>
								<td class="subject">
									<c:out value="${member.userNm}" />
								</td>
							</tr>
							<tr>
								<th scope="row"><span class="exactly"></span><spring:message code="mypage.compny.vacancy.intvw.video.lbl17" /><!-- Mobile no. --></th>
								<td>
									<c:out value="${member.userCell}" />
								</td>
							</tr>
							<tr>
								<th scope="row">
									<span class="exactly y"><spring:message code="mypage.compny.vacancy.intvw.video.lbl13" /></span>
									<label for="job_center"><spring:message code="mypage.compny.vacancy.intvw.video.lbl16" /></label><!-- My job center -->
								</th>
								<td>
									<select id="compnyJcCd" name="compnyJcCd">
										<option value=""><spring:message code="member.join.msg.choice"/></option>
										<c:forEach var="data" items="${jobCenterCdList}">
							   			<option value="${data.jcCd}" <c:if test="${compny.jcCd == data.jcCd}">selected</c:if>>${data.jcNm}</option>
							   			</c:forEach>
									</select>
									<p class="bbs_description"><spring:message code="mypage.compny.vacancy.intvw.video.msg06" /></p><!-- 인터뷰 당일 방문할 잡센터를 선택하세요. -->
								</td>
							</tr>
							<tr>
								<th scope="row">
									<span class="exactly y"><spring:message code="mypage.compny.vacancy.intvw.video.lbl13" /></span>
									<label for="jobskJcCd"><spring:message code="mypage.compny.vacancy.intvw.video.lbl15" /></label><!-- Job seeker's job center -->
								</th>
								<td>
									<select id="jobskJcCd" name="jobskJcCd">
										<option value=""><spring:message code="member.join.msg.choice"/></option>
										<c:forEach var="data" items="${jobCenterCdList}">
							   			<option value="${data.jcCd}" <c:if test="${member.jcCd == data.jcCd}">selected</c:if>>${data.jcNm}</option>
							   			</c:forEach>
									</select>
									<p class="bbs_description"><spring:message code="mypage.compny.vacancy.intvw.video.msg07" /></p><!-- 인터뷰 당일 구직자가 방문할 잡센터를 선택하세요. -->
								</td>
							</tr>
							<tr>
								<th scope="row">
									<span class="exactly y"><spring:message code="mypage.compny.vacancy.intvw.video.lbl13" /></span>
									<spring:message code="mypage.compny.vacancy.intvw.video.lbl01" /><!-- Interview Date -->
								</th>
								<td>
									<span class="bbs_time type2">
										<label for="videoIntvwDt" class="skip">date</label>
										<input type="text" id="videoIntvwDt" name="videoIntvwDt" placeholder="DD/MM/YYYY" maxlength="10" readonly="readonly" />
									</span>
									<p class="bbs_description"><spring:message code="mypage.compny.vacancy.intvw.video.msg08" /></p><!-- 인터뷰 날짜는 1일 후부터 7일 이내에만 선택 가능합니다. -->
								</td>
							</tr>
							<tr>
								<th scope="row">
									<span class="exactly y"><spring:message code="mypage.compny.vacancy.intvw.video.lbl13" /></span>
									<label for="videoTimeTableCd"><spring:message code="mypage.compny.vacancy.intvw.video.lbl14" /></label><!-- Interview Time -->
								</th>
								<td>
									<select id="videoTimeTableCd" name="videoTimeTableCd">
										<option value=""><spring:message code="member.join.msg.choice"/></option>
										<c:forEach var="data" items="${videoTimeTableCdList}">
							   			<option value="${data.dtlCd}" <c:if test="${param.jcCd == data.dtlCd}">selected</c:if>>${data.cdNm}</option>
							   			</c:forEach>
									</select>
								</td>
							</tr>
							</tbody>
						</table>
						<!-- //bbs_table write -->

						<div class="bbs_btn_wrap clearfix">
							<span class="bbs_left">
								<a href="javascript:fnGoList()" class="bbs_btn list"><spring:message code="button.list" /></a><!-- LIST -->
							</span>
							<span class="bbs_right">
								<button type="button" class="bbs_btn save" onclick="fnOk()"><spring:message code="mypage.compny.vacancy.intvw.video.lbl11" /></button><!-- OK -->
								<button type="button" class="bbs_btn cancel" onclick="fnCancel()"><spring:message code="login.findPwd.btn.cancel" /></button><!-- Cancel -->
							</span>
						</div>
						<!-- //bbs_btn_wrap -->

					</fieldset>
				</form>
			</div>
			<!-- //bbs_basic -->

		</div>
		<!-- //contents -->
	</article>
</main>
<!-- //main.colgroup -->

<form name="viewFrm">
	<input type="hidden" name="currentPageNo" value="<c:out value="${param.currentPageNo}" />" />
	<input type="hidden" name="intvwBgnDt" value="<c:out value="${param.intvwBgnDt}" />" />
	<input type="hidden" name="intvwEndDt" value="<c:out value="${param.intvwEndDt}" />" />
	<input type="hidden" name="jcCd" value="<c:out value="${param.jcCd}" />" />
	<input type="hidden" name="intvwTypeCd" value="<c:out value="${param.intvwTypeCd}" />" />
	<input type="hidden" name="userNm" value="<c:out value="${param.userNm}" />" />
	<input type="hidden" name="vacancySeq" value="<c:out value="${param.vacancySeq}" />" />
</form>

<script>
	var msgSel = "<spring:message code="member.join.msg.choice"/>";
	var cpJcHolidayList = [];<c:forEach var="data" items="${holiday1List}" varStatus="status">
	cpJcHolidayList.push("<c:out value="${data}" />");</c:forEach>
	var jsJcHolidayList = [];<c:forEach var="data" items="${holiday2List}" varStatus="status">
	jsJcHolidayList.push("<c:out value="${data}" />");</c:forEach>

	$(document).ready(function() {
 		$("[name=compnyJcCd]").change(function() {
 			$("[name=videoIntvwDt]").val("");
 			fnSearchJcHolidayList("COMPNY", this.value);
 			fnVideoTimeTableList();
 		});
 		$("[name=jobskJcCd]").change(function() {
 			$("[name=videoIntvwDt]").val("");
 			fnSearchJcHolidayList("JOBSK", this.value);
 			fnVideoTimeTableList();
 		});
		$("#videoIntvwDt").datepicker({
			dateFormat: 'dd/mm/yy', showOn: "both", minDate: "1D", maxDate: "7D", beforeShowDay: fnNoWeekendsOrHolidays
		});
 		$("[name=videoIntvwDt]").change(function() {
 			fnVideoTimeTableList();
 		});
	});

 	function fnGoList() {
		var f = $("[name=viewFrm]")[0];
		f.method = "POST";
		f.action = contextPath + "/cpes/compny/vacancy/intvwVideoList.do";
		f.submit();
 	}
 	function fnOk() {
		var param = $("[name=inputFrm]").serializeObject();
		if(param.compnyJcCd == null || $.trim(param.compnyJcCd) == "") {
			alertify.alert(fnMsg("<spring:message code="errors.required" />", "<spring:message code="mypage.compny.vacancy.intvw.video.lbl16" />"), function() {
				$("[name=compnyJcCd]").focus();
			});
			return;
		}
		if(param.jobskJcCd == null || $.trim(param.jobskJcCd) == "") {
			alertify.alert(fnMsg("<spring:message code="errors.required" />", "<spring:message code="mypage.compny.vacancy.intvw.video.lbl15" />"), function() {
				$("[name=jobskJcCd]").focus();
			});
			return;
		}
		if(param.videoIntvwDt == null || $.trim(param.videoIntvwDt) == "") {
			alertify.alert(fnMsg("<spring:message code="errors.required" />", "<spring:message code="mypage.compny.vacancy.intvw.video.lbl01" />"), function() {
				$("[name=videoIntvwDt]").focus();
			});
			return;
		}
		if(param.videoTimeTableCd == null || $.trim(param.videoTimeTableCd) == "") {
			alertify.alert(fnMsg("<spring:message code="errors.required" />", "<spring:message code="mypage.compny.vacancy.intvw.video.lbl14" />"), function() {
				$("[name=videoTimeTableCd]").focus();
			});
			return;
		}

		alertify.confirm("<spring:message code="mypage.compny.fair.msg" />", function (e){
			if (e) {
				$.ajax({
					type: 'post', datatype: 'json',
					url: contextPath + "/cpes/compny/vacancy/intvwVideoApplyAjax.do",
					data: param
				})
				.done(function(data) {
		   			if (data.result.successYn != "Y") {
		   				var msg = "<spring:message code="mypage.compny.vacancy.intvw.video.msg10"/>";
		   				if(data.result.statCd == "03") {
		   					msg = "<spring:message code="errors.ajax.fail"/>";
		   				}
		   				alertify.alert(msg);
		   				return;
		   			}
					alertify.alert("<spring:message code="mypage.compny.fair.msg2"/>", function (e){
						fnGoList();
					});
				})
				.fail(function(xhr, status, errorThrown) {
					alertify.alert("<spring:message code="errors.ajax.fail"/>");
				});
			}
		});
 	}
 	function fnCancel() {
 		document.getElementsByName('inputFrm')[0].reset();
 	}

 	function fnSearchJcHolidayList(flag, jcCd) {
		if(jcCd == null || $.trim(jcCd) == "") {
			if(flag == "COMPNY") {
				cpJcHolidayList = [];
			} else {
				jsJcHolidayList = [];
			}
			return;
		}

		$.ajax({
			type: 'get', datatype: 'json',
			url: contextPath + "/cpes/compny/vacancy/jcHolidayAjax.do",
			data: {
				"jcCd": jcCd
			}
		})
		.done(function(data) {
  			if (data.result.successYn != "Y") {
  				var msg = "<spring:message code="mypage.compny.vacancy.intvw.video.msg10"/>";
  				alertify.alert(msg);
  				return;
  			}
			if(flag == "COMPNY") {
	  			cpJcHolidayList = data.resultList;
			} else {
				jsJcHolidayList = data.resultList;
			}
		})
		.fail(function(xhr, status, errorThrown) {
			alertify.alert("<spring:message code="errors.ajax.fail"/>");
		});
 	}

 	function fnVideoTimeTableList() {
		var param = $("[name=inputFrm]").serializeObject();
		if(param.compnyJcCd == null || $.trim(param.compnyJcCd) == "") {
			$("[name=videoTimeTableCd]").empty();
			return;
		}
		if(param.jobskJcCd == null || $.trim(param.jobskJcCd) == "") {
			$("[name=videoTimeTableCd]").empty();
			return;
		}
		if(param.videoIntvwDt == null || $.trim(param.videoIntvwDt) == "") {
			$("[name=videoTimeTableCd]").empty();
			return;
		}

		$.ajax({
			type: 'get', datatype: 'json',
			url: contextPath + "/cpes/compny/vacancy/videoTimeTableListAjax.do",
			data: param
		})
		.done(function(data) {
  			if (data.result.successYn != "Y") {
  				var msg = "<spring:message code="mypage.compny.vacancy.intvw.video.msg10"/>";
  				alertify.alert(msg);
  				return;
  			}

  			$("[name=videoTimeTableCd]").empty();
  			$("[name=videoTimeTableCd]").append('<option value="">'+msgSel+'</option>');
  			$.each(data.resultList, function(idx, item) {
  				$("[name=videoTimeTableCd]").append('<option value="'+item.dtlCd+'">'+item.cdNm+'</option>');
  			});
		})
		.fail(function(xhr, status, errorThrown) {
			alertify.alert("<spring:message code="errors.ajax.fail"/>");
		});
 	}

	// datepicker에서 주말(토, 일요일, 지정휴일) 선택 막기
	function fnNoWeekendsOrHolidays(date) {
		var ret = true;
		if(date.getDay() == 0 || date.getDay() == 6) {
			ret = false;
		} else {
			var d = date.getDate(), m = date.getMonth()+1, y = date.getFullYear();
			if(parseInt(d) < 10) d = "0"+d;
			if(parseInt(m) < 10) m = "0"+m;
			var dd = d+"/"+m+"/"+y;
			if(cpJcHolidayList.includes(dd) || jsJcHolidayList.includes(dd)) {
				ret = false;
			} else {
				ret = true;
			}
		}
		return [ret, ''];
 	}

</script>
