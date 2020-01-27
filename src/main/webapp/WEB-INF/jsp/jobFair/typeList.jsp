<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>


    <script>
    	$(document).ready(function() {

			$('div#contents .tab_menu .clearfix li').removeClass('on');
			$('div#contents .tab_menu .clearfix li:eq(${tabNo})').addClass('on');
		});

    	function fnMakeKey(val) {
    		var k = 'FDC';
    		var temp = ''+val;
    		var len = 10 - temp.length;
    		for (var l = 0; l<len; l++) {
    			k += '0';
    		}

    		return k + val;
    	}

    	function fnTabChange(val) {
    		//console.log('val', fnMakeKey(val));
    		$("#condFairDivCd").val(fnMakeKey(val));
    		$("#tabNo").val(val);
    		fnSetPageing("1");
    	}

       	function fnSetPageing(curPage) {
       		$("#currentPageNo").val(curPage);
    		fnGoList("frm");
    	}

       	function fnGoView(seq) {
    		$("input#pTabNo").val('${tabNo}');
    		$("input#tabNo").val(0);
    		$("input#condSeq").val(seq);
    		$("form#frm").attr('action', "${pageContext.request.contextPath}/jobFair/view.do");
    		$("form#frm").submit();
       	}

	</script>
	<main class="colgroup" id="colgroup">
		<article>
	    	<header class="sub_head">
				<div class="sub_title">
					<h2>
						<span><spring:message code="jobfair.type.list.title1"/></span><!-- Job Fair by Types -->
					</h2>
				</div>
	      	</header>

	       	<div id="contents" class="jobFairTypeList">

				<div class="tab_menu count6 action">
					<form id="frm" name="frm" action="${pageContext.request.contextPath}/jobFair/typeList.do" method="post">
					<input type="hidden" id="condFairDivCd" name="condFairDivCd" value="${param.condFairDivCd}"/>
					<input type="hidden" id="tabNo" name="tabNo" value=""/>
					<input type="hidden" id="pTabNo" name="pTabNo" value=""/>
					<input type="hidden" id="condSeq" name="condSeq" value=""/>
					<ul class="clearfix">
						<li><a onclick="fnTabChange('0');"><spring:message code="jobfair.type.list.title2"/></a></li><!-- All -->

							<c:forEach var="cds" items="${fairDivCds}" varStatus="status">
						<li><a onclick="fnTabChange('${status.index + 1}');"><c:out value="${cds.cdNm }" /></a></li>
						</c:forEach>
					</ul>
					</form>
				</div>

				<div id="tab_contents1" class="tab_contents">
				<c:choose>
					<c:when test="${empty resultList}">
						<div class="bbs_empty">
							<p><spring:message code="counsel.msg.no.data"/></p>
						</div>
						<!-- //bbs_empty -->
					</c:when>
					<c:otherwise>
					<div class="bbs_basic">
						<ul class="recruitment_list recruitment none_border clearfix">

							<c:forEach var="data" items="${resultList}" varStatus="status">
						<li>
							<div class="contents_wrap">
								<div class="img_box"><img src="${pageContext.request.contextPath}/common/imgLoading.do?url=${data.filePath}" alt="image" onerror="fnNoImage(this)" /></div>
								<div class="contents_box ${cFun:changeFairDivClass(data.fairDivCd)}">
									<div class="title_box ${cFun:changeNewClass(data.newYn)}">
										<a href="javascript:void(0);" onclick="fnGoView('${data.fairSeq}');" class="title"><c:out value="${data.fairNm }" escapeXml="false" /></a>
									</div>
									<div class="cont_box">
										<span class="cont">
											<span class="con"><spring:message code="resume.text.addrProvcCd"/> : <strong><c:out value="${data.addrNm }" /></strong></span>
										</span>
										<span class="cont">
											<span class="con"><c:out value="${data.fairBgnDt }" /> ~ <c:out value="${data.fairEndDt }" /></span>
										</span>
										<span class="cont">
											<span class="con"><a href="tel:000000000" class="mobile_phone"><c:out value="${data.tel1 }" /></a></span>
											<span class="con"><a href="tel:000000000" class="mobile_phone"><c:out value="${data.tel2 }" /></a></span>
											<span class="con"><c:out value="${data.email }" /></span>
										</span>
									</div>
									<div class="other_box">
										<span class="top_box">
											<span class="date"><c:out value="${data.fairStsNm }" /></span>

											<sec:authorize access="hasAnyRole('ROLE_USER,ROLE_STDIT')">
                           <span id="bkmkSapn_${status.count}"><button type="button" id="btnBkmk_${status.count}" onclick="fnBkmkType2('${data.bkmkSeq}','${data.fairSeq}',LIKE_CATEGORY_FAIR,'btnBkmk_${status.count}','bkmkSapn_${status.count}');" class="interest <c:if test="${!empty data.bkmkSeq and data.bkmkSeq != ''}">on</c:if>">interest</button>
                           </span>
                        </sec:authorize>
										</span>
									</div>
								</div>
							</div>
						</li>
						</c:forEach>
						</ul>
					</form>
					</div>
					</c:otherwise>
				</c:choose>

					<!-- //bbs_basic list -->

					<div class="pagination">
						<ui:pagination paginationInfo="${paginationInfo}" type="customRenderer" jsFunction="fnSetPageing"/>
					</div>
					<!--  //pagination -->

				</div>
				<!-- //tab_contents1 -->

			</div>
	    	<!-- //contents -->
	    </article>
	</main>
	<!-- //main.colgroup -->