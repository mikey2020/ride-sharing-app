class CreateUserAreas < ActiveRecord::Migration[5.1]
  def change
    create_table :user_areas do |t|
      t.belongs_to :user, index: true
      t.belongs_to :area, index: true

      t.timestamps
    end
  end
end
