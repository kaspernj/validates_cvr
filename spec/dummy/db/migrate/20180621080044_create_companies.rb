class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :vat_number
      t.timestamps
    end
  end
end
