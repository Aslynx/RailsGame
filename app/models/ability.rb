class Ability
  include CanCan::Ability

  def initialize(user)

    can :read, :all    
    if !user.nil?  
      can :update, User, id: user.id 
      if user.admin?  
        can :manage, :all
      end
    end
  end
end
