class Animal
  attr_accessor :name, :animal_type, :sex, :city, :age

  def initialize(name:, animal_type:, sex:, city:, age:)
    @name = name
    @animal_type = animal_type
    @sex = sex
    @city = city
    @age = age
  end

  def self.all
    response = Faraday.get('http://localhost:4000/api/v1/animals')
    animals = []
    if response.status == 200
      animals_data = JSON.parse(response.body)
      animals_data.each do |animal|
        animals << Animal.new(name: animal['name'], animal_type: animal['animal_type'], sex: animal['sex'], city: animal['city'], age: animal['age'])
      end
    end
    animals
  end
end