class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :customer_name
      t.string :customer_mail
      t.integer :satisfaction_rating
      t.integer :shipping_rating
      t.integer :products_quality_rating
      t.integer :order_id
      t.text :comment

      t.timestamps
    end
  end
end
