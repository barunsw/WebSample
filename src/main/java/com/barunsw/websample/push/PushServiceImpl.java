package com.barunsw.websample.push;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;

import com.barunsw.websample.vo.PushVo;

/**
 * 웹서버에서 클라이언트로 push하기 위한 Service 구현
 * @author 배수현
 *
 */
@Service
public class PushServiceImpl implements PushService {
	private final static String DESTINATION = "/topic/event";
	/**
	 * 메시지 전송 template
	 */
	private final transient SimpMessagingTemplate template;
	
	/**
	 * 생성자
	 * @param template
	 */
	@Autowired
	public PushServiceImpl(final SimpMessagingTemplate template) {
		this.template = template;
	}

	@Override
	public void push(final PushVo pushVo) {
		template.convertAndSend(DESTINATION, pushVo);
	}

}
