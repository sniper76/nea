<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="/WEB-INF/tlds/CustomFunctionTag.tld" prefix="cFun" %>
<%@ taglib prefix="masking" uri="tld/MaskingUtil.tld"%>

<%
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader("Expires",0);
	if (request.getProtocol().equals("HTTP/1.1")) {
		response.setHeader("Cache-Control", "no-cache");
	}

	pageContext.setAttribute("cr", "\r");
	pageContext.setAttribute("cn", "\n");
	pageContext.setAttribute("crcn", "\r\n");
	pageContext.setAttribute("sp", "&nbsp;");
	pageContext.setAttribute("br", "<br/>");
%>
<sec:authorize access="hasRole('ROLE_USER')">
<%
	pageContext.setAttribute("DIV_ROLE", "ROLE_USER");
%>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_CMPNY')">
<%
	pageContext.setAttribute("DIV_ROLE", "ROLE_CMPNY");
%>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_TRNCT')">
<%
	pageContext.setAttribute("DIV_ROLE", "ROLE_TRNCT");
%>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_STDIT')">
<%
	pageContext.setAttribute("DIV_ROLE", "ROLE_STDIT");
%>
</sec:authorize>