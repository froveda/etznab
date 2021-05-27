# frozen_string_literal: true

# Services table create migration
class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.string :name
      t.datetime :date
      t.string :card_type
      t.string :provider
      t.float :amount
      t.integer :payment_count
      t.string :payment_batch
      t.string :payment_coupon
      t.integer :receipt_number
      t.integer :credit_card_last_digits
    end
  end
end
