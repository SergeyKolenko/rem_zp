class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    case user.role_name
    when 'super_admin'
      can :manage, :all
    when 'moderator'
      can :read, :all
      can :manage, [Category, Region, City, District, Option, Type]
      can [:ban, :update], User
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
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
