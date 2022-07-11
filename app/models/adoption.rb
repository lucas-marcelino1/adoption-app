class Adoption
  attr_accessor :id, :title, :description, :animal_type, :animal_name, :age, :sex, :pet_care, :city

  def initialize(id: nil, title:, description:, animal_type:, animal_name:, age:, sex:, pet_care:, city:)
    @id = id
    @title = title
    @description = description
    @animal_type = animal_type
    @animal_name = animal_name
    @age = age
    @sex = sex
    @pet_care = pet_care
    @city = city
  end

  def self.all
    adoptions = []
    response = Faraday.get('http://localhost:4000/api/v1/adoptions')
    if response.status == 200
      data = JSON.parse(response.body)
      data.each do |adoption|
        adoptions << Adoption.new(id: adoption["id"], title: adoption['title'], animal_type: adoption['animal_type'],
                                  description: adoption['description'], animal_name: adoption['animal_name'], age: adoption['age'],
                                  sex: adoption['sex'], pet_care: adoption['user_pet_care'], city: adoption['city'])
      end
    end
    adoptions
  end

end