-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

Config = {}

Config.checkForUpdates = false -- Check for Updates?

Config.Elevators = {
    -- PillboxElevatorNorth = { -- Elevator name(Doesn't show it's just to name table)
    --     [1] = {
    --         coords = vec3(332.37, -595.56, 43.28), -- Coords, if you're new; last number is heading
    --         heading = 70.65, -- Heading of how will spawn on floor
    --         title = 'Floor 2', -- Title 
    --         description = 'Main Floor', -- Description
    --         target = { -- Target length/width
    --             width = 5,
    --             length = 4
    --         },
    --         groups = {-- Job locks
    --             'police',
    --             'ambulance'
    --         },
    --     },
    --     [2] = {
    --         coords = vec3(344.31, -586.12, 28.79), -- Coords, if you're new; last number is heading
    --         heading = 252.84,
    --         title = 'Floor 1',
    --         description = 'Lower Floor',
    --         target = {
    --         width = 5,
    --         length = 4
    --         } -- Example without group
    --     },
    -- },



        LSPDVINEWOOD = { -- Elevator name(Doesn't show it's just to name table)
        [1] = {
            coords = vector3(565.68, 4.93, 103.23), -- Coords, if you're new; last number is heading
            heading = 252.84,
            title = 'Tầng thượng',
            description = '',
            target = {
                width = 5,
                length = 4
            } -- Example without group
        },
        [2] = {
            coords = vector3(624.8, 1.25, 82.63), -- Coords, if you're new; last number is heading
            heading = 70.65, -- Heading of how will spawn on floor
            title = 'Trung tâm', -- Title 
            description = '', -- Description
            target = { -- Target length/width
                width = 5,
                length = 4
            },
        },
    },
}