nuclear_tech = data.raw.technology["nuclear-power"]
table.insert(nuclear_tech.effects, {
        type = "unlock-recipe",
        recipe = "heat-accumulator"
})
