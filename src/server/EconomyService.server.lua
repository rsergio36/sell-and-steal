local Players = game:GetService("Players")

local function sellInventory(player)
	local value = player:GetAttribute("InventoryValue") or 0
	if value <= 0 then
		return 0
	end

	local cash = player:GetAttribute("Cash") or 0
	player:SetAttribute("Cash", cash + value)
	player:SetAttribute("InventoryValue", 0)
	return value
end

local sellEvent = Instance.new("RemoteEvent")
sellEvent.Name = "SellInventory"
sellEvent.Parent = game:GetService("ReplicatedStorage")

sellEvent.OnServerEvent:Connect(function(player)
	sellInventory(player)
end)
