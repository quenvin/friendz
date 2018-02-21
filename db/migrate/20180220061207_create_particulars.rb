class CreateParticulars < ActiveRecord::Migration[5.1]
  def change
    create_table :particulars do |t|
      t.belongs_to :user, foreign_key: true
      t.string :name
      t.integer :age
      t.string :gender
      t.string :introduction
    end
  end
end
