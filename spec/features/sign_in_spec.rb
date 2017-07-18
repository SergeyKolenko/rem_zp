require 'rails_helper'

describe "the sign in process", type: :feature do
  let!(:role_simple_user) { FactoryGirl.create(:simple_user) }
  let!(:role_agency_director) { FactoryGirl.create(:agency_director) }
  let!(:role_realtor) { FactoryGirl.create(:realtor) }

  it 'sig up simple user' do
    visit '/user/sign_in'
    click_on 'simple_users'
    visit '/user/sign_up'
    within 'form' do
      fill_in 'user_first_name', with: 'Vasya'
      fill_in 'user_last_name', with: 'Petrov'
      fill_in 'user_email', with: 'user@example.com'
      fill_in 'user_password', with: 'password1'
      fill_in 'user_password_confirmation', with: 'password1'
      fill_in 'user_phone', with: '063-111-33-22'
    end
    click_on 'sign_up'
    expect(User.last.email == 'user@example.com')
  end

  it 'sig up realtor' do
    visit '/user/sign_in'
    click_on 'realtors'
    visit '/user/sign_up'
    within 'form' do
      fill_in 'user_first_name', with: 'Vasya'
      fill_in 'user_last_name', with: 'Petrov'
      fill_in 'user_email', with: 'user@example.com'
      fill_in 'user_password', with: 'password1'
      fill_in 'user_password_confirmation', with: 'password1'
      fill_in 'user_phone', with: '063-111-33-22'
    end
    click_on 'sign_up'
    expect(User.last.email == 'user@example.com')
  end

  # it 'sig up agency_director' do
  #   visit '/user/sign_in'
  #   click_on 'agency_directors'
  #   visit '/user/sign_up'
  #   within 'form' do
  #     fill_in 'user_first_name', with: 'Vasya'
  #     fill_in 'user_last_name', with: 'Petrov'
  #     fill_in 'user_email', with: 'user@example1.com'
  #     fill_in 'user_password', with: 'password1'
  #     fill_in 'user_password_confirmation', with: 'password1'
  #     fill_in 'user_phone', with: '099-999-99-99'
  #
  #     fill_in 'user_owned_agency_attributes_name', with: 'Vasya666'
  #     fill_in 'user_owned_agency_attributes_postal_address', with: '6942213'
  #     fill_in 'user_owned_agency_attributes_phisical_address', with: 'Vasya 11'
  #     fill_in 'user_owned_agency_attributes_phone', with: '099-999-99-99'
  #   end
  #   click_on 'sign_up'
  #   expect(User.last.email == 'user@example1.com')
  # end

  it 'sign_up simple user with wrong Email' do
    visit '/user/sign_in'
    click_on 'simple_users'
    visit '/user/sign_up'
    within 'form' do
      fill_in 'user_first_name', with: 'Vas'
      fill_in 'user_last_name', with: 'Petrova'
      fill_in 'user_email', with: 'aaa@aaa.aaa'
      fill_in 'user_password', with: 'password11'
      fill_in 'user_password_confirmation', with: 'password11'
      fill_in 'user_phone', with: '063-111-33-21'
    end
    click_on 'sign_up'
    expect(User.last.email == 'aaa@aaa.aaa')
  end
end