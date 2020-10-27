class AddNameProfileToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :client, :boolean, default: false
  end
end
