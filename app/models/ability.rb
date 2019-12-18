class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :update, :destroy, :to => :modify

    user ||= User.new

    if user.role?(:admin)
      can :manage, :all
    elsif user.role?(:moderator)
      can [:create, :read, :update], Project
    elsif user.role?(:user)
      can :read, Project
    end
  end
end
