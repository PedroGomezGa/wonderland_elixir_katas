defmodule CardGameWar.Game do

  # feel free to use these cards or use your own data structure"
  @suits = [:spade, :club, :diamond, :heart]
  @ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]
  @cards for suit <- @suits, rank <- @ranks, do: {suit, rank}

  def compare_card(a,b) when a in @cards and b in @cards do
    cond do
      a === b -> {:error, "The 2 cards are the same! Come on!"}
      a["rank"] === b["rank"] -> %{"rank" => a["rank"], "suit" => compare_suit(a["suit"], b["suit"])}
      true -> %{"rank" => compare_rank(a["rank"], b["rank"]), "suit" => compare_suit(a["suit"], b["suit"])} 
    end
  end

  def compare_suit(a, b) do
    cond do
    a == :spade -> b
    b == :spade -> a
    a == :club -> b
    b == :club -> a
    a == :diamond -> b
    b == :diamond -> a
    true -> :heart
    end
  end

  def compare_rank(a, b) do
    cond do
    a == :jack -> b
    b == :jack -> a
    a == :queen -> b
    b == :queen -> a
    a == :king -> b
    b == :king -> a
    a == :ace -> :ace
    a > b -> a
    b > a -> b
    true -> :ace
    end
  end

  def left_cards(cards) do
    if cards == 0 do :lose end
  end
end
