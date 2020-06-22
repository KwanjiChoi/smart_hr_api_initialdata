require './initialize.rb'

def set_gender
  num = rand(2)
  gender = num > 0 ? 'male' : 'female'
end
def set_header
  {
    "Content-Type": "application/json" ,
    "Authorization": "Bearer #{KEY}"
  }
end
def set_params
  params = {
    "last_name" => Faker::Name.last_name,
    "first_name"=> Faker::Name.first_name,
    "gender" => set_gender,
    "email" => Faker::Internet.email
  }
end
