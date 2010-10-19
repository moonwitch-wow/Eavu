-- Cuz shit breaks when I forget this:
EavuDB = { }

EavuDB["general"] = {
	["uiscale"] = 0.85, -- set your value (between 0.64 and 1) of your uiscale if autoscale is off
}

EavuDB["media"] = {
	["font"] = [[Fonts\FRIZQT__.ttf]], -- general font of Eavu
	["blank"] = [[Interface\AddOns\Eavu\media\blank]], -- the main texture for all borders/panels
	["bordercolor"] = { .6,.6,.6,1 }, -- border color of Eavu panels
	["backdropcolor"] = { .1,.1,.1,1 }, -- background color of Eavu panels
}

EavuDB["datatext"] = { -- is location of .. 4/5 should be on the same spot :P
	["fps_ms"] = 6, -- show fps and ms on panels
	["mem"] = 7, -- show total memory on panels
	["bags"] = 9, -- show space used in bags on panels
	["gold"] = 8, -- show your current gold on panels
	["guild"] = 1, -- show number on guildmate connected on panels
	["dur"] = 2, -- show your equipment durability on panels.
	["friends"] = 3, -- show number of friends connected.
	["dps_text"] = 4, -- show a dps meter on panels
	["hps_text"] = 5, -- show a heal meter on panels
	["fontsize"] = 12, -- font size for panels.
}

EavuDB["panels"] = { 
	["width"] = 400,
	["height"] = 30,
}