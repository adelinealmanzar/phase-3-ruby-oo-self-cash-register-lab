require 'pry'


class CashRegister
    attr_accessor :total, :discount, :items, :last_transaction

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(item, price, quantity = 1)
        @last_transaction = price * quantity
        @total += (price * quantity)
        quantity.times { @items << item }
    end

    def apply_discount
        if @discount != 0
            @total -= (@discount / 100.0) * @total
            "After the discount, the total comes to $#{@total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= self.last_transaction
    end
end
