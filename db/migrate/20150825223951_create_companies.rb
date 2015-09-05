class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :password_digest
      t.string :adress
      t.string :profile
      t.string :company_image

      t.timestamps
    end
  end
end
