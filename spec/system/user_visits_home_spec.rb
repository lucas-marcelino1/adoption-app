require 'rails_helper'

describe 'User view adoptions' do
  it 'successfuly' do
    adoption_json = File.read(Rails.root.join('spec/support/adoption/adoptions.json'))
    fake_response = double("faraday_response", status: 200, body: adoption_json)
    allow(Faraday).to receive(:get).with('http://localhost:4000/api/v1/adoptions').and_return(fake_response)

    visit(root_path)
    
    expect(page).to have_content('Me adota aí')
    expect(page).to have_content('Adote a capivara')
    expect(page).to have_content('Encontrei esta capivara na minha lavação.')
    expect(page).to have_content('Blumenau')
  end

  it 'and dont has no one adoption' do
    fake_response = double("faraday_response", status: 200, body: '[]')
    allow(Faraday).to receive(:get).with('http://localhost:4000/api/v1/adoptions').and_return(fake_response)

    visit(root_path)

    expect(page).to have_content("Não há adoções disponíveis.")
  end

  it 'and connection with adoption registering app fails' do
    visit(root_path)

    expect(page).to have_content('A conexão com o sistema de adoções não aconteceu!')
  end
end