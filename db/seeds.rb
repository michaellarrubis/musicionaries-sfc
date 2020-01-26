user = User.find_by_email("admin_sfc@mailinator.com")
if !user.present?
  User.create!(
    email: "admin_sfc@mailinator.com", 
    password: "admin_sfc", 
    password_confirmation: "admin_sfc",
    user_type: 101
  )
end

EventCategory.create!([
  {'title': 'Christian Life Program'},
  {'title': 'Teaching Night'},
  {'title': 'Chapter Prayer Assembly'},
  {'title': 'Conference'},
  {'title': 'Other'}
])