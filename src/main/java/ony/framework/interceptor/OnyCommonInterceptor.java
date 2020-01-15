package ony.framework.interceptor;

import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import ony.framework.domain.CommResult;
import ony.framework.util.SessionUtil;
import net.sf.json.JSONObject;
 
public class OnyCommonInterceptor extends HandlerInterceptorAdapter {
   
  protected final Logger logger = LoggerFactory.getLogger(this.getClass());
   
  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
 
    logger.info("===========================        Login Check		===========================");
     

    String ctx = request.getRequestURI();
    String pageAddr = request.getServletPath();
    String context = request.getContextPath();
	
    String findStr = "";
    
    // 주소가 존재할 시
    if (ctx != null && !"".equals(ctx) && ctx.length() > 0) {
    	int findNum = ctx.substring(1).indexOf("/");
    	findStr = ctx.substring(0,findNum + 1);
    }

	if(adminLoginPageFilter(pageAddr)) {
		if(!pageAddr.endsWith("/getLoginAuth.do")) {
			if (!SessionUtil.isLogin()) {
				// 로그인상태 아닌 경우 
	    		response.sendRedirect(context + "/login/loginFail.do");
	    		return false;
			} else {
				// 권한 검사
				return pageAuthCheck(request, response);

			}
		}
	}
       
    return super.preHandle(request, response, handler);
 
  }
 
  @Override
  public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
      ModelAndView modelAndView) throws Exception {
 
    logger.info("===========================          END           ===========================");
   
  }
  
	/**
	 * 메뉴 권한을 체크.<br>
	 * menu_url 등록되지 않은 메뉴는 모든 권한을 가짐.
	 * 
	 * @param request
	 * @return
	 */
	private boolean pageAuthCheck(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return true;
	}

	/**
	 * ADMIN : 로그인 화면으로 강제 이동 시키는 페이지를 제외 합니다.
	 * @param pageNm
	 * @return
	 */
	private boolean adminLoginPageFilter(String pageAddr) {
		boolean result = true ;

			String[] adminPassPageArr = { "getLoginAuth.do"
										 ,"/loginFail.do"
										 ,"/bsnsListView.do"
										 ,"/getBsnsList.do"
										 ,"/bsnsDetailView.do"
			};

			for(String chkPage : adminPassPageArr) {
				if (pageAddr.endsWith(chkPage)) {
					result = false;
				}
			}

		return result;
	}
}