function ObjectToQueryString(json) {
    return Object.keys(json).map(function(key) {
            return encodeURIComponent(key) + '=' + encodeURIComponent(json[key]);
    }).join('&');
}

function serializeObject(form) {
    var o = {};
    var a = form.serializeArray();
    $.each(a, function() {
        if ( o[this.name] ) {
            if ( !o[this.name].push ) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};

function serializeCustom(form) {
	var a = form.serialize();
	return a.replace(/(\w*=&)|(&\w*=$)/g,'');
}

// IE에서 지원하지 않는 메소드
if (!String.prototype.startsWith) {
  String.prototype.startsWith = function(searchString, position) {
    position = position || 0;
    return this.indexOf(searchString, position) === position;
  };
}

if (!Array.prototype.find) {
  Object.defineProperty(Array.prototype, 'find', {
    value: function(predicate) {
     // 1. Let O be ? ToObject(this value).
      if (this == null) {
        throw new TypeError('"this" is null or not defined');
      }

      var o = Object(this);

      // 2. Let len be ? ToLength(? Get(O, "length")).
      var len = o.length >>> 0;

      // 3. If IsCallable(predicate) is false, throw a TypeError exception.
      if (typeof predicate !== 'function') {
        throw new TypeError('predicate must be a function');
      }

      // 4. If thisArg was supplied, let T be thisArg; else let T be undefined.
      var thisArg = arguments[1];

      // 5. Let k be 0.
      var k = 0;

      // 6. Repeat, while k < len
      while (k < len) {
        // a. Let Pk be ! ToString(k).
        // b. Let kValue be ? Get(O, Pk).
        // c. Let testResult be ToBoolean(? Call(predicate, T, « kValue, k, O »)).
        // d. If testResult is true, return kValue.
        var kValue = o[k];
        if (predicate.call(thisArg, kValue, k, o)) {
          return kValue;
        }
        // e. Increase k by 1.
        k++;
      }

      // 7. Return undefined.
      return undefined;
    }
  });
}

function goAjaxForm(form, callback) {
	form.ajaxForm({
        dataType: "json",
        async: true,
        success: callback,
        error : function(data) {
        	errorMsg(data.responseJSON.reason);
        }
    }).submit();
}

function goAjaxGet(url, param, callback, layout) {
	var data = goAjaxMethod('GET', url, param, callback != null, callback, layout); //비동기 사용
	return data;
}

function goAjaxPost(url, param, callback, layout) {
	var data = goAjaxMethod('POST', url, param, callback != null, callback, layout); //비동기 사용
	return data;
}

function goAjaxMethod(method, url, param, async, callback, layout) {
	var response 		= null;
	var ajaxOption 		= {};
	ajaxOption.url 		= getContextPath + url;
	ajaxOption.type 	= method;
	ajaxOption.dataType = 'json';
	ajaxOption.async 	= async;
	ajaxOption.statusCode = {500:internarErrorHandler, 302:redirectErrorHandler, 403:authorizationErrorHandler};
	ajaxOption.beforeSend = function() {
		if (layout != null) {
			// start progress 
			layout.progressOn();
		}
	} 
	ajaxOption.complete = function() {
		if (layout != null) {
			// end progress 
			layout.progressOff();
		}
	}
	
	if ( method == 'GET' ) {
		if ( param != null ) {
			ajaxOption.data = param;	
		}
	}
	else {
		ajaxOption.contentType 	= 'application/json; charset=UTF-8';
		if ( param != null ) {
			ajaxOption.data = JSON.stringify(param);	
		}	
	}
	
	if (callback != null) {
		$.ajax(ajaxOption).done(callback).fail(function(data) {
			console.log()
		});;
	}
	else {
		$.ajax(ajaxOption).done(function(data) {
			response = data;
		}).fail(function(data) {
			
		});	

		return response;
	}
}
function internarErrorHandler(result) {
	errorMsg(result.responseJSON.reason);
	//alert('Fail to Ajax. (' + url + ')(' + param + ')');
}

function redirectErrorHandler(a,b,c,d,e) {
	console.log(a);
	console.log(b);
	console.log(c);
	console.log(d);
	console.log(e);
}

function authorizationErrorHandler(a,b,c,d,e) {
	console.log(a);
	console.log(b);
	console.log(c);
	console.log(d);
	console.log(e);
}


function isEmpty(o) {
	if ( o == null || o.trim() == '' ) {
		return true;
	}
	else {
		return false;
	}
}

function openWindowPopup(targetWindow, id, title, url, width, height) {
	goAjaxGet('/session/validation', null);
	var window = null;
	if ( targetWindow.window(id) == null ) {
		window = targetWindow.createWindow(id, 0, 0, width, height);
		window.setText(title);
		if ( url != null ) {
			window.attachURL(url);	
		}
		window.center();	
		
		window.attachEvent("onBeforeMoveStart", function(win) {
			window.setModal(true);
			return true;
		});
		
		window.attachEvent("onBeforeResizeStart", function(win) {
			window.setModal(true);
			return true;
		});
		
		window.attachEvent("onMoveFinish", function(win) {
			window.setModal(false);
		});
		
		window.attachEvent("onMoveCancel", function(win) {
			window.setModal(false);
		});
		
		window.attachEvent("onResizeCancel", function(win) {
			window.setModal(false);
		});
		
		window.attachEvent("onResizeFinish", function(win) {
			window.setModal(false);
		});
		
	}
	else {
		window = targetWindow.window(id);
		window.bringToTop();
	}
	
	return window;
}

function messageBox(title, message, width=600, height=400) {
	dhtmlx.alert({
		title:title,
	    text: '<textarea id="messageBox" style="width: ' + (width-25) + 'px;height: ' + (height-120) + 'px;" readonly="readonly">' + message + '</textarea>',
	    ok : '닫기',
	    width:width + 'px',
	    height:height + 'px'
	});
}

function alertMsg(message) {
	dhtmlx.alert({ 
		title: '', 
		ok: '확인',
		type: 'alert', 
		text: message
		}
	);
}

// 확인 버튼 누를 때 callback 함수 실행 필요한 경우 활용
function alertMsg(message, callback) {
	dhtmlx.alert({
			title: '',
			ok: '확인',
			type: 'alert',
			text: message,
			callback: callback
		}
	);
}

function warningMsg(message) {
	dhtmlx.alert({ 
		title: 'Warning', 
		ok: '확인',
		type: 'alert-warning', 
		text: message }
	);
}

function errorMsg(message, callback) {
	dhtmlx.alert({ 
		title: 'Error', 
		ok: '확인',
		type: 'alert-error', 
		text: message,
		callback: callback}
	);
}

function confirmMsg(message, callback) {
	dhtmlx.confirm({
		text : message,
		ok : '예',
		cancel: '아니오',
		callback : function(result) {
			if ( result ) {
				callback();
			}			
		}
	});	
}

function getChildWindowInfo(nodeId, menuId) {
	var data = {
		nodeId: nodeId,
		menuId: menuId
	};
	
	return goAjaxGet('/manager/menu/getChildWindowList', data, null).data;
}

$( document ).ajaxError(function( event, jqxhr, settings, thrownError ) {
	if ( jqxhr.status == 401 ) {
		errorMsg('로그아웃 되었습니다.', function() {
			location.href = '/login';
		});
	}
});
