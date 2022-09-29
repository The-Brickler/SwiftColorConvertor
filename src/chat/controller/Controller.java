package chat.controller;

import chat.model.Chatbot;
import java.util.Scanner;

public class Controller
{
	private Chatbot chatbot;
	private Scanner keyboardInput;
	
	
	public Controller()
	{
		this.chatbot = new Chatbot("Super smart chatbot");
		this.keyboardInput = new Scanner(System.in);
	}
	
	public void start()
	{
		System.out.println("What do you want tot say to the chatbot?");
		String userText = keyboardInput.nextLine();
		
		while (!userText.equalsIgnoreCase("shutdown"))
		{
			String chatbotResponse = interactWithChatbot(userText);
			System.out.println("Chatbot says:");
			System.out.println(chatbotResponse);
			
			userText = keyboardInput.nextLine();
		}
		
		
		
		keyboardInput.close();
	}
	
	private String interactWithChatbot(String text)
	{
		String result = "";
		
		result = chatbot.processText(text);
		
		return result;
	}
}
