return {
    gymNPC = {
        pedname = "a_m_y_clubcust_04", -- Name of the Ped
        pedhash = 0xE2210515, -- Hash Code for the Ped
        pedspawn = vector4(-1255.53, -354.77, 35.96, 296.64) --  Spawn for the Gym Membership Seller NPC
    },

    gymPass = {
        price = 1250, -- Price for the Gym Membership
        item = "gym_pass", -- The Item Name for the Gym Membership
        moneyType = 'cash'
    },

    skills = {
        treadmills = {
            skill = 'Stamina', -- The Type of Skill
            amount = math.random(0, 1),  -- The amount of skill rep you gain
            stress = math.random(5, 9), -- GainStress -- You Can set the amount of Stress you gain here
            progressbarDuration = math.random(1000, 2500), -- This is the duration for the progressbar
        },

        chinups = {
            skill = 'Strength', -- The Type of Skill
            amount = math.random(0, 2),  -- The amount of skill rep you gain
            stress = math.random(5, 9), -- GainStress -- You Can set the amount of Stress you gain here
            progressbarDuration = math.random(6000, 12000), -- This is the duration for the progressbar
        },

        liftweights = {
            skill = 'Strength', -- The Type of Skill
            amount = math.random(0, 2),  -- The amount of skill rep you gain
            stress = math.random(5, 9), -- GainStress -- You Can set the amount of Stress you gain here
            progressbarDuration = math.random(6000, 12000), -- This is the duration for the progressbar
        },

        yoga = {
            skill = 'Stamina', -- The Type of Skill
            amount = math.random(0, 0),  -- The amount of skill rep you gain
            stress = math.random(15, 20), --RelieveStress -- You Can set the amount of Stress you relieve here
            progressbarDuration = math.random(7000, 12000), -- This is the duration for the progressbar
        },
    },

    -- Dont Touch the following
    treadmillLocs = {
        { coords = vector3(-1257.55, -366.77, 36.96) },
        { coords = vector3(-1259.0, -367.58, 36.96) },
        { coords = vector3(-1260.41, -368.4, 36.96) },
        { coords = vector3(-1261.93, -369.09, 36.96) },
        { coords = vector3(-1263.23, -369.84, 36.96) },
        { coords = vector3(-1264.67, -370.58, 36.96) },
    }
}