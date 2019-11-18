defmodule VendingMachine.PaymentServiceTest do
  use ExUnit.Case
  alias VendingMachine.{Currency, PaymentService}

  test "should return '0.00' if the ordered quantity is less than the available quantity in the stock" do
    given_amount = 22
    expected_value = false
    actual_value = PaymentService.is_valid_currency(given_amount)
    assert expected_value == actual_value
  end

  test "should return 'true' if the ordered quantity is less than the available quantity in the stock" do
    given_amount = 20.00
    expected_value = true
    actual_value = PaymentService.is_valid_currency(given_amount)
    assert expected_value == actual_value
  end

  test "should return '20.00' if the ordered quantity is less than the available quantity in the stock" do
    given_balance_amout = 20.00

    expected_value = %Currency{
      coins: %{},
      notes: %{20 => %{count: 1, currency: 20}}
    }

    actual_value = PaymentService.arrange_refund_amount(given_balance_amout)
    assert expected_value == actual_value
  end

  test "should return 'balance status' if the ordered quantity is less than the available quantity in the stock" do
    given_amount_added = 20.00
    given_amount_required = 22.00
    expected_value = "add_cash"

    actual_value =
      PaymentService.calculate_balance_status(given_amount_added, given_amount_required)

    assert expected_value == actual_value
  end

  test "should return 'return_cash' if the ordered quantity is less than the available quantity in the stock" do
    given_amount_added = 22.00
    given_amount_required = 20.00
    expected_value = "return_cash"

    actual_value =
      PaymentService.calculate_balance_status(given_amount_added, given_amount_required)

    assert expected_value == actual_value
  end

  test "should return 'deliver_ite' if the ordered quantity is less than the available quantity in the stock" do
    given_amount_added = 20.00
    given_amount_required = 20.00
    expected_value = "deliver_item"

    actual_value =
      PaymentService.calculate_balance_status(given_amount_added, given_amount_required)

    assert expected_value == actual_value
  end

  test "should return 'deliver_item' if the ordered quantity is less than the available quantity in the stock" do
    given_first_amount = 1.00
    given_second_amount = 0.05
    expected_value = 0.95
    expected_value = 0.95

    actual_value =
      PaymentService.calculate_difference_amount(given_first_amount, given_second_amount)

    assert expected_value == actual_value
  end

  test "should return 'deliver_tem' if the ordered quantity is less than the available quantity in the stock" do
    given_first_amount = 1.00
    given_second_amount = 0.05
    expected_value = 1.05
    actual_value = PaymentService.calculate_sum_amount(given_first_amount, given_second_amount)
    assert expected_value == actual_value
  end
end
