(1..50).each do |i|
    Aquarium.create(
      name: "テスト水族館#{i}",
      introduction: "テスト番号#{i}。水族館の説明文が入ります。",
      address: "テスト県テスト市テスト#{i}-#{i}",
      official: "test.fake-official_url#{i}"
    )
  end
