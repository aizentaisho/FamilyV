Config = {}
Config.Locale = 'fr'

Config.Price = 250

Config.DrawDistance = 100.0
Config.MarkerSize   = {x = 1.5, y = 1.5, z = 1.0}
Config.MarkerColor  = {r = 102, g = 102, b = 204}
Config.MarkerType   = 1

Config.Zones = {}

Config.Shops = {
  {x=-703.776,  y=-152.258,  z=36.415},
  {x=428.694,   y=-800.106,  z=28.491},
  {x=123.646,   y=-219.440,  z=53.557}
}

for i=1, #Config.Shops, 1 do

	Config.Zones['Shop_' .. i] = {
	 	Pos   = Config.Shops[i],
	 	Size  = Config.MarkerSize,
	 	Color = Config.MarkerColor,
	 	Type  = Config.MarkerType
  }

end
