local Players = game:GetService("Players")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "SellAndStealUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local cash = Instance.new("TextLabel")
cash.Name = "Cash"
cash.Size = UDim2.fromOffset(260, 50)
cash.Position = UDim2.fromOffset(20, 20)
cash.TextScaled = true
cash.BackgroundTransparency = 0.15
cash.Text = "Cash: 0"
cash.Parent = gui

local inventory = Instance.new("TextLabel")
inventory.Name = "Inventory"
inventory.Size = UDim2.fromOffset(260, 50)
inventory.Position = UDim2.fromOffset(20, 75)
inventory.TextScaled = true
inventory.BackgroundTransparency = 0.15
inventory.Text = "Loot: 0 / 10"
inventory.Parent = gui

local upgrade = Instance.new("TextButton")
upgrade.Name = "Upgrade"
upgrade.Size = UDim2.fromOffset(220, 55)
upgrade.Position = UDim2.new(1, -240, 1, -80)
upgrade.TextScaled = true
upgrade.Text = "UPGRADE BAG"
upgrade.Parent = gui

local buyEvent = game:GetService("ReplicatedStorage"):WaitForChild("BuyCapacity")

upgrade.Activated:Connect(function()
	buyEvent:FireServer()
end)

local function refresh()
	local cashValue = player:GetAttribute("Cash") or 0
	local lootValue = player:GetAttribute("InventoryValue") or 0
	local capacity = player:GetAttribute("Capacity") or 10

	cash.Text = "Cash: " .. cashValue
	inventory.Text = "Loot: " .. lootValue .. " / " .. capacity
end

player.AttributeChanged:Connect(refresh)
refresh()
