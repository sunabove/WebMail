package mail;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Store;
import javax.mail.URLName;

import lombok.extern.slf4j.Slf4j;
import web.SysProps;

@Slf4j

public class MailService {

	private Session session;
	private Store store;
	private Folder folder;
	
	/** POP으로는 이 소스가 동작하지 않습니다. **/

	// hardcoding protocol and the folder
	private String protocol = "imaps";
	private String host = "imap.gmail.com";
	private int port = 993 ; 
	
	private String file = "INBOX";
	
	public static void main(String[] args) throws Exception {
		SysProps sysProps = new SysProps();
		
		String id = sysProps.getProperty( "mail.id" );// change accordingly
		String pass = sysProps.getProperty( "mail.password" );// change accordingly

		MailService mailService = new MailService();
		
		mailService.login(id, pass);
		int messageCount = mailService.getMessageCount();
		
		log.debug( "messageCount = " + messageCount );

		// just for tutorial purpose
		if (messageCount > 5) { 
			messageCount = 5;
		}
		Message[] messages = mailService.getMessages();
		for (int i = 0; i < messageCount; i++) {
			String subject = "";
			if (messages[i].getSubject() != null) {
				subject = messages[i].getSubject();
			}
			
			log.debug( "subject = " + subject );
			Address[] fromAddress = messages[i].getFrom();
		}
	}
	
	public boolean isLoggedIn() {
		return store.isConnected();
	}

	/**
	 * to login to the mail host server
	 */
	public void login(String username, String password) throws Exception {
		URLName url = new URLName(protocol, host, port, file, username, password);

		if (session == null) {
			Properties props = null;
			try {
				props = System.getProperties();
			} catch (SecurityException sex) {
				props = new Properties();
			}
			
			props.put("mail.pop3.starttls.enable", "true");
			
			session = Session.getInstance(props, null);
		}
		store = session.getStore(url);
		store.connect();
		folder = store.getFolder(url);

		folder.open(Folder.READ_WRITE);
	}

	/**
	 * to logout from the mail host server
	 */
	public void logout() throws MessagingException {
		folder.close(false);
		store.close();
		store = null;
		session = null;
	}

	public int getMessageCount() {
		int messageCount = 0;
		try {
			messageCount = folder.getMessageCount();
		} catch (MessagingException me) {
			me.printStackTrace();
		}
		return messageCount;
	}

	public Message[] getMessages() throws MessagingException {
		return folder.getMessages();
	}

}