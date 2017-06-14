function repeat_heat_pipe_pictures(path, name_prefix, data)
  local all_pictures = {}
  for key, t in pairs(data) do
    if t.empty then
      all_pictures[key] = { priority = "extra-high", filename = "__core__/graphics/empty.png", width = 1, height = 1 }
    else
      local tile_pictures = {}
      local sprite = {
        priority = "extra-high",
        filename = path,
        width = 124,
        height = 103,
        shift = {0.6875, -0.203125},
        scale = 2,
        hr_version =
        {
          priority = "extra-high",
          filename = path,
          width = 124,
          height = 103,
          shift = {0.6875, -0.203125},
          scale = 1,
        }
      }
      table.insert(tile_pictures, sprite)
      all_pictures[key] = tile_pictures
    end
  end
  return all_pictures
end


data:extend({
  {
    type = "item",
    name = "heat-accumulator",
    icon = "__Heat-Accumulator__/graphics/icons/heat-accumulator.png",
    flags = {"goes-to-quickbar"},
    subgroup = "energy",
    order = "f[nuclear-energy]-c[heat-accumulator]",
    place_result = "heat-accumulator",
    stack_size = 20
  },
  {
    type = "recipe",
    name = "heat-accumulator",
    enabled = false,
    ingredients = {{"steel-plate", 20}, {"copper-plate", 100}},
    result = "heat-accumulator"
  },
  {
    type = "heat-pipe", -- It's not really a heat pipe, but this entity type is the closest category I could find.
    name = "heat-accumulator",
    icon = "__Heat-Accumulator__/graphics/icons/heat-accumulator.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "heat-accumulator"},
    max_health = 200,
    corpse = "medium-remnants",
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    resistances =
    {
      {
        type = "fire",
        percent = 90
      },
      {
        type = "explosion",
        percent = 30
      },
      {
        type = "impact",
        percent = 30
      }
    },
    collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
    selection_box = {{-1, -1}, {1, 1}},
    minimum_glow_temperature = 350,
    glow_alpha_modifier = 0.6,
    heat_buffer =
    {
      max_temperature = 1000,
      specific_heat = "10MJ",
      max_transfer = "2GW",
      connections =
      {
        {
          position = {-0.5, -0.5},
          direction = defines.direction.north
        },
        {
          position = {0.5, -0.5},
          direction = defines.direction.north
        },
        {
          position = {0.5, -0.5},
          direction = defines.direction.east
        },
        {
          position = {0.5, 0.5},
          direction = defines.direction.east
        },
        {
          position = {-0.5, 0.5},
          direction = defines.direction.south
        },
        {
          position = {0.5, 0.5},
          direction = defines.direction.south
        },
        {
          position = {-0.5, -0.5},
          direction = defines.direction.west
        },
        {
          position = {-0.5, 0.5},
          direction = defines.direction.west
        }
      }
    },

    picture =
    {
      filename = "__Heat-Accumulator__/graphics/entity/heat-accumulator.png",
      priority = "extra-high",
      width = 124,
      height = 103,
      shift = {0.6875, -0.203125}
    },

    connection_sprites = repeat_heat_pipe_pictures("__Heat-Accumulator__/graphics/entity/heat-accumulator.png", "heat-pipe",
      {
        single = { name = "straight-vertical-single", ommit_number = true },
        straight_vertical = { variations = 6 },
        straight_horizontal = { variations = 6 },
        corner_right_up = { name = "corner-up-right", variations = 6 },
        corner_left_up = { name = "corner-up-left", variations = 6 },
        corner_right_down = { name = "corner-down-right", variations = 6 },
        corner_left_down = { name = "corner-down-left", variations = 6 },
        t_up = {},
        t_down = {},
        t_right = {},
        t_left = {},
        cross = { name = "t" },
        ending_up = {},
        ending_down = {},
        ending_right = {},
        ending_left = {},
      }),

    heat_glow_sprites = repeat_heat_pipe_pictures("__Heat-Accumulator__/graphics/entity/heat-accumulator.png", "heated",
      {
        single = { empty = true },
        straight_vertical = { variations = 6 },
        straight_horizontal = { variations = 6 },
        corner_right_up = { name = "corner-up-right", variations = 6 },
        corner_left_up = { name = "corner-up-left", variations = 6 },
        corner_right_down = { name = "corner-down-right", variations = 6 },
        corner_left_down = { name = "corner-down-left", variations = 6 },
        t_up = {},
        t_down = {},
        t_right = {},
        t_left = {},
        cross = { name = "t" },
        ending_up = {},
        ending_down = {},
        ending_right = {},
        ending_left = {},
      }),

    heat_glow_light = {
      --minimum_darkness = 0.3,
      color = { r = 1, g = 155/255, b = 0.05, a = 0 },
      --shift = {-0.6, 3.5},
      size = 2.5,
      intensity = 0.1,
      --add_perspective = true
    },

    circuit_wire_connection_point =
    {
      shadow =
      {
        red = {0.984375, 1.10938},
        green = {0.890625, 1.10938}
      },
      wire =
      {
        red = {0.6875, 0.59375},
        green = {0.6875, 0.71875}
      }
    },
    circuit_connector_sprites = get_circuit_connector_sprites({0.46875, 0.5}, {0.46875, 0.8125}, 26),
    circuit_wire_max_distance = 9,
    default_output_signal = {type = "virtual", name = "signal-A"}
  }
})

