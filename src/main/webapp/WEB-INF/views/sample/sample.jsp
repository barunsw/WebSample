<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<title>Sample</title>

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
	
	dhtmlxEvent(window, 'load', function() {
		var layout = new dhtmlXLayoutObject(document.body,"2U");
		
	    layout.cells("a").setText("Contacts");   
	    layout.cells("b").setText("Contact Details");
	    
	    retrieveAddressList();
	});
	
	function retrieveAddressList() {
		var param = {
		};
		
		$.ajax({
		    url: getContextPath + '/sample',
		    async: true,
		    type: 'GET',
		    data: param, // 전송할 데이터
		    dataType: 'json', // xml, json, script, html
		}).done(function(data) {
			console.log(data);
		});
	}
	</script>
</head>
<body>
</body>
</html>