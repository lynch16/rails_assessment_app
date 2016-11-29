class CreateSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :skills do |t|
      t.string :name
      t.belongs_to :workshop
      t.timestamps
    end
  end
end
