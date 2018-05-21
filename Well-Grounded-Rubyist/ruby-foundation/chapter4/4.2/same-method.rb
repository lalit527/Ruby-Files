module InterestBearing
  def calculate_interest
    puts "Placeholder! We're in the module interest method"
  end
end


class BankAccount
  include InterestBearing
  def calculate_interest
    puts "Placeholder! We're in the class interest method"
  end
  
end

account = BankAccount.new 
account.calculate_interest