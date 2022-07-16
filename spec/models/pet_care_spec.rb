require 'rails_helper'

RSpec.describe PetCare, type: :model do
  describe '#valid?' do
    it 'CPF format' do
      user = PetCare.create(name: 'Lucas', city: 'Blumenau', email: 'lucas@email.com', password: '12345678', cpf: '1478748977')
      result = user.valid?
      expect(result).to eq(false)
    end

    it 'presence of name' do
      user = PetCare.create(name: '', city: 'Blumenau', email: 'lucas@email.com', password: '12345678', cpf: '11483432963')
      result = user.valid?
      expect(result).to eq(false)
    end

    it 'presence of city' do
      user = PetCare.create(name: 'Lucas', city: '', email: 'lucas@email.com', password: '12345678', cpf: '11483432963')
      result = user.valid?
      expect(result).to eq(false)
    end
  end
end
