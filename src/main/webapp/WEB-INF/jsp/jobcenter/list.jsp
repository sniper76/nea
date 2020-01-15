<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>

    <script>
    	$(document).ready(function() {
			if("<c:out value="${connYn}"/>" != "Y") {//잘못된 접근
				alertify.alert("<spring:message code="errors.wrong.approach.msg"/>", function (e){
					fnGoMain();
				});
				return false;
			}


			if("<c:out value="${userExistYn}"/>" == "N") {//사용자가 존재하지않음
				alertify.alert("<spring:message code="login.findId.no.data"/>", function (e){
					fnGoMain();
				});
				return false;
			}


			//검색키워드 enter
			$("#condText").keypress(function( event ) {
				if( event.which == 13 ) {
					fnSetPageing("1");
				}
			});

			if('${condJobCenterBean.condType}' !== '') {
				$("#condType").val('${condJobCenterBean.condType}');
			}
		});


       	function fnSetPageing(curPage) {
       		$("#currentPageNo").val(curPage);
    		fnGoList("frm");
    	}

       	function fnGoView(seq) {
    		$("#condSeq").val(seq);
    		$("#frm").attr('action', "<c:url value='/jobcenter/view.do' />");
    		$("#frm").submit();
    	}

	</script>
	<main class="colgroup" id="colgroup">
            <article>
                <header class="sub_head">
                    <div class="sub_title">
						<h2>
							<span><spring:message code="jobcenter.list.title1"/></span>
						</h2>
					</div>
                </header>

                <div id="contents" class="jobcenterList">
					<div class="bbs_info clearfix tab_confirm">
						<form id="frm" name="frm" action="${pageContext.request.contextPath}/jobcenter/list.do" method="post">
						<input type="hidden" id="condSort" name="condSort" value="${param.condSort}"/>
						<input type="hidden" id="condSeq" name="condSeq" value=""/>
						<input type="hidden" id="currentPageNo" name="currentPageNo" value="${paginationInfo.currentPageNo}"/>
						<div class="bbs_left bbs_count">
							<strong class="currently"><fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.currentPageNo}" /></strong>
							<span class="total">/&nbsp;<fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.totalPageCount}" /></span>
							<span class="order">
							</span>
						</div>
						<div class="bbs_right bbs_category">
							<form method="get">
								<fieldset>
									<legend>Posts Search</legend>
									<select id="condType" name="condType" title="Select classification">
										<option value=""><spring:message code="counsel.msg.all"/></option>
										<option value="TITLE" ><spring:message code="counsel.msg.title"/></option>
										<option value="CONTENT" ><spring:message code="counsel.msg.contents"/></option>
									</select>
									<input type="text" id="condText" name="condText" value="<c:out value="${param.condText}"/>" class="input_text" title="Please enter your search term." placeholder="Please enter your search term." maxlength="50"/>
									<input style="display:none; with:0px" title="hidden text">
									<input type="button" onclick="javascript:fnSetPageing('1');" value="Search" class="submit" />
								</fieldset>
							</form>
						</div>
						</form>
					</div>
					<!-- //bbs_info -->

					<div class="bbs_basic">
						<ul class="bbs_list clearfix bbs_summary">
							<c:forEach var="data" items="${resultList}" varStatus="status">
								<li>
									<div class="contents_box">
										<%-- <div class="img_box"><img src="${pageContext.request.contextPath}/images/board/dummy.png" alt=" image" /></div> --%>
										<div class="img_box">
											<img src="${pageContext.request.contextPath}/common/imgLoading.do?url=${data.filePath}" alt="image" onerror="fnNoImage(this)"/>
										</div>
										<div class="title_box <c:if test="${status.index%2 == 0}">new</c:if>">
											<%-- <a href="javascript:fnGoView('${data.jcCd}')">
											</a> --%>
												<strong class="title"><c:out value="${data.jc}"/></strong>
												<span class="cont">
													<c:choose>
														<c:when test="${fn:length(data.addr) > 30}">
															<c:out value="${fn:substring(data.addr,0,30)}"/>...
														</c:when>
														<c:otherwise>
															<c:out value="${data.addr}"/>
														</c:otherwise>
													</c:choose>
												</span>
												<span class="cont">
													<c:out value="${data.tel1}"/>
												</span>
												<span class="cont">
													<c:out value="${data.email}"/>
												</span>
										</div>
										<div class="bbs_function">
											<span>
												<button onclick="javascript:fnViewMap('<c:out value="${data.mapLink}"/>', 1024, 768, 'MapWin');"><spring:message code="mypage.compny.profile.title17"/></button>
											</span>
										</div>
										<div class="cont_box">
											<span class="cont"><span class="bbs_ico time"><spring:message code="counsel.msg.reg.dt"/></span><c:out value="${data.regDt}"/></span>
										</div>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
					<!-- //bbs_basic list -->

					<c:if test="${empty resultList}">
						<div class="bbs_empty">
							<p><spring:message code="counsel.msg.no.data"/></p>
							<!-- <p>No results found. <br />Please enter a search term in the search box again.</p> -->
						</div>
						<!-- //bbs_empty -->
					</c:if>
					<!-- //bbs_empty -->
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