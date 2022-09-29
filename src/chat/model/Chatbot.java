package chat.model;

public class Chatbot
{
	private String username;
	private String chatbotName;
	
	public Chatbot(String chatbotName)
	{
		this.chatbotName = chatbotName;
		this.username = "";
	}
	
	
	public String processText(String input)
	{
		String output = input;
		return output;
	}
}
