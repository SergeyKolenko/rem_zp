require 'rails_helper'

describe "the sign in process", type: :feature do
  let!(:role_simple_user) { FactoryGirl.create(:simple_user) }
  let!(:role_agency_director) { FactoryGirl.create(:agency_director) }
  let!(:role_realtor) { FactoryGirl.create(:realtor) }
  let!(:role1) { FactoryGirl.build(:simple_user) }
  let!(:user_valid) { FactoryGirl.build(:user, role: role1) }

  it 'sig out simple user' , js: true do
    visit '/user/sign_in'
    within 'form' do
      # fill_in 'user_email', with: 'eegeg@jjj.com'
      # fill_in 'user_password', with: '123456'
      fill_in 'user_email', with: user_valid.email
      fill_in 'user_password', with: user_valid.password
    end
    click_on 'Login'
    expect(page).to have_content 'Signed in successfully.'
    expect(page).to have_content 'Sign out'
    click_on 'Sign out'
    visit '/user/sign_out'
    expect(page).to have_content 'Прежде чем продолжить, вам нужно войти в систему или зарегистрироваться.'
  end

  # it 'sig out simple user', js: true do
  #   visit '/user/sign_in'
  #   click_on 'simple_users'
  #   within 'form' do
  #     fill_in 'user_first_name', with: 'Vasya'
  #     fill_in 'user_last_name', with: 'Petrov'
  #     fill_in 'user_email', with: 'user@example.com'
  #     fill_in 'user_password', with: 'password1'
  #     fill_in 'user_password_confirmation', with: 'password1'
  #     fill_in 'user_phone', with: '063-111-33-22'
  #   end
  #   click_on 'Sign up'
  #   expect(page).to have_content 'Welcome!'
  #   click_on 'Sign out'
  #   expect(page).to have_content 'Прежде чем продолжить, вам нужно войти в систему или зарегистрироваться.'
  # end

end