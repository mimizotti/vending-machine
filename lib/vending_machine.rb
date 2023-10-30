class VendingMachine
  ITEMS = {
    'A1' => { name: 'Cheetos', price: 1.00 },
    'A2' => { name: 'KitKat', price: 1.25 },
    'A3' => { name: 'Water', price: 1.00 },
    'B1' => { name: 'Oreos', price: 1.50 },
    'B2' => { name: 'Carrots', price: 0.50 },
    'B3' => { name: 'Sunkist', price: 1.00 },
    'C1' => { name: 'Lays', price: 1.00 },
    'C2' => { name: 'Apple', price: 0.75 },
    'C3' => { name: 'Juice', price: 1.00 }
  }.freeze

  def initialize
    @funds = 0.0
  end

  def input(user_input)
    case user_input
    when 'menu'
      menu
    when /^[A-Z]\d$/
      process_selection(user_input)
    else
      'Invalid selection'
    end
  end

  def process_selection(code)
    price = ITEMS[code][:price]
    name = ITEMS[code][:name]

    if price > @funds
      'Insufficient funds'
    elsif price <= @funds
      @funds -= price 
      "Dispensing #{name}. Change: #{funds}"
    end
  end

  def menu
    <<~MENU
      | CODE | ITEM    | PRICE |
      | ---------------------- |
      | A1   | Cheetos | $1.00 |
      | A2   | KitKat  | $1.25 |
      | A3   | Water   | $1.00 |
      | B1   | Oreos   | $1.50 |
      | B2   | Carrots | $0.50 |
      | B3   | Sunkist | $1.00 |
      | C1   | Lays    | $1.00 |
      | C2   | Apple   | $0.75 |
      | C3   | Juice   | $1.00 |
    MENU
  end

  def collect(money)
    @funds += money
  end

  def funds
    sprintf("$%.2f", @funds)
  end
end
