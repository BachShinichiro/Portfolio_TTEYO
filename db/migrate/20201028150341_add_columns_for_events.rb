class AddColumnsForEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :period_end, :date
    add_column :events, :company_name, :string
    add_column :events, :place, :string
    add_column :events, :price, :integer
    add_column :events, :direction, :string
  end
end
