package com.fullcalendar.service;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@ServerEndpoint("/booking.do")
public class BookingEndpoint {
	//使用者清單
	static Set<Session> USERS =Collections.synchronizedSet( new HashSet<Session>());//ConcurrentModificationException


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
		
		System.out.println("Received message from session:"+ session.getId()+": "+message);
//		Gson很方便 可以事先設定內容格式
		/*
		Gson gson = new GsonBuilder()
//				.setDateFormat("yyyy-MM-dd'T'HH:mm:ssZ")// 我的時間格式 從fullcalendar撈出來的沒這麼多
				.setDateFormat("yyyy-MM-dd'T'HH:mm")	// ●●●請參考: http://stackoverflow.com/questions/14796195/gson-unparseable-date
				.setPrettyPrinting()
				.create();
		
		*/
		/**
		 * 通知所有訂閱者
		 */
		for(Session users:USERS){
			try {
				
				// -- Interface RemoteEndpoint.Basic
//				users.getBasicRemote().sendText(gson.toJson(message));
				/**
				 * 只要不是自己就要通知
				 */
				if(!(session.getId().equals(users.getId()))){
					users.getBasicRemote().sendText(message);
				}
//				if(("User_"+session.getId()+": "+message).length()>25)
////					users.getBasicRemote().sendText("User_"+session.getId()+": "+message+"<p>"+"<p>");
//				else{
//					users.getBasicRemote().sendText("User_"+session.getId()+": "+message+"<p>");
//				}
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
