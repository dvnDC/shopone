module ItemsHelper
  # Items counter.
  def items_amount
    Item.all.count
  end
end
