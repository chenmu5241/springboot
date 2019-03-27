package net.newglobe.app.controller;

import java.io.IOException;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;
import java.util.concurrent.atomic.AtomicInteger;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

/**
 * @ServerEndpoint 注解是一个类层次的注解，它的功能主要是将目前的类定义成一个websocket服务器端,
 *                 注解的值将被用于监听用户连接的终端访问URL地址,客户端可以通过这个URL来连接到WebSocket服务器端
 */
@ServerEndpoint("/websocket")
public class WebSocketClient {
	
	private static final AtomicInteger connectionIds = new AtomicInteger(0);
	// 定义一个集合，用于保存所有接入的WebSocket客户端
	private static final Set<WebSocketClient> clientSet = new CopyOnWriteArraySet<>();
	// 定义一个成员变量，记录WebSocket客户端的聊天昵称
	private String nickname;
	// 定义一个成员变量，记录与WebSocket之间的会话
	private Session session;

//	public WebSocketClient() {
//		nickname = GUEST_PREFIX + connectionIds.get();
//	}

	// 当客户端连接进来时自动激发该方法
	@OnOpen
	public void start(Session session) throws Exception{
		//得到spring bean的办法
//		SysAccountDao sysAccountDao = (SysAccountDao) ContextLoader.getCurrentWebApplicationContext().getBean("sysAccountDao");
//		List<SysAccount> selectAll = sysAccountDao.selectAll();

		String username = java.net.URLDecoder.decode(session.getQueryString(),"UTF-8");
		this.closeRepeatclient(username);
		this.nickname = username;
		this.session = session;
		// 将WebSocket客户端会话添加到集合中
		clientSet.add(this);
		String message = String.format("【%s %s】", nickname, "加入了聊天室！");
		// 发送消息
		broadcast(message);
		connectionIds.getAndIncrement();
		System.out.println(message);
	}

	// 当客户端断开连接时自动激发该方法
	@OnClose
	public void end() {
		clientSet.remove(this);
		String message = String.format("【%s %s】", nickname, "离开了聊天室！");
		// 发送消息
		broadcast(message);
		System.out.println(message);
		connectionIds.decrementAndGet();
	}

	// 每当收到客户端消息时自动激发该方法
	@OnMessage
	public void incoming(String message) {
		String filteredMessage = String.format("%s: %s", nickname, filter(message));
		// 发送消息
		broadcast(filteredMessage);
		System.out.println(filteredMessage);
	}

	// 当客户端通信出现错误时，激发该方法
	@OnError
	public void onError(Throwable t) throws Throwable {
		System.out.println("WebSocket服务端错误 " + t);
	}

	// 实现广播消息的工具方法
	private static void broadcast(String msg) {
		// 遍历服务器关联的所有客户端
		for (WebSocketClient client : clientSet) {
			try {
				synchronized (client) {
					// 发送消息
					client.session.getBasicRemote().sendText(msg);
				}
			} catch (IOException e) {
				System.out.println("聊天错误，向客户端 " + client + " 发送消息出现错误。");
				clientSet.remove(client);
				try {
					client.session.close();
				} catch (IOException e1) {
				}
				String message = String.format("【%s %s】", client.nickname, "已经被断开了连接。");
				broadcast(message);
			}
		}
	}

	// 定义一个工具方法，用于对字符串中的HTML字符标签进行转义
	private static String filter(String message) {
		if (message == null)
			return null;
		char content[] = new char[message.length()];
		message.getChars(0, message.length(), content, 0);
		StringBuilder result = new StringBuilder(content.length + 50);
		for (int i = 0; i < content.length; i++) {
			// 控制对尖括号等特殊字符进行转义
			switch (content[i]) {
			case '<':
				result.append("&lt;");
				break;
			case '>':
				result.append("&gt;");
				break;
			case '&':
				result.append("&amp;");
				break;
			case '"':
				result.append("&quot;");
				break;
			default:
				result.append(content[i]);
			}
		}
		return (result.toString());
	}
	
	
	private void closeRepeatclient(String username) {
		// 遍历服务器关联的所有客户端,重复登录客户端会被踢掉
		for (WebSocketClient client : clientSet) {
			try {
				synchronized (client) {
					if(username.equals(client.nickname)){
						clientSet.remove(client);
						client.session.getBasicRemote().sendText("已在别处登录，链接关闭！");
						client.session.close();
					}
				}
			} catch (IOException e) {
			}
		}
	}
	
}
