class CreateUserSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :user_skills do |t|
      t.belongs_to :skill, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.integer :skill_level, default: 0
      t.timestamps
    end
  end
end
