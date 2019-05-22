package com.barunsw.websample.sample;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.barunsw.websample.constants.PushType;
import com.barunsw.websample.push.PushService;
import com.barunsw.websample.vo.AddressVo;
import com.barunsw.websample.vo.PushVo;

@Controller
@RequestMapping("/sample")
public class SampleController {
	private static final Logger LOGGER = LoggerFactory.getLogger(SampleController.class);
	
	private SampleService sampleService;
	private PushService pushService;
	
	@Autowired
	public SampleController(SampleService sampleService, PushService pushService) {
		this.sampleService = sampleService;
		this.pushService = pushService;
	}
	
	@RequestMapping(value="/view", method=RequestMethod.GET)
	public String sampleView(final Locale locale, final Model model) {
		LOGGER.debug("sampleView");
		return "sample/sample";
	}
	
	@RequestMapping(value="", method=RequestMethod.GET)
	public @ResponseBody List<AddressVo> getAddressList(AddressVo addressVo) {
		return sampleService.selectList(addressVo);
	}
	
	@RequestMapping(value="/push-test", method=RequestMethod.GET)
	@ResponseStatus(value = HttpStatus.OK)
	public void pushTest() {
		LOGGER.debug("pushTest");
		
		PushVo pushVo = new PushVo();
		pushVo.setType(PushType.ALARM);
		pushVo.setPayload("Push 테스트");
		
		pushService.push(pushVo);
	}
}
