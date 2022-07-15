require 'rails_helper'

describe 'User adopt animal' do
  it 'successfuly' do
    adoptions_data = File.read(Rails.root.join('spec/support/adoption/adoptions.json'))
    adoption_data = File.read(Rails.root.join('spec/support/adoption/adoption.json'))
    adoptions_response = double("faraday_response_adoptions", status: 200, body: adoptions_data)
    adoption_response = double("faraday_response_adoption", status: 200, body: adoption_data)
    allow(Faraday).to receive(:get).with('http://localhost:4000/api/v1/adoptions').and_return(adoptions_response)
    allow(Faraday).to receive(:get).with('http://localhost:4000/api/v1/adoptions/1').and_return(adoption_response)

    visit(root_path)
    click_on('Acessar adoção')
    click_on('Adotar Roberson')

    expect(page).to have_content('Animal adotado com sucesso! Esperamos que você e Roberson sejam muito felizes.')
  end
end