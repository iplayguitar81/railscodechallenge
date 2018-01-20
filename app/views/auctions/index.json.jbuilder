json.array!(@auctions) do |auction|
  json.extract! auction, :id, :auction_name, :street_address, :city, :state, :zip, :vehicle_year, :vehicle_make, :vehicle_model, :vehicle_stock_number, :winning_bid, :seller_payout, :description
  json.url auction_url(auction, format: :json)
end
