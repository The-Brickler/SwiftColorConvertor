package chat.controller;

import chat.model.Chatbot;
import java.util.Scanner;

public class Controller
{
	private Chatbot chatbot;
	private Scanner keyboardInput;
	
	
	public Controller()
	{
		this.chatbot = new Chatbot();
		this.keyboardInput = new Scanner(System.in);
	}
	
	public void start()
	{
		
		
		
		
		keyboardInput.close();
	}
	
	private String interactWithChatbot(String text)
	{
		String result = "";
		
		return result;
	}
}
