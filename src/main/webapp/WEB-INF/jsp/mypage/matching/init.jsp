<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>

    <script>
    	$(document).ready(function() {
    		console.log('${errorMsg}');
    		if('${errorMsg}') {
    			alertify.alert('${errorMsg}');
    		}
    	});

	</script>

<main class="colgroup" id="colgroup">
            <article>
                <header class="sub_head">

                    <div class="sub_title">
						<h2><span><spring:message code="lnb.mypage.left.menu1"/></span></h2>
					</div>
                </header>

                <div id="contents" class="matchingInit">

				<div class="matching_box">
					<div class="box_wrap">
						<div class="contents_box">
							<div class="title_box">
								<span class="tit"><spring:message code="lnb.mypage.left.menu1"/></span>
								<strong class="title">Please Set your preferred conditions <br />for finding your employee!</strong>
							</div>
							<div class="cont_box">
								<p>Set your preference on job seeker such as occupation, sector, location, etc., <br />then you will receive job seeker list based on your preference. </p>
							</div>
							<div class="put_box">
								<a href="${pageContext.request.contextPath}/cpes/private/matching/regist.do"><spring:message code="lnb.mypage.left.menu4"/></a>
							</div>
						</div>
					</div>
				</div>
				<!-- //matching_box -->

                </div>
                <!-- //contents -->
            </article>
</main>