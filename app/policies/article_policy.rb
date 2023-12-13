class ArticlePolicy < ApplicationPolicy
  def index?
    true
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
