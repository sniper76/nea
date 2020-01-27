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
				<table class="bbs_table">
					<caption><spring:message code="mypage.compny.vacancy.intvw.video.msg14" /></caption>
					<colgroup>
						<col style="width:20%;">
						<col style="width:80%;">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row"><spring:message code="mypage.compny.vacancy.intvw.video.lbl04" /></th><!-- Job seeker -->
							<td class="subject">
								<c:out value="${member.userNm}" />
							</td>
						</tr>
						<tr>
							<th scope="row"><spring:message code="mypage.compny.vacancy.intvw.video.lbl17" /></th><!-- Mobile no. -->
							<td>
								<c:out value="${member.userCell}" />
							</td>
						</tr>
						<tr>
							<th scope="row"><spring:message code="mypage.compny.vacancy.intvw.video.lbl16" /></th><!-- My job center -->
							<td>
								<c:out value="${intvwvVdeoPatcptn.compnyJcNm}" />
								<p class="bbs_description"><spring:message code="mypage.compny.vacancy.intvw.video.msg12" /></p><!-- 인터뷰 당일 방문해야 하는 잡센터입니다. -->
							</td>
						</tr>
						<tr>
							<th scope="row"><spring:message code="mypage.compny.vacancy.intvw.video.lbl15" /></th><!-- Job seeker's job center -->
							<td>
								<c:out value="${intvwvVdeoPatcptn.jobskJcNm}" />
								<p class="bbs_description"><spring:message code="mypage.compny.vacancy.intvw.video.msg13" /></p><!-- 인터뷰 당일 구직자가 방문해야 하는 잡센터입니다. -->
							</td>
						</tr>
						<tr>
							<th scope="row"><spring:message code="mypage.compny.vacancy.intvw.video.lbl01" /></th><!-- Interview Date -->
							<td>
								<c:out value="${intvwvVdeoPatcptn.videoIntvwDt}" />&nbsp;
								<c:out value="${intvwvVdeoPatcptn.videoTimeTableNm}" />
							</td>
						</tr>
					</tbody>
				</table>
				<!-- //bbs_table write -->
				<p class="bbs_write_bottom"><spring:message code="mypage.compny.vacancy.intvw.video.msg15" /></p><!-- * 수정/취소는 면접일 1일 전까지만 가능합니다. -->

				<div class="bbs_btn_wrap clearfix">
					<span class="bbs_left">
						<a href="javascript:fnGoList()" class="bbs_btn list"><spring:message code="button.list" /></a><!-- List -->
					</span>
					<c:if test="${intvwvVdeoPatcptn.ableDelYn == 'Y'}">
					<span class="bbs_right">
						<a href="javascript:fnIntvwDel();" class="bbs_btn delete"><spring:message code="button.delete" /></a><!-- Delete -->
					</span>
					</c:if>
				</div>
				<!-- //bbs_btn_wrap -->
			</div>

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
	<input type="hidden" name="videoIntvwPatcptnSeq" value="<c:out value="${param.videoIntvwPatcptnSeq}" />" />
</form>

<script>
 	$(document).ready(function() {

	});

 	function fnGoList() {
		var f = $("[name=viewFrm]")[0];
		f.method = "POST";
		f.action = contextPath + "/cpes/compny/vacancy/intvwVideoList.do";
		f.submit();
 	}

 	function fnIntvwDel() {
		var videoIntvwPatcptnSeq = $("[name=videoIntvwPatcptnSeq]").val();

		alertify.confirm("<spring:message code="mypage.compny.vacancy.intvw.video.msg16"/>", function (e) {
			if (e) {
				$.ajax({
					type: 'post', datatype: 'json',
					url: contextPath + "/cpes/compny/vacancy/intvwVideoDelAjax.do",
					data: {
						"videoIntvwPatcptnSeq" : videoIntvwPatcptnSeq
					}
				})
				.done(function(data) {
		   			if (data.result.successYn != "Y") {
		   				var msg = "<spring:message code="mypage.compny.vacancy.intvw.video.msg10"/>";
		   				if(data.result.statCd == "NOT_ABLE_DEL") {
		   					msg = "<spring:message code="mypage.compny.vacancy.intvw.video.msg15"/>";
		   				}
		   				alertify.alert(msg);
		   				return;
		   			}
					alertify.alert("<spring:message code="mypage.compny.vacancy.intvw.video.msg17"/>", function (e){
						fnGoList();
					});
				})
				.fail(function(xhr, status, errorThrown) {
					alertify.alert("<spring:message code="errors.ajax.fail"/>");
				});
			}
		});
	}
</script>
