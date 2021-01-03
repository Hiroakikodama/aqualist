# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env == 'development'
  (1..50).each do |i|
    Aquarium.create(
      name: "テスト水族館#{i}",
      introduction: "テスト番号#{i}。水族館の説明文が入ります。",
      address: "テスト県テスト市テスト#{i}-#{i}",
      official: "test.fake-official_url#{i}"
    )
  end
end
