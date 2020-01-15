package ony.framework.util.xss;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class CrossScriptingFilter implements Filter {

	public void destroy() {}

	public void init(FilterConfig arg0) throws ServletException {}
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {		
		chain.doFilter(new RequestWrapper((HttpServletRequest) request), response);
	}
}