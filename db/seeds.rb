if !User.exists?(email: ENV["ADMIN_EMAIL"])
  User.create!(
    email: ENV["ADMIN_EMAIL"], 
    password: ENV["ADMIN_PASS"], 
    password_confirmation: ENV["ADMIN_PASS"],
    user_type: 101
  )

  p "Seeded Data Successfully"
end

eventCategory = [
  {'title': 'Christian Life Program'},
  {'title': 'Teaching Night'},
  {'title': 'Chapter Prayer Assembly'},
  {'title': 'Conference'},
  {'title': 'Other'}
]

eventCategory.collect do |ec|
  if !EventCategory.exists?(:title => ec[:title])
    EventCategory.create!('title': ec[:title])

    p "Seeded Data Successfully"
  end
end