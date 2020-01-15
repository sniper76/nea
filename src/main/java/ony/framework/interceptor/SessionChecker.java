package ony.framework.interceptor;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

public class SessionChecker{
    public void setSession(HttpSession session){
 // 리스너 객체를 생성해서 이것도 세션에 같이 담는다.  리스너 라는 이름으로...
        session.setAttribute("listener", new CustomBindingListener());
    }
    
    public static int nowUser = 0;
    public static void setNowUser(int x){
    	  nowUser += x;
	 }

	 public int getNowUser(){
	  return this.nowUser;
	 }
}


//                                                     여기서    구현했습니다..

class CustomBindingListener implements HttpSessionBindingListener {
    public void valueBound(HttpSessionBindingEvent event) {
 // 세션이 생겼을 할 내용
    	SessionChecker.setNowUser(1);
        System.out.println("BOUND as " + event.getName() + " to " + event.getSession().getId());
    }

    public void valueUnbound(HttpSessionBindingEvent event) {
 // 세션이 종료되었을때
    	SessionChecker.setNowUser(-1);
        System.out.println("UNBOUND as " + event.getName() + " to " + event.getSession().getId());
    }
}
 