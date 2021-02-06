local Say = "/say"

function Webhook(message)
	local HS = game:GetService("HttpService")
	local WebhookURL = "Webhook here"
	--Put your webhook in the ""

	local MessageData = {
		["content"] = message,
	}

	MessageData = HS:JSONEncode(MessageData)
    --Encode the table

	HS:PostAsync(WebhookURL,MessageData)
end


game.Players.PlayerAdded:Connect(function(player)
	  player.Chatted:Connect(function(msg)
		if string.find(msg, Say) then
			Webhook(tostring(msg):gsub(Say,""))
		end
	end)
end)