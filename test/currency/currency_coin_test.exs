defmodule VendingMachine.CurrencyCoinTest do
  use ExUnit.Case
  alias VendingMachine.CurrencyCoin

  test "should return '0.01' if the given specification matches 1 cent Currency Coin" do
    given_diameter = 0.750
    given_thickness = 1.55
    given_mass = 2.500

    given_coin_specification_input_value = %CurrencyCoin{
      diameter: given_diameter,
      thickness: given_thickness,
      mass: given_mass
    }

    expected_value = 0.01
    actual_value = CurrencyCoin.validate_coin_and_get_value(given_coin_specification_input_value)
    assert expected_value == actual_value
  end

  test "should return '0.05' if the given specification matches 5 cents Currency Coin" do
    given_diameter = 0.835
    given_thickness = 1.95
    given_mass = 5.000

    given_coin_specification_input_value = %CurrencyCoin{
      diameter: given_diameter,
      thickness: given_thickness,
      mass: given_mass
    }

    expected_value = 0.05
    actual_value = CurrencyCoin.validate_coin_and_get_value(given_coin_specification_input_value)
    assert expected_value == actual_value
  end

  test "should return '0.10' if the given specification matches 10 cents Currency Coin" do
    given_diameter = 0.705
    given_thickness = 1.35
    given_mass = 2.268

    given_coin_specification_input_value = %CurrencyCoin{
      diameter: given_diameter,
      thickness: given_thickness,
      mass: given_mass
    }

    expected_value = 0.10
    actual_value = CurrencyCoin.validate_coin_and_get_value(given_coin_specification_input_value)
    assert expected_value == actual_value
  end

  test "should return '0.25' if the given specification matches 25 cents Currency Coin" do
    given_diameter = 0.955
    given_thickness = 1.75
    given_mass = 5.670

    given_coin_specification_input_value = %CurrencyCoin{
      diameter: given_diameter,
      thickness: given_thickness,
      mass: given_mass
    }

    expected_value = 0.25
    actual_value = CurrencyCoin.validate_coin_and_get_value(given_coin_specification_input_value)
    assert expected_value == actual_value
  end

  test "should return '0.50' if the given specification matches with 50 cents Currency Coin" do
    given_diameter = 1.205
    given_thickness = 2.15
    given_mass = 11.340

    given_coin_specification_input_value = %CurrencyCoin{
      diameter: given_diameter,
      thickness: given_thickness,
      mass: given_mass
    }

    expected_value = 0.50
    actual_value = CurrencyCoin.validate_coin_and_get_value(given_coin_specification_input_value)
    assert expected_value == actual_value
  end

  test "should return '1.00' if the given specification matches with $1 Currency Coin" do
    given_diameter = 1.043
    given_thickness = 2.00
    given_mass = 8.100

    given_coin_specification_input_value = %CurrencyCoin{
      diameter: given_diameter,
      thickness: given_thickness,
      mass: given_mass
    }

    expected_value = 1.00
    actual_value = CurrencyCoin.validate_coin_and_get_value(given_coin_specification_input_value)
    assert expected_value == actual_value
  end

  test "should return '0.00' if the given specification of diameter does not matches with any Currency Coin" do
    given_diameter = 0.000
    given_thickness = 2.00
    given_mass = 8.100

    given_coin_specification_input_value = %CurrencyCoin{
      diameter: given_diameter,
      thickness: given_thickness,
      mass: given_mass
    }

    expected_value = 0.00
    actual_value = CurrencyCoin.validate_coin_and_get_value(given_coin_specification_input_value)
    assert expected_value == actual_value
  end

  test "should return '0.00' if the given specification of thickness does not matches with any Currency Coin" do
    given_diameter = 1.043
    given_thickness = 0.00
    given_mass = 8.100

    given_coin_specification_input_value = %CurrencyCoin{
      diameter: given_diameter,
      thickness: given_thickness,
      mass: given_mass
    }

    expected_value = 0.00
    actual_value = CurrencyCoin.validate_coin_and_get_value(given_coin_specification_input_value)
    assert expected_value == actual_value
  end

  test "should return '0.00' if the given specification of mass does not matches with any Currency Coin" do
    given_diameter = 1.043
    given_thickness = 2.00
    given_mass = 0.000

    given_coin_specification_input_value = %CurrencyCoin{
      diameter: given_diameter,
      thickness: given_thickness,
      mass: given_mass
    }

    expected_value = 0.00
    actual_value = CurrencyCoin.validate_coin_and_get_value(given_coin_specification_input_value)
    assert expected_value == actual_value
  end

  test "should return '0.00' if none of the given specification matches with any Currency Coin" do
    given_diameter = 1
    given_thickness = 1
    given_mass = 1

    given_coin_specification_input_value = %CurrencyCoin{
      diameter: given_diameter,
      thickness: given_thickness,
      mass: given_mass
    }

    expected_value = 0.00
    actual_value = CurrencyCoin.validate_coin_and_get_value(given_coin_specification_input_value)
    assert expected_value == actual_value
  end

  test "should return '0.00' if the given specificationsssss of diameter does not matches with any Currency Coin" do
    given_diameter = ""
    given_thickness = ""
    given_mass = ""

    given_coin_specification_input_value = %CurrencyCoin{
      diameter: given_diameter,
      thickness: given_thickness,
      mass: given_mass
    }

    expected_value = 0.00
    actual_value = CurrencyCoin.validate_coin_and_get_value(given_coin_specification_input_value)
    assert expected_value == actual_value
  end

  # test "should return '1.91' the sum of entered Currency Coins" do
  #   given_coin_list_input_value = [
  #     CurrencyCoin.validate_coin_and_get_value(%CurrencyCoin{
  #       diameter: 0.750,
  #       thickness: 1.55,
  #       mass: 2.500
  #     }),
  #     CurrencyCoin.validate_coin_and_get_value(%CurrencyCoin{
  #       diameter: 0.835,
  #       thickness: 1.95,
  #       mass: 5.000
  #     }),
  #     CurrencyCoin.validate_coin_and_get_value(%CurrencyCoin{
  #       diameter: 0.705,
  #       thickness: 1.35,
  #       mass: 2.268
  #     }),
  #     CurrencyCoin.validate_coin_and_get_value(%CurrencyCoin{
  #       diameter: 0.955,
  #       thickness: 1.75,
  #       mass: 5.670
  #     }),
  #     CurrencyCoin.validate_coin_and_get_value(%CurrencyCoin{
  #       diameter: 1.205,
  #       thickness: 2.15,
  #       mass: 11.340
  #     }),
  #     CurrencyCoin.validate_coin_and_get_value(%CurrencyCoin{
  #       diameter: 1.043,
  #       thickness: 2.00,
  #       mass: 8.100
  #     }),
  #     CurrencyCoin.validate_coin_and_get_value(%CurrencyCoin{
  #       diameter: "",
  #       thickness: "",
  #       mass: ""
  #     })
  #   ]

  #   expected_value = 1.91
  #   actual_value = CurrencyCoin.sum(given_coin_list_input_value)
  #   assert expected_value == actual_value
  # end
end
