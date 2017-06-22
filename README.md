Heat Accumulator -- A Mod for Factorio v0.15
============================================

This is a mod for a game called Factorio. It's compatible with Factorio v0.15.
This mod adds a structure to the game, which is coincidentally named as the
same as the mod itself.

![image](graphics/entity/heat-accumulator.png)

The Heat Accumulators store heat. Heat pipes stores some amount of heat too,
but their specific heat is so low that they are not too useful for energy storage.

A heat accumulator has specific heat of 10MJ, which is ten times larger than a heat pipe.
I don't know what specific heat measured in MJ means. It should have unit of
Joules per degree, but the default settings for heat pipes, heat exchangers and
nuclear reactors have that unit.
At least it is certainly ten times larger than that of heat pipe.

It is useful for regulating power load with nuclear reactors.

![Screenshot](media/screenshot.jpg)

There are some ways to store energy in Factorio.
Accumulators are obvious, but you can also store energy in steam's heat in a storage tank.
I thought there should be another way to store pure heat like accumulators for electricity.

Unfortunately there seems to be no way to obtain temperature as a circuit signal.
If I could, I could build an automated feedback loop to keep the number of active
reactor cores optimal.
Maybe I could read the temperature value of an entity every tick and output as another
signal, but it would be so inefficient to do from a script.


Comparison to other energy storages
-----------------------------------

| Structure                    | Capacity  | Derivation  |
| ---------------------------- |----------:| ----------- |
| Accumulator                  | 0.5MJ     | Written in entity description |
| Storage tank with 500C Steam | 2.4MJ     | 0.2kJ * (500C - 15C) * 25000 [\*] |
| Heat Accumulator             | 4.85MJ    | 10MJ * (500C - 15C) [\**] |

[\*] According to the Wiki (https://wiki.factorio.com/Liquids_system), a unit of fluid has a specific heat of 0.2kJ.

[\**] Assuming "specific-heat" in entity prototypes means joules per degree.

Known Issues
------------

  * You can walk on heat accumulators. This is because the structure has a type of heat pipe,
    which makes the structure walkable, ignoring collision box setting.
    I don't know if there is a way to avoid this issue.	

Further Ideas
-------------

These ideas could be implemented as mods, but it would be far more efficient if they are built into core dynamics.

  * Heat switches

    Like a power switch for electricity, a structure that dynamically connects or disconnects two heat media can be useful,
    but I don't know if I can write it efficiently with Lua.

  * Heat pumps

    The law of thermodynamics teachs that heat would never move from an object with lower temperature to higher one
    without external work.
    However, at the cost of certain amount of energy, heat can be moved from lower temperature to higher
    (The Reversed Carnot cycle in an ideal world).
    It could be useful to forcefully store heat into a buffer with limited heat capacity.

    In the real world, a method called [pumped-storage hydroelectricity](https://en.wikipedia.org/wiki/Pumped-storage_hydroelectricity)
    works in a similar way with gravitational potential energy of water for load balancing.

  * Thermometers

    If we could read a temperature of a given entity as circuit signal, we could build a dynamic control system like with
    electricity and Accumulators.
