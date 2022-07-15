require 'rails_helper'

describe 'User visits home and register' do
  it 'successfuly' do
    adoptions_data = File.read(Rails.root.join('spec/support/adoption/adoptions.json'))
    response_adoptions = double('faraday_response', status: 200, body: adoptions_data)
    allow(Faraday).to receive(:get).with('http://localhost:4000/api/v1/adoptions').and_return(response_adoptions)

    visit(root_path)
    click_on('Log in')
    click_on('Registre-se')
    fill_in('Nome', with: 'Lucas')
    fill_in('E-mail', with: 'lucas@email.com')
    fill_in('Cidade', with: 'Blumenau')
    fill_in('CPF', with: '114.834.329-63')
    fill_in('Senha', with: '12345678')
    fill_in('Confirme sua senha', with: '12345678')
    click_on('Registrar')

    expect(page).to have_content('Bem-vindo! Você se registrou com sucesso.')
  end
end