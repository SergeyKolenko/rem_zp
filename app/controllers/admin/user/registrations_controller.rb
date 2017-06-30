class Admin::User::RegistrationsController < Devise::RegistrationsController

  def edit
    render layout: 'admin'
  end
end