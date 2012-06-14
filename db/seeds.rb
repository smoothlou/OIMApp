# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

g = IO.readlines('db/group.txt').map {|group| group.chomp}

g.each do |group_name|
  Group.create name: group_name
  c = Group.find_or_initialize_by_name(group_name)
end
