Config.Jobs.reporter = {
	BlipInfos = {
		Sprite = 416,
		Color = 47,
		Job = "reporter"
	},
	Vehicles = {
		Truck = {
			Spawner = 1,
			Hash = "rumpo",
			Trailer = "none",
			HasCaution = true
		}
	},
	Zones = {
		VehicleSpawner = {
			Pos   = { x = -141.41, y = -620.80, z = 167.82 },
			Size  = {x = 2.0, y = 2.0, z = 0.2},
			Color = {r = 204, g = 204, b = 0},
			Marker= 1,
			Blip  = true,
			Name  = "Le Maclerait Libéré",
			Type  = "vehspawner",
			Spawner = 1,
			Hint  = "Appuyez sur ~INPUT_PICKUP~ pour descendre au garage.",
			Caution = 300
		},

		VehicleSpawnPoint = {
			Pos   = { x = -149.32023620605, y = -592.17163085938, z = 31.42448425293 },
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker= -1,
			Blip  = false,
			Name  = "Véhicule de fonction",
			Type  = "vehspawnpt",
			Spawner = 1,
			Heading = 200.1
		},

		VehicleDeletePoint = {
			Pos   = { x = -144.2229309082,  y = -577.02972412109, z = 31.42448425293 },
			Size  = {x = 5.0, y = 5.0, z = 0.2},
			Color = {r = 255, g = 0, b = 0},
			Marker= 1,
			Blip  = false,
			Name  = "Supression du véhicule",
			Type  = "vehdelete",
			Hint  = "Appuyez sur ~INPUT_PICKUP~ pour rendre le véhicule.",
			Spawner = 1,
			Caution = 300,
			GPS = 0,
			Teleport = { x = -139.09838867188, y = -620.74865722656, z = 167.82052612305 }
		}
	}
}