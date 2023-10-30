require 'minitest/autorun'

require_relative '../lib/vending_machine'

class VendingMachineTest < Minitest::Test
  def test_user_sees_menu
    vending_machine = VendingMachine.new
    menu = vending_machine.input('menu')
    expected_menu = <<~MENU
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

    assert_equal(expected_menu, menu)
  end

  def test_vending_machine_can_collect_money 
    vending_machine = VendingMachine.new
    vending_machine.collect(1.00)
    vending_machine.collect(0.25)
    vending_machine.collect(0.10)
    vending_machine.collect(0.05)
    vending_machine.collect(0.01)
    funds = vending_machine.funds
    expected_funds = '$1.41'

    assert_equal(expected_funds, funds)
  end

  def test_insufficient_funds
    vending_machine = VendingMachine.new
    vending_machine.collect(0.25)
    vending_machine.collect(0.25)
    vending_machine.collect(0.25)
    output = vending_machine.input('B3')
    expected_output = "Insufficient funds"

    assert_equal(expected_output, output)
  end

  def test_sufficient_funds
    vending_machine = VendingMachine.new
    vending_machine.collect(0.25)
    vending_machine.collect(0.25)
    vending_machine.collect(0.25)
    vending_machine.collect(0.25)
    output = vending_machine.input('B3')
    expected_output = "Dispensing Sunkist. Change: $0.00"

    assert_equal(expected_output, output)
  end

  def test_oversufficient_funds
    vending_machine = VendingMachine.new
    vending_machine.collect(1.00)
    vending_machine.collect(0.25)
    vending_machine.collect(0.25)
    output = vending_machine.input('B3')
    expected_output = "Dispensing Sunkist. Change: $0.50"

    assert_equal(expected_output, output)
  end

  def test_invalid_selection
    vending_machine = VendingMachine.new
    output = vending_machine.input('foo')
    expected_output = 'Invalid selection'

    assert_equal(expected_output, output)
  end
end
