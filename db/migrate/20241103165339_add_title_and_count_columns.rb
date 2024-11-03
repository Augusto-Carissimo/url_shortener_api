class AddTitleAndCountColumns < ActiveRecord::Migration[7.0]
  def up
    add_column :links, :count, :integer, default: 1
    add_column :links, :title, :string
  end

  def down
    remove_column :links, :count, :integer
    remove_column :links, :title, :string
  end
end
