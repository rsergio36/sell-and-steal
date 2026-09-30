local ReplicatedStorage = game:GetService("ReplicatedStorage")

local collectEvent = ReplicatedStorage:WaitForChild("CollectResource")
local sellEvent = ReplicatedStorage:WaitForChild("SellInventory")

-- Temporary keyboard controls for the first playable prototype.
-- E = collect Common loot, F = sell inventory.
local UserInputService = game:GetService("UserInputService")

UserInputService.InputBegan:Connect(function(input, processed)
	if processed then
		return
	end

	if input.KeyCode == Enum.KeyCode.E then
		collectEvent:FireServer("Common")
	elseif input.KeyCode == Enum.KeyCode.F then
		sellEvent:FireServer()
	end
end)
