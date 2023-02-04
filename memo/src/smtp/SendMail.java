package smtp;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.HashMap;
import java.util.Map;

public class SendMail {
	public static void sending(String id, String name) {
		Map<String,String> emailInfo = new HashMap<>();
		emailInfo.put("from", "a41924250@gmail.com");
		emailInfo.put("to", id);
		emailInfo.put("subject", "가입을 축하합니다.");
		emailInfo.put("content", name + "님 가입해주셔서 감사합니다.");
		emailInfo.put("format", "text/plain;charset=UTF-8"); //메일의 형식을 일단 text로 고정
		
		try{
			GoogleSMTP smtpServer = new GoogleSMTP(); //메일 전송 객체 설정
			smtpServer.emailSending(emailInfo);
		} catch(Exception e){
			e.printStackTrace();
		}
	}
}
