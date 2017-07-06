class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    case user.role_name
      when 'super_admin'
        can :manage, :all
      when 'moderator'
        can :read, :all
        can :manage, [Category, Region, City, District, Option, Type]
        can :ban, :update, User
      when 'agency_director'
        can :manage, [Agency, Proposal, OptionValue]
        can :manage, User, id: user.id
        can :read, [Category, Region, City, District, Type]
      when 'agent' || 'realtor'
        can :manage, Proposal
        can :manage, User, id: user.id
        can :read, [Category, Region, City, District, Type]
      when 'simple_user'
        can :manage, Proposal
        can :manage, User, id: user.id
      else
        can :read, [Proposal, Option, Agency]
    end
  end
end
