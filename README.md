# Architect test

OOP test for Makers Academy Week 3. The task was to create a model of an airport that allows it to land or release planes (dependent on htere being random good weather). There's no real interface other than screwing around in irb, but here's how everything works anyway.

## How it works

### Planes

A Plane can be flying or landing. That's enough for it, so it should be enough for you.

### Weather

The Weather module allows a class to check whether the weather is stormy or sunny. There's currently a one in ten chance of it being stormy.

### Airport

An Airport comes with plane storage of a certain capacity (though this'll break in Rubies under 2.1.0 as it uses named arguments). You can attempt to land a plane (dependent on the weather and the available plane storage), or launch a plane (dependent on the weather). Exactly like the real thing.
