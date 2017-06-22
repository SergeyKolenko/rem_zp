FactoryGirl.define do
  factory :user do
    sequence(:email) { |i| "user#{i}@example.org" }
    password 'password1'
    password_confirmation { |user| user.password }
    first_name Faker::StarWars.planet
    last_name Faker::StarWars.planet
    phone '066-965-26-17'
    
    factory :user_super_admin do
      email 'super_admin@rem.zp.ua'
      role { Role.super_admin || FactoryGirl.create(:super_admin) }
    end

    factory :user_agent do
      email 'agent@rem.zp.ua'
      role { Role.agent || FactoryGirl.create(:agent) }
    end

    factory :user_agency_director do
      email 'agency_director@rem.zp.ua'
      role { Role.agency_director || FactoryGirl.create(:agency_director) }
    end

    factory :user_moderator do
      email 'moderator@rem.zp.ua'
      role { Role.moderator || FactoryGirl.create(:moderator) }
    end
  end
end
