class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :name
      t.string :content
      t.string :question_url

      t.timestamps
    end
  end
end
