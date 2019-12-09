package org.bandtracker.hibernate.entity;

public class Message {
	
	int messageId;
	String messageText;
	String messageDatetime;
	
	public Message() {
		
	}
	
	public Message(int messageId, String messageText, String messageDatetime) {
		super();
		this.messageId = messageId;
		this.messageText = messageText;
		this.messageDatetime = messageDatetime;
	}
	public int getMessageId() {
		return messageId;
	}
	public void setMessageId(int messageId) {
		this.messageId = messageId;
	}
	public String getMessageText() {
		return messageText;
	}
	public void setMessageText(String messageText) {
		this.messageText = messageText;
	}
	public String getMessageDatetime() {
		return messageDatetime;
	}
	public void setMessageDatetime(String messageDatetime) {
		this.messageDatetime = messageDatetime;
	}
	
}
