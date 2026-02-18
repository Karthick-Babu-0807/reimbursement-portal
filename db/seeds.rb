puts "Cleaning database..."
Bill.destroy_all
Employee.destroy_all
Department.destroy_all
User.destroy_all

puts "Creating Departments..."
departments = [
  "Engineering",
  "DevOps",
  "Quality Assurance",
  "Product Management",
  "IT Support",
  "Security"
]

departments.each do |name|
  Department.find_or_create_by!(name: name)
end

puts "Creating Admin User..."
User.create!(
  name: "Super Admin",
  email: "admin@test.com",
  password: "Password@123",
  role: :admin
)

puts "Success! 
Departments created: #{Department.count}
Admin Login: admin@test.com / Password@123"
