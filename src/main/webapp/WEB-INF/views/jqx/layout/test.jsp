<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<title>Sample Layout</title>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>	
	    
	<style>
	    html, body {
	        width: 100%;      /*provides the correct work of a full-screen layout*/ 
	        height: 100%;     /*provides the correct work of a full-screen layout*/
	        overflow: hidden; /*hides the default body's space*/
	        margin: 0px;      /*hides the body's scrolls*/
	    }
	</style>
		
	<script type="text/javascript">
	//<![CDATA[
	var app = {};

	$(document).ready(function() {
		initMenu();
		initLayout();
	});
	
	function initMenu() {
		var menuData = [
			{id:'menu_account', label:'계정', items:[
				{id:'menu_item_sso', label:'SSO 인증 정보'}
				, {id:'menu_item_session', label:'세션관리'}
				, {id:'menu_item_logout', label:'로그아웃'}
			]}
			, {id:'menu_command', label:'명령어'}
			, {id:'menu_system', label:'시스템'}
			, {id:'menu_history', label:'이력'}
			, {id:'menu_preferences', label:'설정'}
		];
		
		$('#mainMenu').jqxMenu({width:'100%', height:30, source:menuData});

		$('#mainMenu').on('itemclick', function(event) {
			switch(event.target.id) {
			case 'menu_item_sso':
				console.log('menu_item_sso');
				break;
			case 'menu_item_session':
				console.log('menu_item_session');
				break;
			case 'menu_item_logout':
				console.log('menu_item_logout');
				break;
			}
		});
	}
	
	function initLayout() {
		// 화면의 Height
		var winHeight = $(window).height();
		
		var layout = [
			{type:'layoutGroup', orientation:'vertical', width:'100%', height:600, items:[
				{type:'documentGroup', height:400, minHeight: 200, items:[
					{type:'documentPanel', title:'contents', width:'100%', height:'300px', contentContainer: 'contentsPanel'}
				]}
				, {type:'documentGroup', height:400, minHeight: 200, items:[
					{type:'documentPanel', title:'event', width:'100%', height:'300px', contentContainer: 'eventPanel'}
				]}
			]}
		];
		
		$('#mainLayout').jqxLayout({width:'100%', height:winHeight-30, layout:layout});
	}
	</script>
</head>
<body>
	<div id='jqxWidget'>
		<div id='mainMenu'></div>
		<div id='mainLayout'>
			<div data-container='contentsPanel'>contents</div>
			<div data-container='eventPanel'>events</div>
		</div>
	</div>
</body>
</html>