class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
    elsif user.employer?
      can :create, Job
      can :manage, Job, user_id: user.id
      can :manage, Application, job: { user_id: user.id }
      can :read, Application
    elsif user.customer?
      can :read, Job
      can :create, Application
      can :manage, Application, user_id: user.id
    else
      can :read, Job
    end
  end
end
