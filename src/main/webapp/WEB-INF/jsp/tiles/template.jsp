<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.5, minimum-scale=1.0, user-scalable=yes" />
    <meta name="title" content="사이트 제목" />
	<meta name="keywords" content="키워드 입력" />
	<meta name="description" content="사이트 상세설명" />
<!-- 	<meta http-equiv="Pragma" content="no-cache">
 	<meta http-equiv="Cache-Control" content="no-cache">
 	<meta http-equiv="Expires" content="Sat, 01 Dec 2001 00:00:00 GMT"> -->
	<link rel="shortcut icon" href="/images/common/favicon.png" />
    <link rel="stylesheet" href="/css/font.css" />
    <link rel="stylesheet" href="/css/sub.css" />
    <script src="/js/jquery/jquery-1.12.4.min.js"></script>
    <script src="/js/common.js"></script>
    <tiles:insertAttribute name="header" />
    <title>CPES</title>
</head>

<tiles:insertAttribute name="top" />
<tiles:insertAttribute name="left" />
<tiles:insertAttribute name="body" />
<tiles:insertAttribute name="footer" />