# frozen_string_literal: true

class Comment < ApplicationRecord
  include Visible
  belongs_to :author, class_name: 'User'
  belongs_to :parent, polymorphic: true
  has_many :comments, as: :parent
  validates :body, presence: true

  def root
    if parent.respond_to? :root
      parent.root
    else
      parent
    end
  end
end
