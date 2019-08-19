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
	
	<script src="/resources/plugins/stomp/stomp.min.js"></script>
	<script src="/resources/plugins/sockjs-client/sockjs.min.js"></script>
		
	<script type="text/javascript">
	//<![CDATA[
	var app = {};
	
	dhtmlxEvent(window, 'load', function() {
	    initLayout();
	    initForm();
	    //initWorker();
	    initWebsocket();
	    
	    retrieveAddressList();
	    
	    // 웹소켓 생성 이후에 test를 하기 위해, 3초 wait한 후 testWebsocket을 호출한다.
	    setTimeout(testWebsocket, 3000);
	});
	
	function initLayout() {
		app.layout = new dhtmlXLayoutObject(document.body, '1C');
		
		app.layout.cells('a').setText('Test');   
	}
	
	function initForm() {
		app.form = app.layout.cells('a').attachForm();
		app.form.loadStruct([
			{type:'block', blockOffset:0, list:[
					{type: 'button', name: 'execButton', value: '일반 실행'}
					, {type: 'newcolumn'}
					, {type: 'button', name: 'workerExecButton', value:'Worker 실행'}
				]
			}
			, {type:'block', blockOffset:0, list:[
					{type: 'input', name: 'sum', width:200, readonly: true}
				]
			}
		]);
		
		app.form.attachEvent('onButtonClick', function(name) {
			if (name == 'execButton') {
				alertMsg('일반 실행');
				var sum = 0;
				for (var i = 0; i < 10; i++) {
					sleep(1000);
					sum = sum + i;
				}
				
				app.form.setItemValue('sum', sum);
			}
			else if (name == 'workerExecButton') {
				alertMsg('Worker 실행');
				
				// web worker (HTML5에서 추가된 기능)
				var worker = new Worker('/resources/js/util/sum_test.js');
				worker.postMessage({data:10});
				worker.onmessage = function(e) {
					console.log('e.data', e.data);
					app.form.setItemValue('sum', e.data.data);
				}
				
				// 꼭 terminate 시켜야 한다.
				// worker.terminate();
				// worker = null;
			}
		});
	}
	
	function sleep(delay) {
		var start = new Date().getTime();
		while (new Date().getTime() < start + delay);
	}
	
	function initWorker() {
		// Worker 지원 유무 확인
		if ( !window.Worker ) {
			alertMsg('Worker 지원 안함');
			return false;
		}
		
		app.worker = new Worker('/resources/js/util/worker_test.js');
		app.worker.postMessage({data:'동해물과 백두산이'});
		app.worker.onmessage = function(e) {
			console.log('sample.jsp onmessage e.data:', e.data);
		}
	}
	
	function initWebsocket() {
		// 웹소켓
		var portStr = "";
		if (location.port.length == 0) {
			portStr = ":80";
		}
		else {
			portStr = ":" + location.port;
		}
		
		var protocolStr = "ws";
		if (location.protocol == 'https') {
			protocolStr = "wss";
		}

		var wsUrl = protocolStr + "://" + location.hostname + portStr + "/push";
		
		console.log('wsUrl', wsUrl);
		
		var ws = new WebSocket(wsUrl);
		
		var client = Stomp.over(ws);
		
		//웹소켓 console.log 비활성화
		client.debug = null;
		
		client.connect({}, function(frame) {
			client.subscribe("/topic/event", function(message) {
				console.log("websocket message", message);
				
				var event = JSON.parse(message.body);
				
				if (event.type == "ALARM") {
					console.log("ALARM", event);
				}
			});
		});
	}
	
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
	
	function testWebsocket() {
		$.ajax({
		    url: getContextPath + '/sample/push-test',
		    async: true,
		    type: 'GET',
		    data: {}, // 전송할 데이터
		    dataType: 'json', // xml, json, script, html
		}).done(function(data) {
			console.log('testWebsocket', data);
		});
	}
	</script>
</head>
<body>
</body>
</html>