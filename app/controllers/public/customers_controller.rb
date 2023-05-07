class Public::CustomersController < ApplicationController
  def show
    @customers = Customer.all
  end
  
  def edit
  end
  
  def update
  end
  
  def withdrawal
  end
  
  def out
  end
    
end