class CardsController < ApplicationController
  def new
  end

  def create
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    customer = Payjp::Customer.create(
      description: 'test', 
      card: params[:token_id] 
    )
    # binding.pry
    card = Card.new(
      customer_id: customer.id,
      token_id: params[:token_id],
      user_id: current_user.id
    )

    if card.save
      redirect_to root_path
    else
      redirect_to new_card_path
    end 
  end

  



end
