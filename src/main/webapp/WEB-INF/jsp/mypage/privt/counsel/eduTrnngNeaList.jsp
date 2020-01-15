<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
    <script>
    	$(document).ready(function() {

			fnSetSelecteBox("condType",'${param.condType}');

			//검색키워드 enter
			$("#condText").keypress(function( event ) {
				if( event.which == 13 ) {
					fnSetPageing("1");
				}
			});
    	});


      	function fnSetPageing(curPage) {
    		$("#currentPageNo").val(curPage);
    		fnGoList("frm");
    	}

      	function fnCancelEduTrnngNea(seq,frmId) {

    		alertify.confirm("<spring:message code="mypage.private.fair.errors.msg"/>", function (e) {
    			if (e) {
    				$.ajax({
    					url: contextPath + "/cpes/private/counsel/eduTrnngNeaCancelProcessAjax.do",
    					type: 'post',
    					data: {
    						condSeq : seq
    					},
    					datatype: 'json'
    				})
    				.done(function(data) {
    					if (data.result.successYn == "Y") {
    						alertify.alert("<spring:message code="mypage.private.fair.errors.msg2"/>", function (e){
    							fnSetPageing("1");
    						});

    					} else {
    		 				var msg = "<spring:message code="login.findId.no.data"/>";
    						if(data.result.statCd == "02") {
    							msg = "<spring:message code="errors.ajax.fail"/>"
    						}
    						alertify.alert(msg);
    					}
    				})
    				.fail(function(xhr, status, errorThrown) {
    					alertify.alert("<spring:message code="errors.ajax.fail"/>");
    				});
    			}
    		});
      	}


      	function fnDeleteEduTrnngNea() {
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
    					url: contextPath + "/cpes/private/counsel/eduTrnngNeaDeleteProcessAjax.do",
    					type: 'post',
    					data: {
    						condSeqStr : seqArr.join(",")
    					},
    					datatype: 'json'
    				})
    				.done(function(data) {
    					if (data.result.successYn == "Y") {
    						alertify.alert("<spring:message code="counsel.msg.delete.success"/>", function (e){
    							fnSetPageing("1");
    						});

    					} else {
    		 				var msg = "<spring:message code="login.findId.no.data"/>";
    						if(data.result.statCd == "02") {
    							msg = "<spring:message code="errors.ajax.fail"/>"
    						}
    						alertify.alert(msg);
    					}
    				})
    				.fail(function(xhr, status, errorThrown) {
    					alertify.alert("<spring:message code="errors.ajax.fail"/>");
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
						<span><spring:message code="mypage.private.counsel.title"/></span>
					</h2>
				</div>
	      	</header>

	       	<div id="contents" class="counselEduTrnngNeaList">
				<div class="bbs_info clearfix"><!-- 서브페이지에 탭 메뉴가 있을 경우 클래스 tab_confirm 추가  -->
					<div class="bbs_left bbs_count">
						<strong class="currently"><fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.currentPageNo}" /></strong>
						<span class="total">/&nbsp;<fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.totalPageCount}" /></span>
					</div>
					<div class="bbs_right bbs_category">
						<form id="frm" name="frm" action="${pageContext.request.contextPath}/cpes/private/counsel/eduTrnngNeaList.do" method="post">
							<input type="hidden" id="currentPageNo" name="currentPageNo" value="${paginationInfo.currentPageNo}"/>
							<input type="hidden" id="condSeq" name="condSeq" value=""/>
						<fieldset>
							<legend><spring:message code="counsel.msg.search.cond"/></legend>
							<select id="condType" name="condType" title="Select classification">
								<option value=""><spring:message code="counsel.msg.all"/></option>
								<option value="EDU_NM" ><spring:message code="instt.eduTrnng.nea.msg"/></option>
								<option value="TEACHER_NM" ><spring:message code="mypage.compny.applic.title10"/></option>
							</select>
							<input type="text" id="condText" name="condText" value="<c:out value="${param.condText}"/>" class="input_text" title="<spring:message code="mypage.compny.vacancy.msg15"/>" placeholder="<spring:message code="mypage.compny.vacancy.msg15"/>" maxlength="50" />
							<input type="text" class="skip" style="visibility: hidden; with: 0px" title="hidden text"><!-- on submit 방지 -->
							<input type="button" onclick="javascript:fnSetPageing('1');" value="Search" class="submit" />
						</fieldset>
						</form>
					</div>
				</div>
				<!-- //bbs_info -->
				<c:if test="${!empty resultList}">
				<div class="bbs_basic">
					<ul class="recruitment_list type2 my clearfix"><!-- 인기채용공고 목록일 경우 클래스 popularity 추가, 교육기관,교육프로그램일 경우 클래스 adu 추가, 직업훈련일 경우 클래스 type2 추가 -->
					<c:forEach var="data" items="${resultList}" varStatus="status">
						<li>
							<span class="check_box">
								<label for="chk_${status.count}" class="skip">Select</label>
								<input type="checkbox" id="chk_${status.count}" name="chk" value="${data.eduTrnngSeq}" />
							</span>
							<div class="contents_wrap">
								<c:set var="neaEduDivCdClass" value="employement"/>
								<c:if test="${data.neaEduDivCd == 'NED0000000002'}">
									<c:set var="neaEduDivCdClass" value="skill"/>
								</c:if>

								<div class="contents_box ${neaEduDivCdClass}"><!-- 사전고용일 경우 클래스 employement , 스킬일 경우 클래스 skill 추가 -->
									<div class="title_box <c:if test="${data.newYn == 'Y'}">new</c:if>"><!-- 새글일 경우 클래스 new 추가 -->
										<a href="javascript:void(0);" onclick="fnGoNewEduTrnngView('${data.eduTrnngSeq}','${neaEduDivCdClass}');" class="title">${data.eduTrnngNm}</a>
									</div>
									<div class="cont_box">
										<span class="cont">
											<span class="con">${data.addrNm}</span>
											<span class="con"><spring:message code="compny.vacancy.msg.title8"/> : <strong><fmt:formatNumber type="number" maxFractionDigits="3" value="${data.recrumtMemb}" /></strong></span>
										</span>
										<span class="cont">
											<span class="con"><spring:message code="instt.eduTrnng.nea.msg2"/> : <strong>${data.teachDt} ${data.teachBgnTime} ~ ${data.teachEndTime}</strong></span>
											<span class="con"><spring:message code="mypage.compny.applic.title10"/> : <strong>${data.teacherNm1}</strong></span>
										</span>
									</div>
									<div class="other_box type2">
										<span class="top_box">
											<c:set var="recrumtStsCdClass" value="recruiting"/>
											<c:if test="${data.recrumtStsCd == 'RSC0000000003'}">
												<c:set var="recrumtStsCdClass" value="close"/>
											</c:if>
											<span class="${recrumtStsCdClass}">${data.recrumtStsNm }</span><!-- 모집중일 때 클래스 recruiting 추가, 마감일 때 클래스 close 추가 -->
										</span>
										<span class="bottom_box">
										<c:choose>
											<c:when test="${data.cancelYn == 'Y'}"><spring:message code="login.findPwd.btn.cancel"/></c:when>
											<c:otherwise>
												<button type="button"  onclick="fnCancelEduTrnngNea('${data.eduTrnngSeq}','frm');" class="bbs_btn small"><spring:message code="login.findPwd.btn.cancel"/></button>
											</c:otherwise>
										</c:choose>
										</span>
									</div>
								</div>
							</div>
						</li>
					</c:forEach>
					</ul>
				</div>
				</c:if>
				<!-- //bbs_basic list -->

				<c:if test="${empty resultList}">
				<div class="bbs_empty">
					<p><spring:message code="counsel.msg.no.data"/></p>
					<!-- <p>No results found. <br />Please enter a search term in the search box again.</p> -->
				</div>
				<!-- //bbs_empty -->
				</c:if>

				<div class="bbs_btn_wrap clearfix">
					<span class="bbs_left">

					</span>
					<span class="bbs_right">
						<button type="button" onclick="fnDeleteEduTrnngNea();" class="bbs_btn delete"><spring:message code="button.delete"/></button>
					</span>
				</div>
				<!-- //bbs_btn_wrap -->

				<div class="pagination">
					<ui:pagination paginationInfo="${paginationInfo}" type="customRenderer" jsFunction="fnSetPageing"/>
				</div>
				<!-- //pagination -->



			</div>
	    	<!-- //contents -->
	    </article>
	</main>
	<!-- //main.colgroup -->