# frozen_string_literal: true

class CommentPolicy < ApplicationPolicy
  def destroy?
    record.author == user
  end
end
