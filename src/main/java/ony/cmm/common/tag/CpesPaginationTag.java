package ony.cmm.common.tag;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.support.RequestContextUtils;

import egovframework.rte.ptl.mvc.tags.ui.pagination.DefaultPaginationManager;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationManager;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationRenderer;

public class CpesPaginationTag {

	public CpesPaginationTag() {
	}

	public String getPagination(HttpServletRequest request, PaginationInfo paginationInfo, String jsFunction) {

		PaginationManager paginationManager;

		WebApplicationContext ctx = RequestContextUtils.getWebApplicationContext(request, request.getServletContext());

		if (ctx.containsBean("paginationManager")) {
			paginationManager = (PaginationManager) ctx.getBean("paginationManager");
		} else {
			paginationManager = new DefaultPaginationManager();
		}

		PaginationRenderer paginationRenderer = paginationManager.getRendererType("customRenderer");

		return paginationRenderer.renderPagination(paginationInfo, jsFunction);
	}
}
