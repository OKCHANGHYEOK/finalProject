package com.itbank.component;

import java.io.IOException;
import java.util.HashMap;
import java.util.Properties;
import java.util.Scanner;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Component;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

@Component
public class MailComponent {

	private final String host = "smtp.gmail.com";
	private final int port = 465;
	private String serverId = "dyuseyo";
	private String serverPw = "p h h k f m h l p q z v h b c q";
	
	private Properties props;
	
	@Value("classpath:mailForm.html")
	private Resource mailForm;
	
	@PostConstruct
	private void init() {
		props = new Properties();
	      props.put("mail.smtp.host", host);
	      props.put("mail.smtp.port", port);
	      props.put("mail.smtp.auth", "true");
	      props.put("mail.smtp.ssl.enable", "true");
	      props.put("mail.smtp.ssl.trust", host);
	}
	
	public int sendMimeMessage(HashMap<String, String> param) {
		Session mailSession = Session.getDefaultInstance(props, new Authenticator() {
			String un = serverId;
			String pw = serverPw;
			
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(un, pw);
			}
		});
		mailSession.setDebug(true);
		
		Message message = new MimeMessage(mailSession);
	    String address = param.get("address");
	    String subject = param.get("subject");
	    String content = param.get("content");
			
		try {
			message.setFrom(new InternetAddress(serverId + "@gmail.com"));   // 보내는 사람
	        message.setRecipient(Message.RecipientType.TO, new InternetAddress(address));   // 받는 사람
	        message.setSubject(subject); 
	         
	        String tag = "";
	        Scanner sc = new Scanner(mailForm.getFile());
	        while(sc.hasNextLine()) {
	        	 tag += sc.nextLine();
	        }
	        sc.close();
	        content = String.format(tag, content);
	        message.setContent(content, "text/html; charset=utf-8");

	        Transport.send(message);   
	        return 1;
			
		} catch (MessagingException | IOException e) {
			e.printStackTrace();
			return 0;
		}
		
		
		
	}
	
}
