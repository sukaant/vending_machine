defmodule VendingMachine.CurrencyNoteTest do
  use ExUnit.Case
  alias VendingMachine.CurrencyNote

  test "should return '1.00' if the given specification matches with $1 Currency Note" do
    given_background_color = "Green"
    given_fluorescent_strip_color = "None"
    given_obverse = "George Washington"
    given_reverse = "Great Seal of the United States"

    given_note_specification_input_value = %CurrencyNote{
      background_color: given_background_color,
      fluorescent_strip_color: given_fluorescent_strip_color,
      obverse: given_obverse,
      reverse: given_reverse
    }

    expected_value = 1.00
    actual_value = CurrencyNote.validate_note_and_get_value(given_note_specification_input_value)
    assert expected_value == actual_value
  end

  test "should return '2.00' if the given specification matches with $2 Currency Note" do
    given_background_color = "Green"
    given_fluorescent_strip_color = "None"
    given_obverse = "Thomas Jefferson"
    given_reverse = "Declaration of Independence by John Trumbull"

    given_note_specification_input_value = %CurrencyNote{
      background_color: given_background_color,
      fluorescent_strip_color: given_fluorescent_strip_color,
      obverse: given_obverse,
      reverse: given_reverse
    }

    expected_value = 2.00
    actual_value = CurrencyNote.validate_note_and_get_value(given_note_specification_input_value)
    assert expected_value == actual_value
  end

  test "should return '5.00' if the given specification matches with $5 Currency Note" do
    given_background_color = "Purple"
    given_fluorescent_strip_color = "Blue"
    given_obverse = "Abraham Lincoln"
    given_reverse = "Lincoln Memorial"

    given_note_specification_input_value = %CurrencyNote{
      background_color: given_background_color,
      fluorescent_strip_color: given_fluorescent_strip_color,
      obverse: given_obverse,
      reverse: given_reverse
    }

    expected_value = 5.00
    actual_value = CurrencyNote.validate_note_and_get_value(given_note_specification_input_value)
    assert expected_value == actual_value
  end

  test "should return '10.00' if the given specification matches with $10 Currency Note" do
    given_background_color = "Orange"
    given_fluorescent_strip_color = "Orange"
    given_obverse = "Alexander Hamilton"
    given_reverse = "Treasury Building"

    given_note_specification_input_value = %CurrencyNote{
      background_color: given_background_color,
      fluorescent_strip_color: given_fluorescent_strip_color,
      obverse: given_obverse,
      reverse: given_reverse
    }

    expected_value = 10.00
    actual_value = CurrencyNote.validate_note_and_get_value(given_note_specification_input_value)
    assert expected_value == actual_value
  end

  test "should return '20.00' if the given specification matches with $20 Currency Note" do
    given_background_color = "Green"
    given_fluorescent_strip_color = "Green"
    given_obverse = "Andrew Jackson"
    given_reverse = "White House"

    given_note_specification_input_value = %CurrencyNote{
      background_color: given_background_color,
      fluorescent_strip_color: given_fluorescent_strip_color,
      obverse: given_obverse,
      reverse: given_reverse
    }

    expected_value = 20.00
    actual_value = CurrencyNote.validate_note_and_get_value(given_note_specification_input_value)
    assert expected_value == actual_value
  end

  test "should return '50.00' if the given specification matches with $50 Currency Note" do
    given_background_color = "Pink"
    given_fluorescent_strip_color = "Yellow"
    given_obverse = "Ulysses S. Grant"
    given_reverse = "United States Capitol"

    given_note_specification_input_value = %CurrencyNote{
      background_color: given_background_color,
      fluorescent_strip_color: given_fluorescent_strip_color,
      obverse: given_obverse,
      reverse: given_reverse
    }

    expected_value = 50.00
    actual_value = CurrencyNote.validate_note_and_get_value(given_note_specification_input_value)
    assert expected_value == actual_value
  end

  test "should return '100.00' if the given specification matches with $100 Currency Note" do
    given_background_color = "Teal"
    given_fluorescent_strip_color = "Pink"
    given_obverse = "Benjamin Franklin"
    given_reverse = "Independence Hall"

    given_note_specification_input_value = %CurrencyNote{
      background_color: given_background_color,
      fluorescent_strip_color: given_fluorescent_strip_color,
      obverse: given_obverse,
      reverse: given_reverse
    }

    expected_value = 100.00
    actual_value = CurrencyNote.validate_note_and_get_value(given_note_specification_input_value)
    assert expected_value == actual_value
  end

  test "should return '0.00' if the given specification of background_color does not matches with any Currency Note" do
    given_background_color = "T"
    given_fluorescent_strip_color = "Pink"
    given_obverse = "Benjamin Franklin"
    given_reverse = "Independence Hall"

    given_note_specification_input_value = %CurrencyNote{
      background_color: given_background_color,
      fluorescent_strip_color: given_fluorescent_strip_color,
      obverse: given_obverse,
      reverse: given_reverse
    }

    expected_value = 0.00
    actual_value = CurrencyNote.validate_note_and_get_value(given_note_specification_input_value)
    assert expected_value == actual_value
  end

  test "should return '0.00' if the given specification of fluorescent_strip_color does not matches with any Currency Note" do
    given_background_color = "Teal"
    given_fluorescent_strip_color = "P"
    given_obverse = "Benjamin Franklin"
    given_reverse = "Independence Hall"

    given_note_specification_input_value = %CurrencyNote{
      background_color: given_background_color,
      fluorescent_strip_color: given_fluorescent_strip_color,
      obverse: given_obverse,
      reverse: given_reverse
    }

    expected_value = 0.00
    actual_value = CurrencyNote.validate_note_and_get_value(given_note_specification_input_value)
    assert expected_value == actual_value
  end

  test "should return '0.00' if the given specification of obverse does not matches with any Currency Note" do
    given_background_color = "Teal"
    given_fluorescent_strip_color = "Pink"
    given_obverse = "B F"
    given_reverse = "Independence Hall"

    given_note_specification_input_value = %CurrencyNote{
      background_color: given_background_color,
      fluorescent_strip_color: given_fluorescent_strip_color,
      obverse: given_obverse,
      reverse: given_reverse
    }

    expected_value = 0.00
    actual_value = CurrencyNote.validate_note_and_get_value(given_note_specification_input_value)
    assert expected_value == actual_value
  end

  test "should return '0.00' if the given specification of reverse does not matches with any Currency Note" do
    given_background_color = "Teal"
    given_fluorescent_strip_color = "Pink"
    given_obverse = "Benjamin Franklin"
    given_reverse = "I H"

    given_note_specification_input_value = %CurrencyNote{
      background_color: given_background_color,
      fluorescent_strip_color: given_fluorescent_strip_color,
      obverse: given_obverse,
      reverse: given_reverse
    }

    expected_value = 0.00
    actual_value = CurrencyNote.validate_note_and_get_value(given_note_specification_input_value)
    assert expected_value == actual_value
  end

  test "should return '0.00' if none of the given specification matches with any Currency Note" do
    given_background_color = ""
    given_fluorescent_strip_color = ""
    given_obverse = ""
    given_reverse = ""

    given_note_specification_input_value = %CurrencyNote{
      background_color: given_background_color,
      fluorescent_strip_color: given_fluorescent_strip_color,
      obverse: given_obverse,
      reverse: given_reverse
    }

    expected_value = 0.00
    actual_value = CurrencyNote.validate_note_and_get_value(given_note_specification_input_value)
    assert expected_value == actual_value
  end

  test "should return '0.00' if the given specificationsssss of background_color does not matches with any Currency Note" do
    given_background_color = 1
    given_fluorescent_strip_color = 1
    given_obverse = 1
    given_reverse = 1

    given_note_specification_input_value = %CurrencyNote{
      background_color: given_background_color,
      fluorescent_strip_color: given_fluorescent_strip_color,
      obverse: given_obverse,
      reverse: given_reverse
    }

    expected_value = 0.00
    actual_value = CurrencyNote.validate_note_and_get_value(given_note_specification_input_value)
    assert expected_value == actual_value
  end

  # test "should return '188.00' the sum of entered Currency Notes" do
  #   given_note_list_input_value = [
  #     CurrencyNote.validate_note_and_get_value(%CurrencyNote{
  #       background_color: "Green",
  #       fluorescent_strip_color: "None",
  #       obverse: "George Washington",
  #       reverse: "Great Seal of the United States"
  #     }),
  #     CurrencyNote.validate_note_and_get_value(%CurrencyNote{
  #       background_color: "Green",
  #       fluorescent_strip_color: "None",
  #       obverse: "Thomas Jefferson",
  #       reverse: "Declaration of Independence by John Trumbull"
  #     }),
  #     CurrencyNote.validate_note_and_get_value(%CurrencyNote{
  #       background_color: "Purple",
  #       fluorescent_strip_color: "Blue",
  #       obverse: "Abraham Lincoln",
  #       reverse: "Lincoln Memorial"
  #     }),
  #     CurrencyNote.validate_note_and_get_value(%CurrencyNote{
  #       background_color: "Orange",
  #       fluorescent_strip_color: "Orange",
  #       obverse: "Alexander Hamilton",
  #       reverse: "Treasury Building"
  #     }),
  #     CurrencyNote.validate_note_and_get_value(%CurrencyNote{
  #       background_color: "Green",
  #       fluorescent_strip_color: "Green",
  #       obverse: "Andrew Jackson",
  #       reverse: "White House"
  #     }),
  #     CurrencyNote.validate_note_and_get_value(%CurrencyNote{
  #       background_color: "Pink",
  #       fluorescent_strip_color: "Yellow",
  #       obverse: "Ulysses S. Grant",
  #       reverse: "United States Capitol"
  #     }),
  #     CurrencyNote.validate_note_and_get_value(%CurrencyNote{
  #       background_color: "Teal",
  #       fluorescent_strip_color: "Pink",
  #       obverse: "Benjamin Franklin",
  #       reverse: "Independence Hall"
  #     }),
  #     CurrencyNote.validate_note_and_get_value(%CurrencyNote{
  #       background_color: "",
  #       fluorescent_strip_color: "",
  #       obverse: "",
  #       reverse: ""
  #     })
  #   ]

  #   expected_value = 188.00
  #   actual_value = CurrencyNote.sum(given_note_list_input_value)
  #   assert expected_value == actual_value
  # end
end
