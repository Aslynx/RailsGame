class Ability
  include CanCan::Ability

  def initialize(user)

    #Test

    can :read, :all    
    if !user.nil?  
      can :update, User, id: user.id 
      can :create, Participation
      if user.admin?  
        can :manage, :all
      end
    end
  end
end
