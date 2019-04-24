class RemoveStringFromAuthors < ActiveRecord::Migration[5.2]
  def change
    remove_column :authors, :string, :string
  end
end
