# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Static content', type: :system do
  let(:login_test) { Faker::Internet.username }
  let(:password_test) { Faker::Internet.password }

  # сценарий успешной регистрации
  scenario 'signin up' do
    visit root_path # переходим на страницы ввода
    find('#sign_up_link').click # нажимаем на кнопку с id="aut_button"
	  fill_in :user_login, with: login_test # заполняем поле логина
	  fill_in :user_password, with: password_test # заполняем поле пароля
    
    find('#reg_submit').click
    
    
    fill_in :numb, with: 100
    find('#check_button').click

	# ожидаем найти в контенере вывода правильное содержимое
	expect(find("#val_1")).to have_text '100'
    expect(find("#val_2")).to have_text '101'
    expect(find('#hip')).to have_text 'Для числа 100 гипотеза подтверждена'
  end

  scenario 'without login' do
    visit root_path
    visit lab_input_path

    expect(response).to eq(nil)
  end


end