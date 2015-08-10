# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(username: mikal, email: admin@thispage.com, password: jumbalaya)
Description.create(user_id: 1, content: "There is no excuse for being Kanye in a post Katrina world.", parent: true, active: true)
