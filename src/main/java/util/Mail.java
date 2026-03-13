package util;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import java.util.Properties;



public class Mail {

    private final String password ="wswc dhfn imgo akle";
	private final String from = "nguyenvananhhan555@gmail.com";
	private Session session;
	
	public Mail() {
		
		Properties props = new Properties();
		props.put("mail.smtp.host","smtp.gmail.com"); // SMTP HOST
		props.put("mail.smtp.port", "587"); // TLS 587, ssl 465
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable","true");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		props.put("mail.smtp.ssl.protocols", "TLSv1.2");
	
		Authenticator auth = new Authenticator() {
			 @Override
			    protected PasswordAuthentication getPasswordAuthentication() {
			        return new PasswordAuthentication(from, password);
			    }
		};	
		
		 session = Session.getInstance(props,auth);
		
	
	}
	
	public boolean SendVerifyMail(String To, String code) {
	    Message msg = new MimeMessage(session);
	    try {
	        msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
	        msg.setFrom(new InternetAddress(from));
	        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(To));
	        msg.setSubject("Your verification code");
	        msg.setContent("<p>Hello</p>" + "\n"
	                + "<p>Your verify code is: <strong>" + code + "</strong></p>" + "\n"
	                + "<p>Please enter this code to verify your account</p>" + "\n"
	                + "<p>Best regards,</p>" + "\n" + "<p>Support team</p>", "text/html");
	        Transport.send(msg);
	        return true;
	    } catch (Exception e) {
	        System.out.println("lỗi gửi mail");
	        e.printStackTrace();
	    }
	    return false;
	}
	
}
