class CreateWorkshops < ActiveRecord::Migration[5.0]
  def change
    create_table :workshops do |t|
      t.belongs_to :user, index: true
      t.string :name
      t.timestamps
    end
    add_foreign_key :workshops, :users
  end
end
