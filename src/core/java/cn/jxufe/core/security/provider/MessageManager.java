package cn.jxufe.core.security.provider;

public class MessageManager {
	public static Message exception(Exception ex,String errorCode){
		Message m=new Message();
		m.setExName(ex.getMessage());
		m.setExDetails(ex.toString());
		m.setErrorCode(errorCode);
		m.setStatusCode(errorCode);
		return m;
	}
}
