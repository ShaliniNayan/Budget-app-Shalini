# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :update, :destroy, to: :modify

    can :modify, Category, user_id: user.id
    can :modify, Group, author_id: user.id

    can :create, Category
    can :create, Group
  end
end
