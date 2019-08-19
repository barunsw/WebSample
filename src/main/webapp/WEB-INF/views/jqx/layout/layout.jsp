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
        var layout = [
        	{
        		type: 'layoutGroup'
        		, orientation: 'horizontal'
        		, items: [
        			{
        				type: 'autoHideGroup'
        				, alignment: 'left'
        				, width: 80
        				, unpinnedWidth: 200
        				, items: [
        					{
        						type: 'layoutPanel'
        						, title: 'Toolbox'
        						, contentContainer: 'ToolboxPanel'
        					}
        					, {
        						type: 'layoutPanel'
        						, title: 'Help'
        						, contentContainer: 'HelpPanel'
        					}
        				]
        			}
        			, {
        				type: 'layoutGroup'
        				, orientation: 'vertical'
        				, width: 400
        				, items: [
        					{
        						type: 'documentGroup'
        						, height: 400
        						, minHeight: 200
        						, items: [
        							{
        								type: 'documentPanel'
        								, title: 'Document 1'
        								, contentContainer: 'Document1Panel'
        							}
        							, {
        								type: 'documentPanel'
        								, title: 'Document 2'
        								, contentContainer: 'Document2Panel'
        							}
        						]
        					}
        					, {
        						type: 'tabbedGroup'
        						, height: 200
        						, pinnedHeight: 30
        						, items: [
        							{
        								type: 'layoutPanel'
        								, title: 'Error List'
        								, contentContainer: 'ErrorListPanel'
        							}
        							, {
        								type: 'layoutPanel'
        								, title: 'Output'
        								, contentContainer: 'OutputPanel'
        								, selected: true
        							}
        						]
        					}
        				]
        			}
        		]
        	}
        ];
        
        $('#jqxLayout').jqxLayout({width: 800, height: 600, layout: layout});
	});
	</script>
</head>
<body>
	<div id='jqxLayout'>
		<div data-container='ToolboxPanel'>List of tools</div>
		<div data-container='HelpPanel'>Help Topics</div>
		<div data-container='Document1Panel'>Document 1 content</div>
		<div data-container='Document2Panel'>Document 2 content</div>
		<div data-container='ErrorListPanel'>List of errors</div>
		<div data-container='OutputPanel'>Output</div>
		<div data-container='SolutionExplorerPanel'>Solution structure</div>
		<div data-container='PropertiesPanel'>List of properties</div>
	</div>
</body>
</html>