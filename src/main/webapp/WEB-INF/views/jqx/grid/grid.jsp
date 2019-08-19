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

	$(document).ready(function() {
		initGrid();
		retrieveProduct();
	});
	
	function initGrid() {
		$('#jqxgrid').jqxGrid({
			width: '100%',
			theme: 'energyblue',
			sortable: true,
			columns: [
				{text: 'First Name', datafield: 'firstName', columngroup: 'Name', width: 100}
				, {text: 'Last Name', datafield: 'lastName', columngroup: 'Name', width: 100}
				, {text: 'Product', datafield: 'productName'}
				, {text: 'Quantity', datafield: 'quantity', width: 80, cellsalign: 'right'}
				, {text: 'Unit Price', datafield: 'priceValue', width: 90, cellsalign: 'right', cellsformat: 'c2'}
				, {text: 'Total', datafield: 'total', width: 100, cellsalign: 'right', cellsformat: 'c2'}
			]
		});
	}
	
	function retrieveProduct() {
		$.ajax({
			url: '/jqx/grid/data'
			, data: null
			, method: 'GET'
			, dataType: 'json'
		})
		.done(function (data) {
			console.log('data', data);
			
			var source = {
	            localdata: data,
	            datatype: "array"
	        };
				
			var adapter = new $.jqx.dataAdapter(source);
			
			$('#jqxgrid').jqxGrid('source', adapter);
			
			console.log('adapter', adapter);
		});
	}
	</script>
</head>
<body class='default'>
	<div id='jqxWidget' style='padding: 5px; width: 99%; font-size: 13px; font-family: Verdana; float: left;'>
		<div id='jqxgrid'></div>
	</div>
 </body>
</html>