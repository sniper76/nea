<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%
	String filePath = request.getRealPath("/html/pub");

	File dir = new File(filePath);
	File[] files = dir.listFiles();

	for (int i = 0; i < files.length; i++) {
	    if (files[i].isFile()) {
	        out.print("<p><a href=\"/html/pub/"+files[i].getName()+"\">"+files[i].getName()+"</a></p>");
	    }
	}

%>
