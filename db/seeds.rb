# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_1 = User.create(name: 'Will Lynch', email: 'will@mht.com', password: 'password')
user_2 = User.create(name: 'Jenna Loranger', email: 'jenna@mht.com', password: 'password')
user_3 = User.create(name: 'Dan P', email: 'dan@mht.com', password: 'password')
user_4 = User.create(name: 'Ryan R', email: 'ryan@mht.com', password: 'password')

printing = Workshop.create(name: '3D Printing', officer: user_3)
metalworking = Workshop.create(name: 'Metalworking', officer: user_2)
woodworking = Workshop.create(name: 'Woodworking', officer: user_1)

print_skill_1 = Skill.create(name: "turn machine on", workshop: printing)
print_skill_2 = Skill.create(name: "turn machine off", workshop: printing)
metal_skill_1 = Skill.create(name: "wear gloves", workshop: metalworking)
metal_skill_2 = Skill.create(name: "metal is hot", workshop: metalworking)
wood_skill_1 = Skill.create(name: "splinters hurt", workshop: woodworking)
wood_skill_2 = Skill.create(name: "Don't cut your fingers off", workshop: woodworking)

user_1.skills = [print_skill_2, print_skill_1, wood_skill_2]
user_2.skills = [metal_skill_2, metal_skill_1]
