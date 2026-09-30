local ReplicatedStorage = game:GetService("ReplicatedStorage")

local buyCapacity = Instance.new("RemoteEvent")
buyCapacity.Name = "BuyCapacity"
buyCapacity.Parent = ReplicatedStorage

buyCapacity.OnServerEvent:Connect(function(player)
	local cash = player:GetAttribute("Cash") or 0
	local capacity = player:GetAttribute("Capacity") or 10
	local cost = capacity * 10

	if cash < cost then
		return
	end

	player:SetAttribute("Cash", cash - cost)
	player:SetAttribute("Capacity", capacity + 5)
end)
