# defmodule VendingMachine.PaymentCardTest do
#   use ExUnit.Case
#   alias VendingMachine.PaymentCard

#   test "should return '' when entered a single string  single digit strings can not be valid" do
#     refute PaymentCard.valid?("1")
#   end

#   test "A single zero is invalid" do
#     refute PaymentCard.valid?("0")
#   end

#   test "a simple valid SIN that remains valid if reversed" do
#     assert PaymentCard.valid?("059")
#   end

#   test "a simple valid SIN that becomes invalid if reversed" do
#     assert PaymentCard.valid?("59")
#   end

#   test "a valid Canadian SIN" do
#     assert PaymentCard.valid?("055 444 285")
#   end

#   test "invalid Canadian SIN" do
#     refute PaymentCard.valid?("055 444 286")
#   end

#   test "invalid credit card" do
#     refute PaymentCard.valid?("8273 1232 7352 0569")
#   end

#   test "valid strings with a non-digit included become invalid" do
#     refute PaymentCard.valid?("055a 444 285")
#   end

#   test "valid strings with punctuation included become invalid" do
#     refute PaymentCard.valid?("055-444-285")
#   end

#   test "valid strings with symbols included become invalid" do
#     refute PaymentCard.valid?("055£ 444$ 285")
#   end

#   test "single zero with space is invalid" do
#     refute PaymentCard.valid?(" 0")
#   end

#   test "more than a single zero is valid" do
#     assert PaymentCard.valid?("0000 0")
#   end

#   test "input digit 9 is correctly converted to output digit 9" do
#     assert PaymentCard.valid?("091")
#   end
# end
