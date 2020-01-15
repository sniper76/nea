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

    	function fnGoTab(seq, obj) {
    		var classStr = $(obj).parent().attr("class");

     		if(classStr != "on") {
	    		$("#currentPageNo").val(1);
	    		$("#bulletinCateSeq").val(seq);
	    		fnGoList("frm");
    		}
    	}

	</script>
	<main class="colgroup" id="colgroup">
            <article>
                <header class="sub_head">
					<div class="sub_tab_menu count4"><!-- 클래스 count2 ~ count5 까지 -->
                        <ul class="clearfix">
                            <li <c:if test="${param.bulletinCateSeq eq null || param.bulletinCateSeq eq ''}">class="on"</c:if>><a href="javascript:void(0);" onclick="fnGoTab('', this);">All</a></li><!-- 현재 페이지 클래스 on 추가 -->
                        	<c:forEach items="${cateList }" var="cate">
                        		<li <c:if test="${param.bulletinCateSeq eq cate.bulletinCateSeq}">class="on"</c:if>>
                        			<a href="javascript:void(0);" onclick="fnGoTab('${cate.bulletinCateSeq}', this);">${cate.bulletinCateNm }</a>
                        		</li>
                        	</c:forEach>
                        </ul>
                    </div>
                    <div class="sub_title">
						<h2>
							<span><c:out value="${result.bulletinNm}"/></span>
						</h2>
					</div>
                </header>

                <div id="contents" class="bulletinlist">
					<div class="bbs_info clearfix tab_confirm"><!-- 서브페이지에 탭 메뉴가 있을 경우 클래스 tab_confirm 추가  -->
						<form id="frm" name="frm" action="${pageContext.request.contextPath}/bulletin/list.do" method="post">
						<input type="hidden" id="condBulletinMngSeq" name="condBulletinMngSeq" value="${param.condBulletinMngSeq}"/>
						<input type="hidden" id="condSort" name="condSort" value="${param.condSort}"/>
						<input type="hidden" id="condSeq" name="condSeq" value=""/>
						<input type="hidden" id="currentPageNo" name="currentPageNo" value="${paginationInfo.currentPageNo}"/>
						<input type="hidden" id="bulletinCateSeq" name="bulletinCateSeq" value=""/>
						<!-- 기획서에 없는 영역이라서 삭제 처리 -->
						<!-- <div class="bbs_left bbs_count">
							<strong class="currently">20</strong>
							<span class="total">/&nbsp;1,125</span>
							<span class="order">
								<h3 class="h0 skip">Change list order</h3>
								<button type="button">Latest</button>
								<button type="button">View</button>
								<button type="button">like</button>
							</span>
						</div> -->
						<div class="bbs_right bbs_category">
							<form method="get">
								<fieldset>
									<legend>Posts Search</legend>
									<select id="condType" name="condType" title="Select classification">
										<option value=""><spring:message code="counsel.msg.all"/></option>
										<option value="TITLE" ><spring:message code="counsel.msg.title"/></option>
										<option value="CONTENT" ><spring:message code="counsel.msg.contents"/></option>
									</select>
									<input type="text" id="condText" name="condText" value="<c:out value="${param.condText}"/>" class="input_text" title="<spring:message code="mypage.compny.vacancy.msg15"/>" placeholder="<spring:message code="mypage.compny.vacancy.msg15"/>" maxlength="50"/>
									<input style="display:none; with:0px" title="hidden text"><!-- on submit 방지 -->
									<input type="button" onclick="javascript:fnSetPageing('1');" value="Search" class="submit" />
								</fieldset>
							</form>
						</div>
						</form>
					</div>
					<!-- //bbs_info -->

					<div class="bbs_faq" data-list="faq">
						<ul class="list">
							<c:forEach var="data" items="${resultList}" varStatus="status">
								<li>
									<button type="button" class="bbs_question"><span>Question</span><c:out value="${data.title}"/></button>
									<div class="bbs_answer_area">
										<div class="bbs_answer">
											<span class="answer_tit">Answer</span>
											<p><c:out value="${data.content}"/></p>
											<!-- 이미지 들어갈 경우 -->
											<!-- <div class="bbs_img_box"><img src="../../../../images/board/dummy.jpg" alt="" /></div> -->
										</div>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
				<!-- //bbs_faq -->
					<c:if test="${empty resultList}">
						<div class="bbs_empty">
							<p><spring:message code="counsel.msg.no.data"/></p>
							<!-- <p>No results found. <br />Please enter a search term in the search box again.</p> -->
						</div>
						<!-- //bbs_empty -->
					</c:if>
				<!-- //bbs_empty -->
					<!-- 기획서에 없는 영역이라서 삭제 처리 -->
					<!-- <div class="bbs_btn_wrap clearfix">
						<span class="bbs_left">
							<a href="" class="bbs_btn list">LIST</a>
						</span>
						<span class="bbs_right">
							<a href="" class="bbs_btn write">WRITE</a>
							<a href="" class="bbs_btn save">SAVE</a>
							<a href="" class="bbs_btn modify">MODIFY</a>
							<a href="" class="bbs_btn cancel">CANCEL</a>
							<a href="" class="bbs_btn delete">DELETE</a>
						</span>
					</div> -->
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