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
        $('#jqxcombobox').jqxComboBox({width: '200px', height:'25px'});
        $('#jqxcombobox').on('select', function(event) {
        	var args = event.args;
        	console.log('args2', args);
        });
        
        var data = ['a', 'b'];
        
        console.log($('#jqxcombobox').jqxComboBox('source', data));
	});
	</script>
</head>
<body>
	<div id='jqxcombobox'>
	</div>
</body>
</html>