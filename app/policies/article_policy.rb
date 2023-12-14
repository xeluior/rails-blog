# frozen_string_literal: true

class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(status: 'public').or(scope.where(author: user))
    end
  end

  def show?
    record.status != 'private' or record.author == user
  end

  def update?
    author?
  end

  def destroy?
    author?
  end

  private

  def author?
    record.author == user
  end
end
