local Say = "/say"

function Webhook(message,userName,userProfile)
	local HS = game:GetService("HttpService")
	local WebhookURL = ""
	--Replace your link with the link in the Quotes.

	local MessageData = {
		["content"] = tostring(message),
		["username"] = tostring(userName),
		["avatar_url"] = tostring(userProfile)}

	MessageData = HS:JSONEncode(MessageData)
	--We used JSON Encode to convert the Lua Table into a Json String 

	HS:PostAsync(WebhookURL,MessageData)
end

function getUserPFP(player)
	--Thumbnail making
	local Players = game:GetService("Players")
	--Get thumbnail
	local ID = player.UserId
	local Type = Enum.ThumbnailType.HeadShot
	local Size = Enum.ThumbnailSize.Size150x150
	local content, ready = Players:GetUserThumbnailAsync(ID,Type,Size)
	print(content)
	print(ready)
	print(player.Name)
	return content
end

game.Players.PlayerAdded:Connect(function(player)
	player.Chatted:Connect(function(msg)
		if string.find(msg, Say) then
			local Picture = getUserPFP(player)
			Webhook(tostring(msg):gsub(Say,""),player.Name,Picture)
		end
	end)
end)