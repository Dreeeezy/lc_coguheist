

Config = {} -- 

Config.progressBars 	= false 					

Config.TruckRobbery = {

	cooldown = 120,						-- set cooldown time in minutes, before a player can start a job again

	police = {	-- police settings
		minCops = 0,					-- required police online for players to do jobs
		notify = true,					-- Notify Cops on blowing the truck
		blip = {						-- Alert Blip:
			show = true,				-- Show Blip:
			time = 30,					-- Miliseconds that blip is active on map (this value is multiplied with 4 in the script)
			radius = 50.0,				-- Radius of the alert blip
			alpha = 250,				-- Alpha of the alert blip
			color = 5					-- Blip color
		}
	},

	computer = {  -- job settings (where u start the job)
		pos = {2329.42, 2952.68, 47.16, 90.01},		-- pos for computer to hack
		blip = {enable = false, sprite = 47, display = 4, scale = 0.65, color = 5, label = 'Van'},
		draw = {text = Lang['job_draw_text'], dist = 3.0},		-- draw text and distance to draw 
		mHacking = {enable = true, blocks = 4, seconds = 40, duration = 3.5},	-- mhacking enable, amount of blocks, seconds to hack, and progBar wait timer
		keybind = 38,									-- Key to interact with computer - DEFAULT [E]
		fees = {amount = 100, bankMoney = false},		-- fees amount and use bankMoney or not?
		anim = {dict = 'random@train_tracks', lib = 'idle_e'}	-- anim for computer interaction
	},

	truckBlip = {sprite = 616, color = 5, display = 2, scale = 0.70, label = 'Van'},	-- blip for the spawned truck entity

	rob = {
		detonateTimer = 18, 					-- time until bomb is detonated
		takeLootTimer = 30, 					-- time spent to loot the truck
		bag_prop = 'prop_cs_heist_bag_02',		-- prop name for bag prop.
		enableMoneyBag = false					-- Enable or disable player wearing a 'heist money bag' after the robbery:
	},

	reward = {
		money = {dirty = false, min = 0, max = 1}, -- dirty money or cash, min amunt and max amount of cash.
		items = {
			enable = true,			-- enable/disable item rewards
			list = {
				[1] = {item = 'acidobenzoico', min = 0, max = 1, chance =6 },
				[2] = {item = 'bicarbonato', min = 0, max = 1, chance = 6},
				[3] = {item = 'mdma', min = 0, max = 1, chance = 6 },
				[4] = {item = 'compostoquimico', min = 0, max = 1, chance = 6 },
				[5] = {item = 'prometazina', min = 0, max = 1, chance = 6 },
				[6] = {item = 'xarope', min = 0, max = 1, chance = 6 },
				[7] = {item = 'acidolisergico', min = 0, max = 1, chance = 6 },
				[8] = {item = 'clavicepspurpurea', min = 0, max = 1, chance = 6 },
				[9] = {item = 'querosene', min = 0, max = 1, chance = 6 },
				[10] = {item = 'folhadecoca', min = 0, max = 1, chance = 6 },
				[11] = {item = 'pastabase', min = 0, max = 1, chance = 6 },
				[12] = {item = 'opio', min = 0, max = 1, chance = 6 },
				[13] = {item = 'eter', min = 0, max = 1, chance = 6 },
				[14] = {item = 'etanol', min = 0, max = 1, chance = 6 },
				[15] = {item = 'cloretodeetila', min = 0, max = 1, chance = 6 },
				[16] = {item = 'papoulas', min = 0, max = 1, chance = 6 },
				-- add more items here or change the existing ones. Make sure to add items into database!!!
			}
		}
	}

}

