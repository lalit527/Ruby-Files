class PurchaseTest < Test::Unit::TestCase
  context "Given some Purchases of each status" do
    setup do
      %w(in_progress submitted approved
        shipped received canceled).each do |s|
        Factory(:purchase, :status => s)
      end
    end

    context "Purchase.all_in_progress" do
      setup { @purchases = Purchase.all_in_progress }

      should "not be empty" do
        assert !@purchases.empty?
      end

      should "return only in progress purchases" do
        @purchases.each do |purchase|
          assert purchase.in_progress?
        end
      end

      should "return all in progress purchases" do
        expected = Purchase.all.select(&:in_progress?)
        assert_same_elements expected, @purchases
      end
    end
  end
end

"""
To fix the below issue using Metaprogramming
"""
class Purchase < ActiveRecord::Base
  STATUSES = %w(in_progress submitted approved shipped received)

  validates_presence_of :status
  validates_inclusion_of :status, :in => STATUSES

  class << self
    STATUSES.each do |status_name|
      define_method "all_#{status_name}"
        where(:status => status_name)
    end
  end

  # Status Accessors
  STATUSES.each do |status_name|
    define_method "#{status_name}?"
      status == status_name
    end
  end
end