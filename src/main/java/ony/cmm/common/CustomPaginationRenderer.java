package ony.cmm.common;

import egovframework.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;

public class CustomPaginationRenderer extends AbstractPaginationRenderer {
	public CustomPaginationRenderer() {
		firstPageLabel = "<a href=\"#\" class=\"prev_end\" onclick=\"{0}({1}); return false;\">First page</a> ";
		previousPageLabel = "<a href=\"#\" class=\"prev_one\" onclick=\"{0}({1}); return false;\">Prev page</a> ";

		currentPageLabel = "<strong title=\"Current page\">{0}</strong> ";

		otherPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\">{2}</a> ";
		nextPageLabel = "<a href=\"#\" class=\"next_one\" onclick=\"{0}({1}); return false;\">Next page</a> ";
		lastPageLabel = "<a href=\"#\" class=\"next_end\" onclick=\"{0}({1}); return false;\">Last page</a>";
	}

}
