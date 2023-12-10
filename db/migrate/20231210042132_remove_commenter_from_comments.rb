class RemoveCommenterFromComments < ActiveRecord::Migration[7.1]
  def change
    change_table :comments do |t|
      t.remove :commenter
    end
  end
end
