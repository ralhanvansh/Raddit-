class ChangeTypeToRole < ActiveRecord::Migration[5.1]
  def change
    rename_column(:users, :type, :role)
  end
end
