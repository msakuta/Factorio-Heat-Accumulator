
script.on_configuration_changed(function(data)
	if data.mod_changes ~= nil and data.mod_changes["Heat-Accumulator"] ~= nil and data.mod_changes["Heat-Accumulator"].old_version == nil then
		-- Update enabled state for all existing forces if they have Nuclear Power technology researched.
		for i,f in pairs(game.forces) do
			nuclear_tech = f.technologies["nuclear-power"]
			if nuclear_tech.researched then
				f.recipes["heat-accumulator"].enabled = true
			end
		end
		data.mod_changes["Heat-Accumulator"].old_version = "0.1.0"
	end
end)

