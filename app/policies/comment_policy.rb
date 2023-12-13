class CommentPolicy < ApplicationPolicy
  def destroy?
    record.author == user
  end
end
