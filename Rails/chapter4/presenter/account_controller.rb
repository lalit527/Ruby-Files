class AccountsController < ApplicationController 
  def new 
    @account = Account.new 
    @user = User.new 
  end
  def create
    @account = Account.new(params[:account]) 
    @user = User.new(params[:user]) 
    @user.account = @account
    if @account.save and @user.save 
      flash[:notice] = 'Account was successfully created.' 
      redirect_to(@account) 
    else 
      render :action => "new" 
    end 
  end 
end

## To rollback transaction on any issues
class AccountsController < ApplicationController 
  def new 
    @account = Account.new 
    @user = User.new 
  end
  def create
    @account = Account.new(params[:account]) 
    @user = User.new(params[:user]) 
    @user.account = @account

    ActiveRecord::Base.transaction do 
      @account.save!
      @user.save!
    end 
    flash[:notice] = 'Account was successfully created.' 
    redirect_to(@account) 
  rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotSaved 
    render :action => "new" 
  end
end

## Change Model to handle Transaction
class Signup < ActivePresenter::Base
  before_save :assign_user_to_account 
  presents :user, :account
  
  private
  def assign_user_to_account 
    user.account = account 
  end 
end