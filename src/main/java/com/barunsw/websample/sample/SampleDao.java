package com.barunsw.websample.sample;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.barunsw.websample.vo.AddressVo;

@Repository
public interface SampleDao {
	public List<AddressVo> selectList(AddressVo addressVo);
}
