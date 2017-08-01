require 'rails_helper'

describe "the sign in process", type: :feature do
  let!(:role_simple_user) { FactoryGirl.create(:simple_user) }
  let!(:role_agency_director) { FactoryGirl.create(:agency_director) }
  let!(:role_realtor) { FactoryGirl.create(:realtor) }

  # it 'sig up simple user' do
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
  #   visit '/user/sign_in'
  #   expect(page).to have_content 'Welcome!'
  #   expect(User.last.email == 'user@example.com')
  # end
  #
  # it 'sig up realtor' do
  #   visit '/user/sign_in'
  #   click_on 'realtors'
  #   visit '/user/sign_up'
  #   within 'form' do
  #     fill_in 'user_first_name', with: 'Vasya'
  #     fill_in 'user_last_name', with: 'Petrov'
  #     fill_in 'user_email', with: 'user@example.com'
  #     fill_in 'user_password', with: 'password1'
  #     fill_in 'user_password_confirmation', with: 'password1'
  #     fill_in 'user_phone', with: '063-111-33-22'
  #   end
  #   click_on 'Sign up'
  #   expect(User.last.email == 'user@example.com')
  # end

  # let!(:agency_director) { FactoryGirl.create(:user_agency_director) }
  # let!(:other_user) { FactoryGirl.create(:user_moderator) }
  # let!(:region) { FactoryGirl.create(:region) }
  # let!(:city) { FactoryGirl.build(:city, region: region) }
  # let!(:agency) { FactoryGirl.build(:agency, director: agency_director, regions: [region], cities: [city]) }

  it 'sig up agency_director' , js: true do
    visit '/user/sign_in'
    click_on 'agency_director'
    within 'form' do
      fill_in 'user_first_name', with: 'Vasya1'
      fill_in 'user_last_name', with: 'Petrov1'
      fill_in 'user_email', with: 'user@example1.com'
      fill_in 'user_password', with: 'password1'
      fill_in 'user_password_confirmation', with: 'password1'
      fill_in 'user_phone', with: '099-999-99-99'
      # fill_in 'user_role', with: 2

      fill_in 'user_owned_agency_attributes_name', with: 'Agency'
      fill_in 'user_owned_agency_attributes_postal_address', with: '6942213'
      fill_in 'user_owned_agency_attributes_phisical_address', with: 'Street 11'
      fill_in 'user_owned_agency_attributes_phone', with: '099-999-99-90'

      # select('Zaporizhzhia', from: 'select2')
      # select('Zaporizhzhia', from: 'Cities')

      # find('#user_owned_agency_attributes_region_ids').click
      # find('option', text: 'Zaporizhzhia').click

      # find(:select, from, options).find(:option, value, options).select_option
      # find('#user_owned_agency_attributes_region_ids').find('options', 'Zaporizhzhia', 'options[7]').select_option
      find('#user_owned_agency_attributes_region_ids').find('option', 'options[7]').select_option

      p '='*50
      end
    click_on 'Sign up'
    expect(page).to have_content 'Welcome!'
  end

  # it 'sign up simple user with wrong Email' do
  #   visit '/user/sign_in'
  #   click_on 'simple_users'
  #   visit '/user/sign_up'
  #   within 'form' do
  #     fill_in 'user_first_name', with: 'Vas'
  #     fill_in 'user_last_name', with: 'Petrova'
  #     fill_in 'user_email', with: 'aaa@aaa.aaa'
  #     fill_in 'user_password', with: 'password11'
  #     fill_in 'user_password_confirmation', with: 'password11'
  #     fill_in 'user_phone', with: '063-111-33-21'
  #   end
  #   click_on 'Sign up'
  #   expect(User.last.email == 'aaa@aaa.aaa')
  # end
end