require 'rails_helper'

describe 'User views all animals' do
  it 'successfuly' do
    animals_data = File.read(Rails.root.join('spec/support/animal/animals.json'))
    response_animals = double('faraday_response', status: 200, body: animals_data)
    adoption_data = File.read(Rails.root.join('spec/support/adoption/adoptions.json'))
    response_adoptions = double("faraday_response", status: 200, body: adoption_data)
    allow(Faraday).to receive(:get).with('http://localhost:4000/api/v1/adoptions').and_return(response_adoptions)
    allow(Faraday).to receive(:get).with('http://localhost:4000/api/v1/animals').and_return(response_animals)

    visit(root_path)
    click_on('Todos os animais')

    expect(page).to have_content('Todos os animais cadastrados')
    expect(page).to have_content('Melissa - Gato | Blumenau |')
    expect(page).to have_content('Tofu - Papagaio | Concórdia |')
    expect(page).to have_content('Ricardo - Cachorro | Florianópolis |')
    expect(page).to have_content('Tunico - Gato | Blumenau |')

  end
end