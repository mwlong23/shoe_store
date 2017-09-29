class RenameJoinTableInAlphaOrder < ActiveRecord::Migration[5.1]
  def change
    drop_table :stores_brands

    create_table(:brands_stores) do |t|
      t.column(:brand_id, :integer)
      t.column(:store_id, :integer)

      t.timestamps()
    end
  end
end
