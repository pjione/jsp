package smtp;

import java.util.*;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class GoogleSMTP {
	private final Properties serverInfo; //서버 정보
	private final Authenticator auth; //인증 정보
	
	public GoogleSMTP() {
		serverInfo = new Properties();
		serverInfo.put("mail.smtp.host", "smtp.gmail.com"); // 메일 서버 지정
		serverInfo.put("mail.smtp.port", "465"); //포트 번호 (거의 대부분 동일)
		serverInfo.put("mail.smtp.starttls.enable","true");
		serverInfo.put("mail.smtp.auth","true");
		serverInfo.put("mail.smtp.debug","true");
		serverInfo.put("mail.smtp.socketFactory.port","465");
		serverInfo.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
		serverInfo.put("mail.smtp.socketFactory.fallback","false");
		serverInfo.put("mail.smtp.ssl.protocols","TLSv1.2"); // 맥
		
		//사용자 인증 정보
		auth = new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("a41924250@gmail.com", "xxxx");
			}
		};
	}
	public void emailSending(Map<String,String> mailInfo) throws AddressException, MessagingException {
		//세션 생성 (네이버/다음/구글 메일 서버에 사용자 인증)
		Session session = Session.getInstance(serverInfo,auth);
		//메시지 작성(emailCheck.jsp에서 만든 객체)
		MimeMessage msg = new MimeMessage(session);
		msg.setFrom(new InternetAddress(mailInfo.get("from")));//보내는 사람
		msg.addRecipient(Message.RecipientType.TO, new InternetAddress(mailInfo.get("to")));//받는사람
		msg.setSubject(mailInfo.get("subject"));
		msg.setContent(mailInfo.get("content"),mailInfo.get("format"));
		//전송
		Transport.send(msg);
		
		
	}
}
