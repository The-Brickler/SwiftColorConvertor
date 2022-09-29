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
	
	private boolean spookyChecker(String input)
	{
		boolean isSpooky = false;
		return isSpooky;
	}
	
	private String spookyResponse()
	{
		String response = "";
		return response;
	}
	
	private boolean isValidHTMLChecker(String input)
	{
		boolean isValid = false;
		return isValid;
	}
	
	private String isValidHTMLResponse()
	{
		String response = "";
		return response;
	}
	
	private String reversePronounDirection(String input)
	{
		String modifiedInput = "";
		return modifiedInput;
	}
}
