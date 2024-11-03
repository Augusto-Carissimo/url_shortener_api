class RemoveSlugColumn < ActiveRecord::Migration[7.0]
  def up
    remove_column :links, :slug
  end

  def down
    add_column :links, :slug, :string
  end
end
