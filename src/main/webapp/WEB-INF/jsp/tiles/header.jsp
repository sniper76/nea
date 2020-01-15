<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>


<%
	pageContext.setAttribute("cr", "\r");
	pageContext.setAttribute("cn", "\n");
	pageContext.setAttribute("crcn", "\r\n");
	pageContext.setAttribute("sp", "&nbsp;");
	pageContext.setAttribute("br", "<br/>");

	pageContext.setAttribute("xsslt", "&lt;");
	pageContext.setAttribute("xssgt", "&gt;");
	pageContext.setAttribute("delt", "<");
	pageContext.setAttribute("degt", ">");

%>
<%-- <meta id="_csrf" name="_csrf" th:content="${_csrf.token}"/>
<!-- default header name is X-CSRF-TOKEN -->
<meta id="_csrf_header" name="_csrf_header" th:content="${_csrf.headerName}"/> --%>



<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/sub.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/file.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/alertify/themes/alertify.core.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/alertify/themes/alertify.default.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/sub_content.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/sub_layout.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/select2/dist/css/select2.min.css" rel="stylesheet" />
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" /> -->




<!-- js -->
<script src="${pageContext.request.contextPath}/js/jquery/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery/slick.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery/jquery.form.js"></script>
<script src="${pageContext.request.contextPath}/js/common.js"></script>
<script src="${pageContext.request.contextPath}/js/sub.js"></script>
<script src="${pageContext.request.contextPath}/js/common/common.js"></script>
<script src="${pageContext.request.contextPath}/js/common/cpesExcommon.js"></script>
<script src="${pageContext.request.contextPath}/js/common/linkUrl.js"></script>
<script src="${pageContext.request.contextPath}/plugins/select2/dist/js/select2.min.js"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script> -->

<!-- dext5upload -->
<script type="text/javascript" src="${pageContext.request.contextPath}/plugins/dext5upload/js/dext5upload.js"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/plugins/dext5upload/js/dext5_common.js"></script> --%>

<!-- ckeditor -->
<script type="text/javascript" src="${pageContext.request.contextPath}/plugins/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/plugins/ckeditor/config.js"></script>

<script>
var contextPath = '${pageContext.request.contextPath}';
var emailFailMsg = "<spring:message code="login.stop.errors.email"/>";
var cellPhoneFailMsg = "<spring:message code="login.stop.errors.cell"/>";
var noMemberFailMsg = "<spring:message code="login.findId.no.data"/>";
var systemMsg = "<spring:message code="errors.ajax.fail"/>";
var confirmDeleteMsg = "<spring:message code="counsel.msg.btn.delete"/>";
var deleteSuccessMsg = "<spring:message code="counsel.msg.delete.success"/>";
var likeMsg = "<spring:message code="counsel.msg.reg.like.cnt"/>";
var regMsg = "<spring:message code="counsel.msg.reg.ok"/>";
var loginAfterMsg = "<spring:message code="bulletin.errors.login.after"/>";
var contentFailMsg = "<spring:message code="counsel.errors.contents"/>";
var confirmCommentDeleteMsg = "<spring:message code="bulletin.msg.comment.btn.delete"/>";
var maxByteMsg = "<spring:message code="bulletin.errors.byte.limit"/>";
var notFullAddrMsg = "<spring:message code='resume.write.errors.msg1'/>";
var yearFormatErrorMsg = "<spring:message code='resume.write.errors.msg2'/>";
var emailFormatErrorMsg = "<spring:message code='resume.write.errors.msg3'/>";
var errorMsg = "<spring:message code='resume.write.insert.error'/>";
var confirmDeleteMsg2 = "<spring:message code="compny.vacancy.msg.btn.delete"/>";

var jobskCancelMsg = "<spring:message code="mypage.private.jobsk.errors.msg3"/>";
var changeOkMsg = "<spring:message code="mypage.private.jobsk.title21"/>";
var jobskDelMsg = "<spring:message code="mypage.private.jobsk.errors.msg4"/>";
var referralMsg = "<spring:message code="mypage.private.referral.title2"/>";
var saveMsg = "<spring:message code="counsel.msg.update.ok"/>";
var rejectMsg = "<spring:message code="mypage.private.referral.errors.msg"/>";
var confirmSaveMsg = "<spring:message code="mypage.private.interest.msg"/>";
var confirmApplicSaveMsg = "<spring:message code="mypage.private.interest.msg2"/>";
var choiceSelectOptionMsg = "<spring:message code="member.join.msg.choice"/>";
var isicedCdChoiceMsg = "<spring:message code="mypage.instt.eduTrnng.erros.msg"/>";
var isicCdChoiceMsg = "<spring:message code="mypage.compny.vacancy.erros.msg"/>";
var dataChoiceMsg = "<spring:message code="mypage.compny.applic.errors.msg"/>";
var cancelApplicMsg = "<spring:message code="mypage.private.interest.msg3"/>";
var cancelResultMsg = "<spring:message code="mypage.private.fair.errors.msg2"/>";
var iscoCdNotValueMsg = "<spring:message code="mypage.private.interest.msg4"/>";
var areaNotValueMsg = "<spring:message code="mypage.private.interest.msg5"/>";
var btnclose = "<spring:message code="button.close2"/>";
var allMsg = "<spring:message code="counsel.msg.all"/>";
var referralRejectMsg = "<spring:message code="mypage.private.referral.errors.msg2"/>";

</script>

<!--  ALERTFY -->
<script  src="${pageContext.request.contextPath}/js/alertify/lib/alertify.min.js"></script>

<div id="div_commonAddr">
	<%-- <c:import url="/common/viewAddrPopup.do" /> --%>
</div>

<div id="div_common">
</div>
