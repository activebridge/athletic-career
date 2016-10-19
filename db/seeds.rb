unless Rails.env.production?
  (1..5).each do |i|
    puts 'Categories was successfully created'
    Category.create(
      title: "Вид#{i}",
      visible: true
    )
  end

  Length.create(title: 'ultra', name: 'ultra', visible: true, mark: 1)
  Length.create(title: '42.2',  name: '42.2',  visible: true, mark: 2)
  Length.create(title: '21.1',  name: '21.1',  visible: true, mark: 3)
  Length.create(title: '10',    name: '10',    visible: true, mark: 4)
  Length.create(title: '5',     name: '5',     visible: true, mark: 5)
  Length.create(title: '3',     name: '3',     visible: true, mark: 6)
  Length.create(title: '1',     name: '1',     visible: true, mark: 7)

  (1..5).each do |i|
    puts 'Organizers was successfully created'
    Organizer.create(
      title: "Организатор#{i}",
      visible: true
    )
  end
end
