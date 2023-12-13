class AddParentToComments < ActiveRecord::Migration[7.1]
  def change
    add_reference :comments, :parent, polymorphic: true
  end
end
