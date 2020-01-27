<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
    <script>
    	$(document).ready(function() {
    	    $("input:radio[name=rdo]").click(function(){
    	    	$("#condSeq").val($("input:radio[name=rdo]:checked").val());
    	    });

    	    if($('input:radio[name="rdo"]:checked').length == 0) {//checked  된게 없다면
    	    	$('input:radio[name=rdo]').eq(0).attr("checked", true);
    	    }

    	    fnVacancyChange();





    	});

    	function fnVacancyChange() {
			$("#currentPageNo").val(1);
			$("#condText").val("");
			$("#condType").val("");

			var rdoVal = $('input:radio[name="rdo"]:checked').val();
			//console.log("###################rdoVal="+rdoVal);

			if(typeof rdoVal != "undefined" && rdoVal != null && rdoVal != "") {
				$("#condSeq").val($("input:radio[name=rdo]:checked").val());
			}

			fnIntvwList();

    	}


    	function fnIntvwList() {
			$.ajax({
				url: contextPath + "/cpes/compny/vacancy/intvwListAjax.do",
				type: 'post',
				data: {
					condSeq: $("#condSeq").val(),
					condType: $("#condType").val(),
					condText: $("#condText").val(),
					currentPageNo: $("#currentPageNo").val()
				},
				datatype: 'html'
			})
			.done(function(data) {
				$("#intvwListDiv").html(data);
			})
			.fail(function(xhr, status, errorThrown) {
				alertify.alert("<spring:message code="errors.ajax.fail"/>");
			});
    	}


      	function fnSetPageing(curPage) {
    		$("#currentPageNo").val(curPage);
    		fnIntvwList();
    	}

      	function fnCloseReject(id) {
      		$("#"+id).dialog( "close" );
      	}


    	function fnDelIntvw() {
    		var seqArr = new Array;

    		if(!$("input:checkbox[name=chk]").is(":checked") == true) {
				alertify.alert("<spring:message code="mypage.compny.applic.errors.msg"/>", function (e){

				});
				return false;
    		}

    		$("input:checkbox[name=chk]:checked").each(function() {
    			seqArr.push($(this).val())
			});

    		alertify.confirm("<spring:message code="compny.vacancy.msg.btn.delete"/>", function (e) {
    			if (e) {
    				$.ajax({
    					url: contextPath + "/cpes/compny/vacancy/intvwDelProcessAjax.do",
    					type: 'post',
    					data: {
    						condStr : seqArr.join(",")
    					},
    					datatype: 'json'
    				})
    				.done(function(data) {
    					if (data.result.successYn == "Y") {
    						alertify.alert("<spring:message code="counsel.msg.delete.success"/>", function (e){
    							fnSetPageing("1");
    						});

    					} else {
    		 				var msg = noMemberFailMsg;
    						if(data.result.statCd == "02") {
    							msg = systemMsg;
    						}
    						alertify.alert(msg);
    					}
    				})
    				.fail(function(xhr, status, errorThrown) {
    					alertify.alert(systemMsg);
    				});
    			}
    		});
    	}
	</script>
	<main class="colgroup" id="colgroup">
		<article>
	    	<header class="sub_head">
				<div class="sub_title">
					<h2>
						<span><spring:message code="mypage.compny.vacancy.msg6"/></span>
					</h2>
				</div>
	      	</header>

	       	<div id="contents" class="vacancyIntvwList">
				<div class="search_matching">
					<div class="box_wrap recruitment_list">
						<form id="frm" name="frm" action="${pageContext.request.contextPath}/cpes/compny/vacancy/intvwList.do" method="post">
							<input type="hidden" id="currentPageNo" name="currentPageNo" value="1"/>
							<input type="hidden" id="condSeq" name="condSeq" value="${param.condSeq}"/>
							<fieldset>
								<legend>Search Auto Matching</legend>
								<c:forEach var="data" items="${resultList2}" varStatus="status">
									<c:if test="${status.count == 1}">
										<button type="button" class="open">
											<span class="contents_wrap">
												<span class="check_area">
													<label for="rdo_${status.count}">Select Recruitment Notice</label>
													<input type="radio" id="rdo_${status.count}" name="rdo" value="${data.vacancySeq}" <c:if test="${param.condSeq == data.vacancySeq}">checked</c:if> />
												</span>
												<span class="contents_box">
													<span class="title_box <c:if test="${data.newYn == 'Y'}">new</c:if>"><!-- 새글일 경우 클래스 new 추가 -->
														<strong class="title">${data.vacancyTitle}</strong>
													</span>
													<span class="cont_box">
														<span class="cont">
															<span class="con">${data.bgnDt} ~ ${data.endDt}</span>
															<span class="con"><spring:message code="compny.vacancy.msg.title8"/> : <fmt:formatNumber type="number" maxFractionDigits="3" value="${data.recrumtMemb}" /></span>
														</span>
													</span>
													<span class="other_box">
														<span class="top_box">
															<c:choose>
																<c:when test="${data.vacancyStsCd == 'VCS0000000002'}"><!-- 채용공고 마감 -->
																	<span class="close">${data.vacancyStsNm}</span>
																</c:when>
																<c:otherwise>
																	<span class="${data.remainDiv}">${data.remainDt}<c:if test="${data.remainDiv == 'hurry'}">Hour</c:if></span><!-- 시간으로 표시해야 할 경우 클래스 hurry 추가, 마감일 때 클래스 close 추가 -->
																</c:otherwise>
															</c:choose>
														</span>
													</span>
												</span>
											</span>
										</button>
									</c:if>
								</c:forEach>
								<div class="child_box">
									<ul class="clearfix">
									<c:forEach var="data" items="${resultList2}" varStatus="status">
										<c:if test="${status.count > 1}">
											<li>
												<span class="contents_wrap">
													<span class="check_area">
														<label for="rdo_${status.count}">Select Recruitment Notice</label>
														<input type="radio" id="rdo_${status.count}" name="rdo" value="${data.vacancySeq}" <c:if test="${param.condSeq == data.vacancySeq}">checked</c:if>/>
													</span>
													<span class="contents_box">
														<span class="title_box <c:if test="${data.newYn == 'Y'}">new</c:if>"><!-- 새글일 경우 클래스 new 추가 -->
															<strong class="title">${data.vacancyTitle}</strong>
														</span>
														<span class="cont_box">
															<span class="cont">
																<span class="con">${data.bgnDt} ~ ${data.endDt}</span>
																<span class="con"><spring:message code="compny.vacancy.msg.title8"/> : <fmt:formatNumber type="number" maxFractionDigits="3" value="${data.recrumtMemb}" /></span>
															</span>
														</span>
														<span class="other_box">
															<span class="top_box">
															<c:choose>
																<c:when test="${data.vacancyStsCd == 'VCS0000000002'}"><!-- 채용공고 마감 -->
																	<span class="close">${data.vacancyStsNm}</span>
																</c:when>
																<c:otherwise>
																	<span class="${data.remainDiv}">${data.remainDt}<c:if test="${data.remainDiv == 'hurry'}">Hour</c:if></span><!-- 시간으로 표시해야 할 경우 클래스 hurry 추가, 마감일 때 클래스 close 추가 -->
																</c:otherwise>
															</c:choose>
															</span>
														</span>
													</span>
												</span>
											</li>
										</c:if>
									</c:forEach>
									</ul>
								</div>
								<button type="button" class="submit" onclick="fnVacancyChange();"><spring:message code="sel"/></button>
							</fieldset>
						</form>
					</div>
				</div>
				<!-- //search_matching -->

				<div class="box type6">
				    <div class="box_wrap">
				        <ul class="bu">
							<li><spring:message code="mypage.intvw.msg3"/></li>
							<li><spring:message code="mypage.intvw.msg4"/></li>
							<li><spring:message code="mypage.intvw.msg5"/></li>
						</ul>
				    </div>
				</div>


				<div id="intvwListDiv"></div>


				<div id="dialogVideo" style="display:none" class="bbs_popup"><!-- 팝업 가로, 세로 지정하지 않았습니다. 필요에 딸라 지정해서 사용 -->
					<section class="box_wrap">
						<div class="title_box">
							<h1 class="title">Online interview</h1>
						</div>
						<div class="contents_box">
							<form>
								<fieldset>
									<legend>Online interview</legend>

									<table class="table">
										<caption>Online interview</caption>
										<colgroup>
											<col style="width:30%" />
											<col />
										</colgroup>
										<tbody>
											<tr>
												<th scope="row"><label for="videoUserNm">User</label></th>
												<td id="videoUserNm"></td>
											</tr>
											<tr>
												<th scope="row"><label for="videoUserCell">User Mobile no.</label></th>
												<td id="videoUserCell"></td>
											</tr>
											<tr>
												<th scope="row"><label for="videoCompnyNm">Company</label></th>
												<td id="videoCompnyNm"></td>
											</tr>
											<tr>
												<th scope="row"><label for="videoVacancyTitle">Job vacancy</label></th>
												<td id="videoVacancyTitle"></td>
											</tr>
											<tr>
												<th scope="row"><label for="videoMngerNm">Contact person</label></th>
												<td id="videoMngerNm"></td>
											</tr>
											<tr>
												<th scope="row"><label for="videoMngerCell">Mobile no.</label></th>
												<td id="videoMngerCell"></td>
											</tr>
											<tr>
												<th scope="row"><label for="videoJobskJcNm">My job center</label></th>
												<td><span id="videoJobskJcNm"></span>(<spring:message code="mypage.intvw.msg"/>)</td>
											</tr>
											<tr>
												<th scope="row"><label for="videoCompnyJcNm">Company’s job center</label></th>
												<td><span id="videoJobskJcNm"></span>(<spring:message code="mypage.intvw.msg2"/>)</td>
											</tr>
											<tr>
												<th scope="row"><label for="videoIntvwDt">Interview date</label></th>
												<td id="videoIntvwDt"></td>
											</tr>
										</tbody>
									</table>
								</fieldset>
							</form>
						</div>
						<button type="button" onclick="fnCloseReject('dialogVideo');" class="close">close of popup</button>
					</section>
				</div>


			</div>
	    	<!-- //contents -->
	    </article>
	</main>
	<!-- //main.colgroup -->