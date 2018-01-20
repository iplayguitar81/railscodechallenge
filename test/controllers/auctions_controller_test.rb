require 'test_helper'

class AuctionsControllerTest < ActionController::TestCase
  setup do
    @auction = auctions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:auctions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create auction" do
    assert_difference('Auction.count') do
      post :create, auction: { auction_name: @auction.auction_name, city: @auction.city, description: @auction.description, seller_payout: @auction.seller_payout, state: @auction.state, street_address: @auction.street_address, vehicle_make: @auction.vehicle_make, vehicle_model: @auction.vehicle_model, vehicle_stock_number: @auction.vehicle_stock_number, vehicle_year: @auction.vehicle_year, winning_bid: @auction.winning_bid, zip: @auction.zip }
    end

    assert_redirected_to auction_path(assigns(:auction))
  end

  test "should show auction" do
    get :show, id: @auction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @auction
    assert_response :success
  end

  test "should update auction" do
    patch :update, id: @auction, auction: { auction_name: @auction.auction_name, city: @auction.city, description: @auction.description, seller_payout: @auction.seller_payout, state: @auction.state, street_address: @auction.street_address, vehicle_make: @auction.vehicle_make, vehicle_model: @auction.vehicle_model, vehicle_stock_number: @auction.vehicle_stock_number, vehicle_year: @auction.vehicle_year, winning_bid: @auction.winning_bid, zip: @auction.zip }
    assert_redirected_to auction_path(assigns(:auction))
  end

  test "should destroy auction" do
    assert_difference('Auction.count', -1) do
      delete :destroy, id: @auction
    end

    assert_redirected_to auctions_path
  end
end
