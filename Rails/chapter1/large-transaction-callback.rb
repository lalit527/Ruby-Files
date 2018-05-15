class Account < ActiveRecord::Base
  accepts_nested_attribute_for :user
  before_create :make_admin_user
  after_create :send_confirmation_email

  private
    def make_admin_user
      self.users.first.admin = true
    end
    def send_confirmation_email
      Mailer.confirmation(users.first).deliver
    end
end

class AccountsController < ApplicationController
  def create
    @account = Account.new params[:account]
  end

  if @account.save
    flash[:notice] = "Your account was successfully created."
    redirect_to account_url(@account)
  else
    render :action => :new
  end
end