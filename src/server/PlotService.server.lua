local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local world = Workspace:WaitForChild("SellAndStealWorld")
local plots = {}

for _, object in ipairs(world:GetChildren()) do
	if object:IsA("BasePart") and object:GetAttribute("PlotId") then
		plots[object:GetAttribute("PlotId")] = object
	end
end

local function releasePlot(player)
	for _, plot in pairs(plots) do
		if plot:GetAttribute("OwnerUserId") == player.UserId then
			plot:SetAttribute("OwnerUserId", nil)
			plot:SetAttribute("OwnerName", nil)
		end
	end
end

local function assignPlot(player)
	for id, plot in pairs(plots) do
		if plot:GetAttribute("OwnerUserId") == nil then
			plot:SetAttribute("OwnerUserId", player.UserId)
			plot:SetAttribute("OwnerName", player.Name)
			player:SetAttribute("PlotId", id)
			return plot
		end
	end
end

Players.PlayerAdded:Connect(function(player)
	task.defer(function()
		local plot = assignPlot(player)
		if plot then
			local character = player.Character
			if character and character.PrimaryPart then
				character:PivotTo(CFrame.new(plot.Position + Vector3.new(0, 5, 0)))
			end
		end
	end)

	player.CharacterAdded:Connect(function(character)
		local id = player:GetAttribute("PlotId")
		local plot = id and plots[id]
		if plot then
			character:PivotTo(CFrame.new(plot.Position + Vector3.new(0, 5, 0)))
		end
	end)
end)

Players.PlayerRemoving:Connect(releasePlot)
