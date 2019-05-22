package com.barunsw.websample.push;

import com.barunsw.websample.vo.PushVo;

/**
 * 웹서버에서 클라이언트로 push하기 위한 Service Interface
 * @author 배수현
 *
 */
public interface PushService {
	/**
	 * push 메소드
	 * @param pushVo
	 */
	public void push(final PushVo pushVo);
}
