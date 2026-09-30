local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

local world = Workspace:WaitForChild("SellAndStealWorld")
local market = world:WaitForChild("Market")

local shop = Instance.new("Part")
shop.Name = "UpgradeShop"
shop.Size = Vector3.new(10, 6, 8)
shop.Position = market.Position + Vector3.new(20, 4, 0)
shop.Anchored = true
shop.Material = Enum.Material.Metal
shop.Parent = world

local prompt = Instance.new("ProximityPrompt")
prompt.ActionText = "Mejorar mochila"
prompt.ObjectText = "UPGRADE SHOP"
prompt.HoldDuration = 0
prompt.MaxActivationDistance = 10
prompt.Parent = shop

prompt.Triggered:Connect(function(player)
	local event = ReplicatedStorage:WaitForChild("BuyCapacity")
	event:FireServer()
end)
