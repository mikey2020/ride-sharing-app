class CreateInterests < ActiveRecord::Migration[5.1]
  def change
    create_table :interests do |t|
      t.belongs_to :user, index: true
      t.belongs_to :ride, index: true

      t.timestamps
    end
  end
end
