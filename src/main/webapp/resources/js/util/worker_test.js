self.onmessage = function(e) {
	console.log('worker_test onmessage e.data:', e.data);
	
	postMessage({data: '마르고 닳도록'});
}