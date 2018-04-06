require 'pry'

class CashRegister

  attr_reader :discount
  attr_accessor :total

  def initialize(emp_discount=0)
    @total = 0
    @discount = emp_discount
    @item_array = []
    @void_helper = []
  end

  def add_item(title, price, amount=1)
    @void_helper = [price, amount]
    amount.times do @item_array << title end
    @total += price * amount
  end

  def apply_discount
    if @discount > 0
      self.total -= (@total * (@discount / 100.0))
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @item_array
  end


  def void_last_transaction
    amt_to_remove = @void_helper[0] * @void_helper[1]
    @total -= amt_to_remove
    @total
  end
end
