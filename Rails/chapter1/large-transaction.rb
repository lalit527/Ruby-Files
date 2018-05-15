"""
• Creates the first user for an account
• Makes the user an administrator
• Adds the user to the account
• Saves the account
• Sends a confirmation email to the user
"""
class Account < ActiveRecord::Base
  def create_account!(account_params, user_params)
    transaction do
      account = Account.create!(account_params)
      first_user = User.new(user_params)
      first_user.admin = true
      first_user.save!
      self.user << first_user
      account.save!
      Mailer.deliver_confirmation(first_user)
      return account
    end
  end
end

"""
The callbacks and validations build into Active Record have a set order of operation. 
If any callback or validation along the way is not successful, 
the model’s save process will be halted, and the transaction will be rolled back.
"""
before_validation 
before_validation :on => :create 
after_validation 
after_validation :on => :create 
before_save 
before_create 
after_create 
after_save

## Nested Attributes
accepts_nested_attributes_for :users