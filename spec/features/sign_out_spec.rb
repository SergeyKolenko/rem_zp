require 'rails_helper'

describe "the sign in process", type: :feature do
  let!(:role_simple_user) { FactoryGirl.create(:simple_user) }
  let!(:role_agency_director) { FactoryGirl.create(:agency_director) }
  let!(:role_realtor) { FactoryGirl.create(:realtor) }
  let!(:user_valid) { FactoryGirl.create(:user, role: role_simple_user, confirmed_at: Time.now) }

  it 'sig out simple user' , js: true do
    visit '/user/sign_in'
    within 'form' do
      fill_in 'user_email', with: user_valid.email
      fill_in 'user_password', with: user_valid.password
    end
    click_on 'Login'
    click_on 'Выйти'
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end

  it 'sig out simple user with wrong email' , js: true do
    visit '/user/sign_in'
    p user_valid
    within 'form' do
      fill_in 'user_email', with: user_valid.email
      fill_in 'user_password', with: 'shshshrsdh'
    end
    click_on 'Login'
    expect(page).to have_content 'Invalid Email or password.'
  end
end