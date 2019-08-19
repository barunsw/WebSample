package com.barunsw.websample.jqx;

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

@Controller
@RequestMapping("/jqx")
public class JqxController {
	private static final Logger LOGGER = LoggerFactory.getLogger(JqxController.class);
	
	private JqxService jqxService;
	
	@Autowired
	public JqxController(final JqxService jqxService) {
		this.jqxService = jqxService;
	}
	
	@RequestMapping(value="/grid/view", method=RequestMethod.GET)
	public String gridView(final Locale locale, final Model model) {
		LOGGER.debug("gridView");
		return "jqx/grid/grid";
	}
	
	@RequestMapping(value="/layout/view", method=RequestMethod.GET)
	public String layoutView(final Locale locale, final Model model) {
		LOGGER.debug("layoutView");
		return "jqx/layout/layout";
	}
	
	@RequestMapping(value="/combobox/view", method=RequestMethod.GET)
	public String comboBoxView(final Locale locale, final Model model) {
		LOGGER.debug("comboBoxView");
		return "jqx/combobox/combobox";
	}
	
	@RequestMapping(value="/layout/test_view", method=RequestMethod.GET)
	public String testView(final Locale locale, final Model model) {
		LOGGER.debug("testView");
		return "jqx/layout/test";
	}
	
	@RequestMapping(value="/grid/data", method=RequestMethod.GET)
	public @ResponseBody List<ProductVo> selectProductList(ProductVo productVo) {
		return jqxService.selectProductList(productVo);
	}
}
