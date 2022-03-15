defmodule CardGameWar.GameTest do
  use ExUnit.Case
  import CardGameWar.Game

  test "the highest rank wins the cards in the round" do
    assert %{"rank"=>8,"suit"=>:club} == compare_card(%{"rank"=>3,"suit"=>:club}, %{"rank"=>8,"suit"=> :club})
  end

  test "queens are higher rank than jacks" do
    assert :queen == compare_rank(:queen, :jack)
  end

  test "kings are higher rank than queens" do
    assert :king == compare_rank(:king, :queen)
  end

  test "aces are higher rank than kings" do
    assert :ace == compare_rank(:ace, :king)
  end

  test "if the ranks are equal, clubs beat spades" do
    assert %{"rank"=>3,"suit"=>:club} == compare_card(%{"rank"=>3,"suit"=>:club}, %{"rank"=>3,"suit"=> :spade})
  end

  test "if the ranks are equal, diamonds beat clubs" do
    assert %{"rank"=>3,"suit"=>:diamond} == compare_card(%{"rank"=>3,"suit"=>:diamond}, %{"rank"=>3,"suit"=> :club})
  end

  test "if the ranks are equal, hearts beat diamonds" do
    assert %{"rank"=>3,"suit"=>:heart} == compare_card(%{"rank"=>3,"suit"=>:heart}, %{"rank"=>3,"suit"=> :diamond})
  end

  test "the player loses when they run out of cards" do
    assert :lose == left_cards(0)
  end

end
