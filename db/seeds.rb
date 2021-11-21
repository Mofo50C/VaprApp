# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


csgo = Game.create(
    title: "Counter Strike: Global Offensive",
    description: "Counter-Strike: Global Offensive (CS: GO) expands upon the team-based action gameplay that it pioneered when it was launched 19 years ago. CS: GO features new maps, characters, weapons, and game modes, and delivers updated versions of the classic CS content (de_dust2, etc.).",
    release_date: Date.new(2012, 8, 21),
    price: 0,
    discount: 0
)

dbd = Game.create(
    title: "Dead By Deadlight",
    description: "Dead by Daylight is a multiplayer (4vs1) horror game where one player takes on the role of the savage Killer, and the other four players play as Survivors, trying to escape the Killer and avoid being caught and killed.",
    release_date: Date.new(2016, 6, 14),
    price: 14.99,
    discount: 0
)

among_us = Game.create(
    title: "Among Us",
    description: "An online and local party game of teamwork and betrayal for 4-15 players...in space!",
    release_date: Date.new(2018, 11, 16),
    price: 3.99,
    discount: 0
)

dyson_sphere = Game.create(
    title: "Dyson Sphere Program",
    description: "Build the most efficient intergalactic factory in space simulation strategy game Dyson Sphere Program! Harness the power of stars, collect resources, plan and design production lines and develop your interstellar factory from a small space workshop to a galaxy-wide industrial empire.",
    release_date: Date.new(2021, 1, 21),
    price: 15.49,
    discount: 0
)

genre_action = Genre.create(
    name: "Action"
)

genre_horror = Genre.create(
    name: "Horror"
)

genre_indie = Genre.create(
    name: "Indie"
)

genre_simulation = Genre.create(
    name: "Simulation"
)

genre_strategy = Genre.create(
    name: "Strategy"
)

genre_casual = Genre.create(
    name: "Casual"
)

genre_fps = Genre.create(
    name: "FPS"
)

csgo.genres << [genre_action, genre_fps]
dbd.genres << [genre_action, genre_horror]
among_us.genres << [genre_indie, genre_casual]
dyson_sphere.genres << [genre_strategy, genre_simulation, genre_indie]

dev_valve = Developer.create(
    name: "Valve"
)

dev_hiddenpath = Developer.create(
    name: "Hidden Path Entertainment"
)

pub_valve = Publisher.create(
    name: "Valve"
)

csgo.developers << [dev_valve, dev_hiddenpath]
csgo.publishers << pub_valve

dev_innersloth = Developer.create(
    name: "Innersloth"
)

pub_innersloth = Publisher.create(
    name: "Innersloth"
)

among_us.developers << dev_innersloth
among_us.publishers << pub_innersloth

dev_behaviour = Developer.create(
    name: "Behaviour Interactive"
)

pub_behaviour = Publisher.create(
    name: "Behaviour Interactive"
)

dbd.developers << dev_behaviour
dbd.publishers << pub_behaviour

dev_dyson = Developer.create(
    name: "Youthcat Studio"
)

pub_dyson = Publisher.create(
    name: "Gamera Game"
)

dyson_sphere.developers << dev_dyson
dyson_sphere.publishers << pub_dyson
