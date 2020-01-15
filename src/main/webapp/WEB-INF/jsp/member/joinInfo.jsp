<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>

<h3><spring:message code="member.join.msg1"/></h3>
<p><spring:message code="member.join.msg2"/></p>
<div class="signup_box01">
	<ul class="clearfix">
		<li>
			<a href="javascript:fnJoinStepOne(USER_AUTH_CD_USER);">
				<span><spring:message code="member.join.msg.user.nm"/> <br /><spring:message code="member.join.msg.member"/></span>
			</a>
		</li>
		<li>
			<a href="javascript:fnJoinStepOne(USER_AUTH_CD_STDIT);">
				<span><spring:message code="member.join.msg.student.nm"/>/<br /><spring:message code="member.join.msg.intern"/> <br /><spring:message code="member.join.msg.member"/></span>
			</a>
		</li>
		<li>
			<a href="javascript:fnJoinStepOne(USER_AUTH_CD_CMPNY);">
				<span><spring:message code="member.join.msg.company.nm"/> <br /><spring:message code="member.join.msg.member"/></span>
			</a>
		</li>
		<li>
			<a href="javascript:fnJoinStepOne(USER_AUTH_CD_TRNCT);">
				<span><spring:message code="member.join.msg.education.nm"/> <br /><spring:message code="member.join.msg.member"/></span>
			</a>
		</li>
	</ul>
</div>

<h3><spring:message code="member.join.msg3"/></h3>
<div class="box_img">
    <div class="inner">
        <img src="${pageContext.request.contextPath}/images/contents/signup_process01.png" alt="User Registration &lt; Write your CV &lt; JC Job Registration &lt; Job Application" />
        <span class="img_zoom"><a href="${pageContext.request.contextPath}/images/contents/signup_process01.png" target="_blank" title="New windwo open">View larger image</a></span>
    </div>
</div>
<ul class="bu margin_b_30">
	<li><spring:message code="member.join.msg.public"/></li>
	<li><spring:message code="member.join.msg.public2"/></li>
	<li><strong class="em_b_blue"><spring:message code="member.join.msg.public3"/></strong> <spring:message code="member.join.msg.public4"/></li>
</ul>

<h3><spring:message code="member.join.msg.company"/></h3>
<div class="box_img">
    <div class="inner">
        <img src="${pageContext.request.contextPath}/images/contents/signup_process02.png" alt="User Registration &lt; Register Job Vacancy &lt; Approval by JC &lt; Manage Job Vacancy" />
        <span class="img_zoom"><a href="${pageContext.request.contextPath}/images/contents/signup_process02.png" target="_blank" title="New windwo open">View larger image</a></span>
    </div>
</div>
<ul class="bu margin_b_30">
	<li><spring:message code="member.join.msg.company2"/></li>
	<li><spring:message code="member.join.msg.company3"/></li>
	<li><spring:message code="member.join.msg.company4"/></li>
	<li><spring:message code="member.join.msg.company5"/></li>
	<li><spring:message code="member.join.msg.company6"/></li>
</ul>

<h3><spring:message code="member.join.msg.education"/></h3>
<div class="box_img">
    <div class="inner">
        <img src="${pageContext.request.contextPath}/images/contents/signup_process03.png" alt="User Registration &lt; Program Registration &lt; Apply for Program/Approval &lt; Program Mgmt." />
        <span class="img_zoom"><a href="${pageContext.request.contextPath}/images/contents/signup_process03.png" target="_blank" title="New windwo open">View larger image</a></span>
    </div>
</div>
<ul class="bu">
	<li><spring:message code="member.join.msg.education2"/></li>
	<li><spring:message code="member.join.msg.education3"/></li>
	<li><spring:message code="member.join.msg.education4"/></li>
</ul>

<%-- <div class="signup_process">
	<ul class="clearfix">
	<li class="active"><span title="Current Status"><spring:message code="member.join.msg.step"/></span></li>
	<li><span><spring:message code="member.join.msg.step2"/></span></li>
	<li><span><spring:message code="member.join.msg.step3"/></span></li>
	</ul>
</div>	 --%>