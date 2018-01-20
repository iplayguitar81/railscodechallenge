module AuctionsHelper

  #format currency by including NumberHelper:
  include ActionView::Helpers::NumberHelper

  def auction_details

  #store keys and values into separate arrays:
  keys = Auction.select(:auction_name).map(&:auction_name).uniq
  values = Auction.select(:city).map(&:city).uniq

  #declare hash and store keys and values into hash:
  double ={}

  #add keys and values arrays to hash in same order:
  double = Hash[keys.zip(values)]

  #delete any nil values from hash
  double.delete(nil)

  #declare empty return string
  auction_detail =""

  #iterate through key value pair of auction name and corresponding city to store in return string
  double.each do |auction, city|

  #select auction name from DB query:
  auction_name = Auction.where(auction_name: auction)

  #number of vehicles sold counting by winning_bid column:
  sales_count = auction_name.count('winning_bid')

  #sum of winning_bid column for auction:
  winning_bid_total = (auction_name.sum('winning_bid').round(2))

  #sum of seller_payout column for auction:
  seller_payout_total = (auction_name.sum('seller_payout')).round(2)

  #calculate profit based on two sums above:
  profit = (winning_bid_total - seller_payout_total).round(2)

  #calculate average profit based on sum profit/ count of sales:
  average_profit = (profit/sales_count).round(2)


  #store data/calculations for particular auction into return string:
  auction_detail += "<b>Auction Name:</b> #{auction} <b>City:</b> #{city} <b>Auction Summed Winning Bid:</b> #{currency(winning_bid_total)} <b>Auction Summed Seller Payout: </b> #{currency(seller_payout_total)} <b> # of Vehicles sold:</b> #{sales_count}<b> Profit: </b> #{currency(profit)} <b>Average Profit:</b>#{currency(average_profit)}<br/>"

              end


  return auction_detail.html_safe


  end


#format currency and to string!
def currency(amount)

 money = number_to_currency(amount).to_s

  return money

end




end
