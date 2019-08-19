package com.barunsw.websample.jqx;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class JqxServiceImpl implements JqxService {
	private static final String[] firstNames = {
			"Andrew", "Nancy", "Shelley", "Regina", "Yoshi", "Antoni", "Mayumi", "Ian", "Peter", "Lars", "Petra", "Martin", "Sven", "Elio", "Beate", "Cheryl", "Michael", "Guylene"
	};

	private static final String[] lastNames = {
			"Fuller", "Davolio", "Burke", "Murphy", "Nagase", "Saavedra", "Ohno", "Devling", "Wilson", "Peterson", "Winkler", "Bein", "Petersen", "Rossi", "Vileid", "Saylor", "Bjorn", "Nodier"
	};

	private static final String[] productNames = {
			"Black Tea", "Green Tea", "Caffe Espresso", "Doubleshot Espresso", "Caffe Latte", "White Chocolate Mocha", "Cramel Latte", "Caffe Americano", "Cappuccino", "Espresso Truffle", "Espresso con Panna", "Peppermint Mocha Twist"
	};

	private static final String[] priceValues = {
			"2.25", "1.5", "3.0", "3.3", "4.5", "3.6", "3.8", "2.5", "5.0", "1.75", "3.25", "4.0"
	};

	@Override
	public List<ProductVo> selectProductList(ProductVo productVo) {
        List<ProductVo> data = new ArrayList<>();
        
        for (int i = 0; i < 100; i++) {
            int productindex = (int)Math.floor(Math.random() * productNames.length);
            float price = Float.parseFloat(priceValues[productindex]);
            int quantity = 1 + (int)Math.round(Math.random() * 10);

            ProductVo oneProductVo = new ProductVo();
            oneProductVo.setFirstName(firstNames[(int)Math.floor(Math.random() * firstNames.length)]);
            oneProductVo.setLastName(lastNames[(int)Math.floor(Math.random() * lastNames.length)]);
            oneProductVo.setProductName(productNames[productindex]);
            oneProductVo.setPriceValue(price);
            oneProductVo.setQuantity(quantity);
            oneProductVo.setTotal(price * quantity);

            data.add(oneProductVo);
        }
		
		return data;
	}
}
