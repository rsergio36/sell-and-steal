local Config = {}

Config.StartingCash = 0
Config.StartingCapacity = 10
Config.PickupCooldown = 0.5
Config.SellMultiplier = 1

Config.Rarities = {
	Common = {Value = 1},
	Uncommon = {Value = 2},
	Rare = {Value = 5},
	Epic = {Value = 12},
	Legendary = {Value = 30},
	Mythic = {Value = 100},
	Secret = {Value = 500},
}

return Config
