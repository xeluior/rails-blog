class RemoveArticleFromComments < ActiveRecord::Migration[7.1]
  def change
    remove_reference :comments, :article
  end
end
