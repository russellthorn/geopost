# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Post.create(
             [
                {
                "title" => "blog 1",
                "body" => "this is a blog etc ...."
                },
                {
                "title" => "blog 2",
                "body" => "this is another blog etc ...."
                }
              ]
  )
