class Adoption
  attr_accessor :id, :title, :description, :animal_id, :animal_type, :animal_name, :age, :sex, :user_pet_care, :city

  def initialize(id:, title:, description:, animal_type:, animal_id:, animal_name: nil, age: nil, sex: nil, user_pet_care: nil, city:)
    @id = id
    @title = title
    @description = description
    @animal_id = animal_id
    @animal_type = animal_type
    @animal_name = animal_name
    @age = age
    @sex = sex
    @user_pet_care = user_pet_care
    @city = city
  end

  def self.all
    adoptions = []
    response = Faraday.get('http://localhost:4000/api/v1/adoptions')
    if response.status == 200
      data = JSON.parse(response.body)
      data.each do |adoption|
        adoptions << Adoption.new(id: adoption["id"], title: adoption['title'], animal_type: adoption['animal_type'],
                                  description: adoption['description'], animal_id: adoption['animal_id'], city: adoption['city'])
      end
    end
    adoptions
  end

  def self.find(id)
    adoption = ''
    response = Faraday.get("http://localhost:4000/api/v1/adoptions/#{id}")
    if response.status == 200
      data = JSON.parse(response.body)
      adoption = Adoption.new(id: data["id"], title: data['title'], animal_id: data['animal_id'], animal_type: data['animal_type'],
        description: data['description'], animal_name: data['animal_name'], age: data['age'],
        sex: data['sex'], user_pet_care: data['user_pet_care'], city: data['city'])
    end
    adoption
  end

end