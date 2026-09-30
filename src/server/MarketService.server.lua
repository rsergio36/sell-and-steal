local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

local world = Workspace:WaitForChild("SellAndStealWorld")

local market = world:FindFirstChild("Market")
if not market then return end

local prompt = Instance.new("ProximityPrompt")
prompt.ActionText = "Vender Loot"
prompt.ObjectText = "MERCADO"
prompt.HoldDuration = 0
prompt.MaxActivationDistance = 12
prompt.Parent = market

local sellEvent = ReplicatedStorage:WaitForChild("SellInventory")

prompt.Triggered:Connect(function(player)
	sellEvent:FireServer()
end)
