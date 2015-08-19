class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.references :user, index: true
      t.references :event, index: true, null: false
      t.string :comment, null: false

      t.timestamps
    end
  end
end
