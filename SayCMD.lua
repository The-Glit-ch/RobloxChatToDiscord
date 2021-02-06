local Say = "/say"

function Webhook(message,user)
	local HS = game:GetService("HttpService")
	local WebhookURL = "https://discord.com/api/webhooks/807427211874795530/Y7zvR8z_SFJfYSg9PK7C6Y5wiNlgeKexlbsNlqgDjWTVTImJAl5_PPJQIL8hTY6_gwl5"
	--Replace your link with the link in the Quotes.

	local MessageData = {
		["content"] = message,
	}

	MessageData = HS:JSONEncode(MessageData)
	--We used JSON Encode to convert the Lua Table into a Json String 

	HS:PostAsync(WebhookURL,MessageData)
end


game.Players.PlayerAdded:Connect(function(player)
	  player.Chatted:Connect(function(msg)
		if string.find(msg, Say) then
			Webhook(tostring(msg):gsub(Say,""))
		end
	end)
end)