# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

seed_file = File.join Rails.root, 'db', 'seed.yml'
config    = YAML::load_file seed_file

Charity.delete_all
Charity.create config["charities"]

Page.delete_all
Page.create config["pages"]
