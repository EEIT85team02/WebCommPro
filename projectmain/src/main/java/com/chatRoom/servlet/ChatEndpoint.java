package com.chatRoom.servlet;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/chat.do")
public class ChatEndpoint {
	
	//使用者清單
	static Set<Session> USERS =Collections.synchronizedSet( new HashSet<Session>());//ConcurrentModificationException
	static Set<String> USERSNAME =Collections.synchronizedSet( new HashSet<String>());
	static Map<Session,String> USERSMAP =Collections.synchronizedMap(( new LinkedHashMap<Session,String>()));
	

	//開啟連線
	@OnOpen
	public void  onOpen(Session session){
		session.setMaxIdleTimeout(-1);
		System.out.println("Session"+ session.getId()+" connected");//記住每個連線 (session)
		//加入清單
		USERS.add(session);
	}

	//一但有人發言 -- 準備廣播
	@OnMessage
	public void onMessage(Session session, String message){
//		USERSMAP.keySet().add(session);
//		USERSMAP.put(session, message);
//		System.out.println("Received message from session:"+ session.getId()+": "+message);
//		System.out.println("message.startsWith(\"CLOSE\")"+message.startsWith("CLOSE"));
//		System.out.println("message.startsWith(\"ONLINE\")"+message.startsWith("ONLINE"));
//		System.out.println("message.split(\":\")[0].equals(\"CLOSE\")"+message.split(":")[0].equals("CLOSE"));
//		System.out.println("message.split(\":\")[0].equals(\"ONLINE\")"+message.split(":")[0].equals("ONLINE"));
		
		
		String [] msgArray = message.split(":");
		if(msgArray[0].equals("CLOSE")){
			System.out.println("Received message from session:\n"+ session.getId()+": "+msgArray[1]);
			USERSNAME.remove(msgArray[1]);
		}else if(msgArray[0].equals("ONLINE")){
			System.out.println("Received message from session:\n"+ session.getId()+": "+msgArray[1]);
			// 紀錄名字
			USERSNAME.add(msgArray[1]);
		}else{
			System.out.println("Received message from session:\n"+ session.getId()+": "+message);
			USERSNAME.add("GUEST");
		}
		
		
		
		for(Session users:USERS){
			try {
				/*
				 */
				StringBuffer strBuilder = new StringBuffer();
				for(String str:USERSNAME){
					strBuilder.append(",").append(str);
				}
				
//				System.out.println("USERSNAME.toArray()[0]=====");
//				String [] stuList = USERSNAME.toArray(new String[0]);
				
//				for(String str:stuList){
//					
//				}
				users.getBasicRemote().sendText(strBuilder.toString());
				// -- Interface RemoteEndpoint.Basic 
				/*
				if(("User_"+session.getId()+": "+message).length()>25){
					users.getBasicRemote().sendText("User_"+session.getId()+": "+message+"<p>"+"<p>");
				}
				else{
					users.getBasicRemote().sendText("User_"+session.getId()+": "+message+"<p>");
				}
				*/
			} catch (IOException e) {
				USERS.remove(users);
				try{
					users.close();
				}catch(IOException e1){
					
				}
				
				
				
				e.printStackTrace();
			}
		}
	}

	//關閉連線
	@OnClose
	public void onClode(Session session){
		USERS.remove(session);
		System.out.println("Session"+session.getId()+" removed.");
	}


}
