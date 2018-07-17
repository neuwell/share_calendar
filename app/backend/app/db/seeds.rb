# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Schedule.create(
  [
    {id_hash: 'hash1', title: 'test1', year: '2000', month: '04' ,description: 'April news', contents: [{}, {text: 'test'}, {}]},
    {id_hash: 'hash2', title: 'test2', year: '2000', month: '05' ,description: 'May news', contents: [{}, {text: 'test'}, {}]},
    {id_hash: 'hash3', title: 'test3', year: '2000', month: '06' ,description: 'June news', contents: [{}, {text: 'test'}, {}]}
  ]
)
