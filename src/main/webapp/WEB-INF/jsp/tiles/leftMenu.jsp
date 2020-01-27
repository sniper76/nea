<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<script>
	function fnGoPrivt(actionUrl) {
		$("#leftMenuForm").attr("action",actionUrl);
		$("#leftMenuForm").submit();
	}


</script>
<div id="container">
	<form id="leftMenuForm" name="leftMenuForm" method="post">
	</form>
    <div class="wrap clearfix">
		<div class="path_box">
			<a href="" class="home">Go to main page</a>
			<span>MyPage</span>
		</div>
        <div id="side2">
            <nav class="side_menu">
                <h2 class="skip">Sub menu</h2>
                <sec:authorize access="hasAnyRole('ROLE_USER,ROLE_STDIT')">
                <ul class="dep1">
	                <li><a href=""><spring:message code="gnb.menu.member.title"/></a>
	                    <ul class="dep2">
		                    <li><a href=""><spring:message code="member.join.step.two.msg"/></a>
		                        <ul class="dep3">
			                        <li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/private/member/modify.do');"><spring:message code="mypage.private.member.title"/></a></li>
			                       	<li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/all/pwdChange.do');"><spring:message code="mypage.private.member.title4"/></a></li>
			                        <li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/all/withdrawal.do');"><spring:message code="gnb.menu.member.title3"/></a></li>
			                        <li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/private/member/typeChange.do');"><spring:message code="gnb.menu.member.title4"/></a></li>
		                        </ul>
		                    </li>
		                    <li><a href=""><spring:message code="gnb.menu.cv.title"/></a>
		                        <ul class="dep3">
			                        <li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/private/resume/list.do');"><spring:message code="gnb.menu.cv.title2"/></a></li>
			                        <li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/private/jobsk/index.do');"><spring:message code="mypage.private.jobsk.title"/></a></li>
		                        </ul>
		                    </li>
		                    <li><a href=""><spring:message code="gnb.menu.applic.title"/></a>
		                        <ul class="dep3">
		                        	<li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/private/applic/list.do');"><spring:message code="mypage.private.applic.title"/></a></li>
									<li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/private/applic/offerList.do');"><spring:message code="mypage.private.offer.title"/></a></li>
									<li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/private/applic/intvwList.do');"><spring:message code="mypage.private.intvw.title"/></a></li>
									<li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/private/applic/resumeOpenList.do');"><spring:message code="mypage.private.resumeOpen.title"/></a></li>
									<li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/private/applic/referralList.do');"><spring:message code="mypage.private.referral.title"/></a></li>
		                        </ul>
		                    </li>
		                    <li><a href=""><spring:message code="gnb.menu.interest.title"/></a>
		                        <ul class="dep3">
		                        	<li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/private/interest/vacancyList.do');"><spring:message code="mypage.private.interest.title"/></a></li>
									<li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/private/interest/compnyList.do');"><spring:message code="mypage.private.interest.title2"/></a></li>
									<li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/private/interest/fairList.do');"><spring:message code="mypage.private.interest.title3"/></a></li>
									<li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/private/interest/eduInsttList.do');"><spring:message code="mypage.private.interest.title4"/></a></li>
									<li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/private/interest/eduTrnngList.do');"><spring:message code="mypage.private.interest.title5"/></a></li>
									<li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/private/interest/eduTrnngNeaList.do');"><spring:message code="mypage.private.interest.title6"/></a></li>
		                        </ul>
		                    </li>
		                    <li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/private/fair/list.do');"><spring:message code="mypage.private.fair.title"/></a></li>
		                    <li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/private/workshop/list.do');"><spring:message code="eduTrnng.free.search.title39"/></a></li>
		                    <li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/private/mypage/counsel/list.do');"><spring:message code="gnb.menu.interest.title2"/></a></li>

		                    <li><a href=""><spring:message code="lnb.mypage.left.menu1"/></a>
		                        <ul class="dep3">
		                        	<li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/private/matching/init.do');"><spring:message code="lnb.mypage.left.menu2"/></a></li>
		                        	<li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/private/matching/autoMatchList.do');"><spring:message code="auto.matching"/></a></li>
		                        </ul>
		                    </li>
		                    <li><a href=""><spring:message code="gnb.menu.counsel.title7"/></a>
		                        <ul class="dep3">
		                        	<li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/private/counsel/eduTrnngNeaList.do');"><spring:message code="gnb.menu.eduTrnng.title"/></a></li>
		                        	<li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/all/mypage/counsel/list.do');"><spring:message code="gnb.menu.counsel.title8"/> </a></li>

		                        </ul>
		                    </li>
                    	</ul>

                	</li>
                </ul>
                </sec:authorize>
                <sec:authorize access="hasRole('ROLE_CMPNY')">

                <ul class="dep1">
	                <li><a href=""><spring:message code="gnb.menu.member.title"/></a>
	                    <ul class="dep2">
		                    <li><a href=""><spring:message code="member.join.step.two.msg"/></a>
		                        <ul class="dep3">
			                        <li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/compny/member/modify.do');"><spring:message code="mypage.compny.member.title"/></a></li>
			                        <li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/compny/member/profileModify.do');"><spring:message code="mypage.compny.profile.title"/></a></li>
			                       	<li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/all/pwdChange.do');"><spring:message code="mypage.private.member.title4"/></a></li>
			                        <li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/all/withdrawal.do');"><spring:message code="gnb.menu.member.title3"/></a></li>
		                        </ul>
		                    </li>
		                    <li><a href=""><spring:message code="compny.vacancy.msg.title68"/></a>
		                        <ul class="dep3">
									<li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/compny/vacancy/list.do');"><spring:message code="compny.vacancy.msg.title68"/></a></li>
									<li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/compny/applic/list.do');"><spring:message code="gnb.menu.vacancy.title"/></a></li>
									<li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/compny/vacancy/intvwList.do');">면접제의 관리</a></li>
									<li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/compny/vacancy/intvwVideoList.do');"><spring:message code="mypage.compny.vacancy.intvw.video.ttl01"/></a></li>
		                        </ul>
		                    </li>
		                    <li><a href=""><spring:message code="gnb.menu.vacancy.title2"/></a>
		                        <ul class="dep3">
									<li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/compny/applic/offerList.do');"><spring:message code="gnb.menu.vacancy.title3"/></a></li>

		                        </ul>
		                    </li>
		                    <li><a href=""><spring:message code="gnb.menu.vacancy.title4"/></a>
		                        <ul class="dep3">
									<li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/compny/applic/referralList.do');"><spring:message code="gnb.menu.vacancy.title5"/></a></li>
									<li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/compny/applic/vacancyList.do');"><spring:message code="mypage.private.jobsk.title37"/></a></li>
		                        </ul>
		                    </li>
		                    <li><a href=""><spring:message code="mypage.compny.match.ttl01"/></a>
		                        <ul class="dep3">
									<li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/compny/match/autoMatchList.do');"><spring:message code="auto.matching"/></a></li>
									<li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/compny/match/matchResumeList.do');"><spring:message code="mypage.compny.match.ttl01"/></a></li>
		                        </ul>
		                    </li>

		                    <li><a href=""><spring:message code="gnb.menu.interest.title"/></a>
		                        <ul class="dep3">
		                        	<li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/compny/interest/resumeList.do');"><spring:message code="mypage.compny.interest.title3"/></a></li>
		                        	<li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/compny/interest/compnyList.do');"><spring:message code="mypage.compny.interest.title2"/></a></li>
									<li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/compny/interest/vacancyList.do');"><spring:message code="gnb.menu.vacancy.title6"/></a></li>
									<li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/compny/interest/fairList.do');"><spring:message code="mypage.private.interest.title3"/></a></li>
		                        </ul>
		                    </li>
		                    <li><a href=""><spring:message code="mypage.private.fair.title"/></a>
		                        <ul class="dep3">
		                        	<li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/compny/fair/inviteList.do');"><spring:message code="mypage.compny.fair.title"/></a></li>
									<li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/compny/fair/joinList.do');"><spring:message code="mypage.compny.fair.title2"/></a></li>
									<li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/compny/fair/boothList.do');"><spring:message code="mypage.compny.fair.title3"/></a></li>
		                        </ul>
		                    </li>
		                    <li><a href=""><spring:message code="gnb.menu.counsel.title7"/></a>
		                        <ul class="dep3">
		                        	<li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/all/mypage/counsel/list.do');"><spring:message code="gnb.menu.counsel.title8"/></a></li>

		                        </ul>
		                    </li>

                    	</ul>

                	</li>
                </ul>
                </sec:authorize>
                <sec:authorize access="hasRole('ROLE_TRNCT')">
                <ul class="dep1">
	                <li><a href=""><spring:message code="gnb.menu.member.title"/></a>
	                    <ul class="dep2">
		                    <li><a href=""><spring:message code="member.join.step.two.msg"/></a>
		                        <ul class="dep3">
			                        <li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/instt/member/modify.do');"><spring:message code="mypage.compny.profile.title24"/></a></li>
			                        <li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/instt/member/profileModify.do');"><spring:message code="mypage.compny.profile.title25"/></a></li>
			                       	<li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/all/pwdChange.do');"><spring:message code="mypage.private.member.title4"/></a></li>
			                        <li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/all/withdrawal.do');"><spring:message code="gnb.menu.member.title3"/></a></li>

		                        </ul>
		                    </li>
		                    <li><a href=""><spring:message code="mypage.instt.eduTrnng.title"/></a>
		                        <ul class="dep3">
									<li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/instt/eduTrnng/list.do');"><spring:message code="gnb.menu.vacancy.title7"/></a></li>
		                        </ul>
		                    </li>
		                    <li><a href=""><spring:message code="mypage.private.fair.title"/></a>
		                        <ul class="dep3">
		                        	<li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/instt/fair/inviteList.do');"><spring:message code="mypage.compny.fair.title"/></a></li>
		                        	<li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/instt/fair/boothList.do');"><spring:message code="mypage.compny.fair.title3"/></a></li>
									<li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/instt/fair/joinList.do');"><spring:message code="mypage.compny.fair.title2"/></a></li>
		                        </ul>
		                    </li>
		                    <li><a href=""><spring:message code="gnb.menu.counsel.title7"/></a>
		                        <ul class="dep3">
		                        	<li><a href="javascript:void(0);" onclick="fnGoPrivt('${pageContext.request.contextPath}/cpes/all/mypage/counsel/list.do');"><spring:message code="gnb.menu.counsel.title8"/></a></li>

		                        </ul>
		                    </li>
                    	</ul>

                	</li>
                </ul>
                </sec:authorize>

                <script>
                    //<![CDATA[
                    jQuery(function(){
                        side_menu(1,1,3);//첫번째 1depth , 두 번째 2depth 활성화 , 세 번째 3depth 활성화
                    });
                    //]]>
                </script>
            </nav>
            <!-- //side_menu -->
        </div>
        <!-- //side2 -->