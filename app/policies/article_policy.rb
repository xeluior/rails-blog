# frozen_string_literal: true

class ArticlePolicy < ApplicationPolicy
  include PrivateOrAuthor
end
