class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :location, :string
    add_column :users, :profile, :text
  end
end
