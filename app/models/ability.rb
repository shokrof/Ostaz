class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
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
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities


   user ||= User.new 
   if user.role   
      can :read , AccountType , :id => user.role.role_can_view.collect{|a| a.account_type_id }	 
      can :manage , AccountType , :id => user.role.role_can_edit.collect{|a| a.account_type_id }	 
      can :read ,Role , :id => user.role.id

      can :read ,Account , :id => user.role.role_can_view.collect{ |a| a.account_type.accounts.collect{|t| t.id} }.flatten
      can :manage ,Account , :id => user.role.role_can_edit.collect{ |a| a.account_type.accounts.collect{|t| t.id} }.flatten
     
      if user.role.name == "admin"
        can :manage ,User
        can :create ,AccountType
        can :manage , Role
      end
  end

   
  end
end
