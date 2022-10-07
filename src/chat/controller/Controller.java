package chat.controller;

import chat.model.Chatbot;
import java.util.Scanner;
import chat.view.Popup;

public class Controller
{
	private Chatbot chatbot;
	private Scanner keyboardInput;
	private Popup view;
	
	public Controller()
	{
		this.chatbot = new Chatbot("Super smart chatbot");
		this.keyboardInput = new Scanner(System.in);
		this.view = new Popup();
	}
	
	public void start()
	{
		String userText = view.askQuestion("What do you want tot say to the chatbot?");
		
		while (!userText.equalsIgnoreCase("shutdown"))
		{
			String chatbotResponse = interactWithChatbot(userText);
			view.displayMessage("Chatbot says:\n" + chatbotResponse);
			
			userText = view.askQuestion("What else do you want to say?");
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
