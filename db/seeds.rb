# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

jump_force = Game.create(
    title: "JUMP FORCE",
    description: "Create your own avatar to fight alongside the most powerful Manga heroes in an original Story Mode, or head to the Online Lobby to challenge other players and discover lots of modes and activities.",
    release_date: Date.new(2019, 2, 14),
    price: 49.99,
    discount: 90
)

dbd = Game.create(
    title: "Dead By Daylight",
    description: "Dead by Daylight is a multiplayer (4vs1) horror game where one player takes on the role of the savage Killer, and the other four players play as Survivors, trying to escape the Killer and avoid being caught and killed.",
    release_date: Date.new(2016, 6, 14),
    price: 14.99
)

among_us = Game.create(
    title: "Among Us",
    description: "An online and local party game of teamwork and betrayal for 4-15 players...in space!",
    release_date: Date.new(2018, 11, 16),
    price: 3.99
)

dyson_sphere = Game.create(
    title: "Dyson Sphere Program",
    description: "Build the most efficient intergalactic factory in space simulation strategy game Dyson Sphere Program! Harness the power of stars, collect resources, plan and design production lines and develop your interstellar factory from a small space workshop to a galaxy-wide industrial empire.",
    release_date: Date.new(2021, 1, 21),
    price: 15.49
)

genre_action = Genre.create(name: "Action")
genre_horror = Genre.create(name: "Horror")
genre_indie = Genre.create(name: "Indie")
genre_simulation = Genre.create(name: "Simulation")
genre_strategy = Genre.create(name: "Strategy")
genre_casual = Genre.create(name: "Casual")
genre_fps = Genre.create(name: "FPS")
genre_fighting = Genre.create(name: "Fighting")

jump_force.genres << [genre_action, genre_fighting]
dbd.genres << [genre_action, genre_horror]
among_us.genres << [genre_indie, genre_casual]
dyson_sphere.genres << [genre_strategy, genre_simulation, genre_indie]

jump_force.developers << Developer.create(name: "Spike Chunsoft Co.")
jump_force.publishers << Publisher.create(name: "BANDAI NAMCO Entertainment")

among_us.developers << Developer.create(name: "Innersloth")
among_us.publishers << Publisher.create(name: "Innersloth")

dbd.developers << Developer.create(name: "Behaviour Interactive")
dbd.publishers << Publisher.create(name: "Behaviour Interactive")

dyson_sphere.developers << Developer.create(name: "Youthcat Studio")
dyson_sphere.publishers << Publisher.create(name: "Gamera Game")

User.create(username: "user1", email: "user1@domain", password: "Password1")
