class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.integer :report_id
      t.date :purchase_date
      t.decimal :cost, precision: 8, scale: 2
      t.string :title
      t.text :justification

      t.timestamps
    end
  end
end
