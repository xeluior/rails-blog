# frozen_string_literal: true

class CommentPolicy < ApplicationPolicy
  include PrivateOrAuthor
end