-- Truck Spawn Locations:
Config.TruckSpawns = {
	[1] = {
		pos = {3627.6,3759.87,28.52},
		inUse = false,
		security = {
			[1] = {ped = 'mp_f_meth_01', seat = -1, weapon = 'WEAPON_TACTICALRIFLE'},
			[2] = {ped = 'mp_f_meth_01', seat = 0, weapon = 'WEAPON_TACTICALRIFLE'},
			[3] = {ped = 's_m_m_chemsec_01', seat = 1, weapon = 'WEAPON_TACTICALRIFLE'},
			[4] = {ped = 's_m_m_chemsec_01', seat = 2, weapon = 'WEAPON_TACTICALRIFLE'},
			[5] = {ped = 's_m_m_chemsec_01', seat = 3, weapon = 'WEAPON_TACTICALRIFLE'},
			[6] = {ped = 's_m_m_chemsec_01', seat = 4, weapon = 'WEAPON_TACTICALRIFLE'},
		},
	},
	[2] = {
		pos = {1694.41,4935.58,42.08},
		inUse = false,
		security = {
			[1] = {ped = 'mp_f_meth_01', seat = -1, weapon = 'WEAPON_TACTICALRIFLE'},
			[2] = {ped = 'mp_f_meth_01', seat = 0, weapon = 'WEAPON_TACTICALRIFLE'},
			[3] = {ped = 's_m_m_chemsec_01', seat = 1, weapon = 'WEAPON_TACTICALRIFLE'},
			[4] = {ped = 's_m_m_chemsec_01', seat = 2, weapon = 'WEAPON_TACTICALRIFLE'},
			[5] = {ped = 's_m_m_chemsec_01', seat = 3, weapon = 'WEAPON_TACTICALRIFLE'},
			[6] = {ped = 's_m_m_chemsec_01', seat = 4, weapon = 'WEAPON_TACTICALRIFLE'},
		},
	},
	[3] = {
		pos = {80.83,3614.44,39.72},
		inUse = false,
		security = {
			[1] = {ped = 'mp_f_meth_01', seat = -1, weapon = 'WEAPON_TACTICALRIFLE'},
			[2] = {ped = 'mp_f_meth_01', seat = 0, weapon = 'WEAPON_TACTICALRIFLE'},
			[3] = {ped = 's_m_m_chemsec_01', seat = 1, weapon = 'WEAPON_TACTICALRIFLE'},
			[4] = {ped = 's_m_m_chemsec_01', seat = 2, weapon = 'WEAPON_TACTICALRIFLE'},
			[5] = {ped = 's_m_m_chemsec_01', seat = 3, weapon = 'WEAPON_TACTICALRIFLE'},
			[6] = {ped = 's_m_m_chemsec_01', seat = 4, weapon = 'WEAPON_TACTICALRIFLE'},
		},
	},
	[4] = {
		pos = {71.71,6634.45,31.78},
		inUse = false,
		security = {
			[1] = {ped = 'mp_f_meth_01', seat = -1, weapon = 'WEAPON_TACTICALRIFLE'},
			[2] = {ped = 'mp_f_meth_01', seat = 0, weapon = 'WEAPON_TACTICALRIFLE'},
			[3] = {ped = 's_m_m_chemsec_01', seat = 1, weapon = 'WEAPON_TACTICALRIFLE'},
			[4] = {ped = 's_m_m_chemsec_01', seat = 2, weapon = 'WEAPON_TACTICALRIFLE'},
			[5] = {ped = 's_m_m_chemsec_01', seat = 3, weapon = 'WEAPON_TACTICALRIFLE'},
			[6] = {ped = 's_m_m_chemsec_01', seat = 4, weapon = 'WEAPON_TACTICALRIFLE'},
		},
	},
	[5] = {
		pos = {-3046.99,598.51,7.46},
		inUse = false,
		security = {
			[1] = {ped = 'mp_f_meth_01', seat = -1, weapon = 'WEAPON_TACTICALRIFLE'},
			[2] = {ped = 'mp_f_meth_01', seat = 0, weapon = 'WEAPON_TACTICALRIFLE'},
			[3] = {ped = 's_m_m_chemsec_01', seat = 1, weapon = 'WEAPON_TACTICALRIFLE'},
			[4] = {ped = 's_m_m_chemsec_01', seat = 2, weapon = 'WEAPON_TACTICALRIFLE'},
			[5] = {ped = 's_m_m_chemsec_01', seat = 3, weapon = 'WEAPON_TACTICALRIFLE'},
			[6] = {ped = 's_m_m_chemsec_01', seat = 4, weapon = 'WEAPON_TACTICALRIFLE'},
		},
	},
}

