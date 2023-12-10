class AddAuthorToArticle < ActiveRecord::Migration[7.1]
  def change
    add_reference :articles, :author, null: false, foreign_key: { to_table: :users }, default: 1
  end
end
