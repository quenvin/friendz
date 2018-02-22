class AddImageToParticulars < ActiveRecord::Migration[5.1]
  def change
    add_column :particulars, :image, :string
  end
end
