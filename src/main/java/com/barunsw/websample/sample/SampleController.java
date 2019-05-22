package com.barunsw.websample.sample;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.barunsw.websample.vo.AddressVo;

@Controller
@RequestMapping("/sample")
public class SampleController {
	private static final Logger LOGGER = LoggerFactory.getLogger(SampleController.class);
	
	private SampleService sampleService;
	
	@Autowired
	public SampleController(SampleService sampleService) {
		this.sampleService = sampleService;
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
}
