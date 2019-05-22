package com.barunsw.websample.sample;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.barunsw.websample.vo.AddressVo;

@Service
public class SampleServiceImpl implements SampleService {
	private final SampleDao sampleDao;
	
	@Autowired
	public SampleServiceImpl(final SampleDao sampleDao) {
		this.sampleDao = sampleDao;
	}
	
	@Override
	public List<AddressVo> selectList(AddressVo addressVo) {
		// TODO Auto-generated method stub
		return sampleDao.selectList(addressVo);
	}
}
