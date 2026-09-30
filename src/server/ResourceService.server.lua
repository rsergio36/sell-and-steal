local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Config = require(ReplicatedStorage:WaitForChild("Shared"):WaitForChild("Config"))

local pickupEvent = Instance.new("RemoteEvent")
pickupEvent.Name = "CollectResource"
pickupEvent.Parent = ReplicatedStorage

local lastPickup = {}

pickupEvent.OnServerEvent:Connect(function(player, rarity)
	if typeof(rarity) ~= "string" then
		return
	end

	local data = Config.Rarities[rarity]
	if not data then
		return
	end

	local now = os.clock()
	if lastPickup[player] and now - lastPickup[player] < Config.PickupCooldown then
		return
	end
	lastPickup[player] = now

	local inventoryValue = player:GetAttribute("InventoryValue") or 0
	local capacity = player:GetAttribute("Capacity") or Config.StartingCapacity

	if inventoryValue >= capacity then
		return
	end

	player:SetAttribute("InventoryValue", inventoryValue + data.Value)
end)

Players.PlayerRemoving:Connect(function(player)
	lastPickup[player] = nil
end)
