self.onmessage = function(e) {
	console.log('sum_test.js e', e);
	var sum = 0;
	for (var i = 0; i < e.data.data; i++) {
		sleep(1000);
		sum = sum + i;
		console.log('sum', sum);
	}
	
	postMessage({data: sum});
}

function sleep(delay) {
	var start = new Date().getTime();
	while (new Date().getTime() < start + delay);
}