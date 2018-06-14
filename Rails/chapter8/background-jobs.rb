"""
Time consuming JOBS:-
Generating Reports
Updating lots of related data in an associated object, based on user action
Updating various cache
Sending Email
"""

## Executing task outside the response cycle:-

# cron Tasks


# Queing Jobs
class SalesReport < Struct.new(:user)
  def perform 
    report = generate_report 
    Mailer.sales_report(user, report).deliver 
  end
  
  private
    def generate_report 
      FasterCSV.generate do |csv| 
        csv << CSV_HEADERS 
        Sales.find_each do |sale| 
          csv << sale.to_a 
        end 
      end 
    end 
end

"""
place this code in the create action of ReportsController
"""
def create 
  Delayed::Job.enqueue SalesReport.new(current_user) 
end

class Sale < ActiveRecord::Base 
  def self.generate_report(user) 
    report = FasterCSV.generate do |csv| 
      csv << CSV_HEADERS 
      find_each do |sale| 
        csv << sale.to_a 
      end 
    end 
    Mailer.sales_report(user, report).deliver 
  end 
end

"""
"""
def create 
  Sale.send_later(:generate_report, current_user) 
end