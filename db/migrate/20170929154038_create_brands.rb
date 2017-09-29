class CreateBrands < ActiveRecord::Migration[5.1]
  def change
    create_table(:brands) do |t|
      t.column(:name, :string)
      t.column(:price, :string)

      t.timestamp()
    end
  end
end
