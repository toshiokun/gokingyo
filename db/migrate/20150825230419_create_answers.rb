class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :question, index: true
      t.references :user, index: true
      t.integer :answer_flg

      t.timestamps
    end
  end
end
