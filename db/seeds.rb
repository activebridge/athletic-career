unless Rails.env.production?
  (1..5).each do |i|
    puts 'Categories was successfully created'
    Category.create(
      title: "Вид_#{i}",
      visible: true
    )
  end

  (1..5).each do |i|
    puts 'Lengths was successfully created'
    Length.create(
      title: "Дистанция_#{i}",
      visible: true
    )
  end

  (1..5).each do |i|
    puts 'Organizers was successfully created'
    Organizer.create(
      title: "Организатор_#{i}",
      visible: true
    )
  end
end
