local Players = game:GetService("Players")

local function setupPlayer(player)
	if player:GetAttribute("Cash") == nil then
		player:SetAttribute("Cash", 0)
	end
	if player:GetAttribute("Capacity") == nil then
		player:SetAttribute("Capacity", 10)
	end
	if player:GetAttribute("InventoryValue") == nil then
		player:SetAttribute("InventoryValue", 0)
	end
end

Players.PlayerAdded:Connect(setupPlayer)

for _, player in Players:GetPlayers() do
	setupPlayer(player)
end
