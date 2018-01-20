class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.string :auction_name
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip
      t.integer :vehicle_year
      t.string :vehicle_make
      t.string :vehicle_model
      t.integer :vehicle_stock_number
      t.decimal :winning_bid
      t.decimal :seller_payout
      t.string :description

      t.timestamps
    end
  end
end
