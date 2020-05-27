class RemoveUserIdFromCocktails < ActiveRecord::Migration[5.2]
  def change
    remove_column :cocktails, :user_id, :integer
  end
end
