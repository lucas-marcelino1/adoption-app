require 'rails_helper'

describe 'User access adoption' do
  it 'successfuly' do
    adoptions_data = File.read(Rails.root.join('spec/support/adoption/adoptions.json'))
    adoption_data = File.read(Rails.root.join('spec/support/adoption/adoption.json'))
    response_adoptions = double('faraday_response', status: 200, body: adoptions_data)
    response_adoption = double('faraday_response', status: 200, body: adoption_data)
    allow(Faraday).to receive(:get).with('http://localhost:4000/api/v1/adoptions').and_return(response_adoptions)
    allow(Faraday).to receive(:get).with('http://localhost:4000/api/v1/adoptions/1').and_return(response_adoption)

    visit(root_path)
    click_on('Acessar adoção')

    expect(page).to have_content("Adote a capivara")
    expect(page).to have_content("Encontrei esta capivara na minha lavação.")
    expect(page).to have_content("Roberson")
    expect(page).to have_content("1.5")
    expect(page).to have_content("Capivara")
    expect(page).to have_content("Macho")
    expect(page).to have_content("Lucas")
    expect(page).to have_content("Blumenau")

  end
end