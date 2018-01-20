class Auction < ActiveRecord::Base

  require 'csv'

  #create records of auction from CSV and import into Auction Model/DB
  def self.import(file)



#use header_converters to swap out spaces with underscores to get headers imported to match the db columns...
    CSV.foreach(file.path, headers: true, header_converters: lambda { |h| h.try(:downcase).try(:gsub,' ', '_') }) do |row|
      Auction.create! row.to_hash
    end


  end

end
