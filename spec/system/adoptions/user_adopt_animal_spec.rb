require 'rails_helper'

describe 'User adopt animal' do
  it 'successfuly' do
    pet_care = PetCare.create!(name: 'Lucas', city: 'Blumenau', email: 'lucas@email.com', password: '123456789', cpf: '12345678999')
    adoptions_data = File.read(Rails.root.join('spec/support/adoption/adoptions.json'))
    adoption_data = File.read(Rails.root.join('spec/support/adoption/adoption.json'))
    adopt_data = File.read(Rails.root.join('spec/support/adoption/adopt.json'))
    adoptions_response = double("faraday_response_adoptions", status: 200, body: adoptions_data)
    adoption_response = double("faraday_response_adoption", status: 200, body: adoption_data)
    adopt_response = double("faraday_response_adopt", status: 200, body: adopt_data)
    allow(Faraday).to receive(:get).with('http://localhost:4000/api/v1/adoptions').and_return(adoptions_response)
    allow(Faraday).to receive(:get).with('http://localhost:4000/api/v1/adoptions/1').and_return(adoption_response)
    allow(Faraday).to receive(:patch).with('http://localhost:4000/api/v1/adoptions/1/adopt').and_return(adopt_response)

    login_as(pet_care, :scope => :pet_care)
    visit(root_path)
    click_on('Acessar adoção')
    click_on('Adotar Roberson')

    expect(page).to have_content('Animal adotado com sucesso! Esperamos que você e Roberson sejam muito felizes.')
  end
end