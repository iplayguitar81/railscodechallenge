module AuctionsHelper

  #format currency by including NumberHelper:
  include ActionView::Helpers::NumberHelper


  def auction_details

    #store auction names into array:
    auction_names = Auction.select(:auction_name).map(&:auction_name).uniq

    #delete any nil values from array
    auction_names = auction_names.reject {|a| a.nil? || (a.to_s.gsub(' ', '') == '')}

    #declare empty return string
    auction_detail = ""

    #iterate through array holding auction name to do aggregate functions & calculations to store in return string
    auction_names.each do |auction|

      #select auction name from DB query:
      auction_name = Auction.where(auction_name: auction)

      #select individual auction based on iterated auction_name to grab city from DB query:
      auction_city = Auction.where(auction_name: auction).uniq.pluck(:city).first

      #number of vehicles sold counting by winning_bid column:
      sales_count = auction_name.count('winning_bid')

      #sum of winning_bid column for auction:
      winning_bid_total = (auction_name.sum('winning_bid').round(2))

      #sum of seller_payout column for auction:
      seller_payout_total = (auction_name.sum('seller_payout')).round(2)

      #calculate profit based on two sums above:
      profit = (winning_bid_total - seller_payout_total).round(2)

      #calculate average profit based on sum profit/ count of sales:
      average_profit = (profit / sales_count).round(2)

      #store data/calculations for particular auction into return string:
      auction_detail += "<div class='card col-md-11 col-md-offset-1 text-center' style='margin-top:1em;margin-left:auto;margin-right:auto;'> <div class='card-header text-white bg-success'> <b>Auction Name:</b> #{auction}<br><b>City:</b> #{auction_city} </div> <div class='card-block'> <blockquote class='card-blockquote'> <p><b>Auction Summed Winning Bid:</b> #{money(winning_bid_total)}</p><p><b>Auction Summed Seller Payout: </b> #{money(seller_payout_total)}</p><p><b> # of Vehicles sold:</b> #{sales_count}</p><p><b> Profit: </b> #{money(profit)}</p> <footer><p> <cite title='Average Profit'><b>Average Profit:</b> #{money(average_profit)}</p></cite></footer> </blockquote> </div> </div><br>"

    end
    summary_header = "<h1 class='text-center font-weight-bold' style='margin-left:auto;margin-right:auto;'>Auction Results Summary</h1><br>"
    #return the return string calling HTML safe for neat display :)
    return summary_header.html_safe + auction_detail.html_safe


  end


#format currency and to string!
  def money(amount)

    funds = number_to_currency(amount).to_s

    return funds

  end


end
