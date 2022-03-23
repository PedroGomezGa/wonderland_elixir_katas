defmodule Doublets.SolverTest do
  use ExUnit.Case
  import Doublets.Solver

  test "with word links found" do
    assert ["head", "heal", "teal", "tell", "tall", "tail"] ==
           doublets("head", "tail")

    assert ["door", "boor", "book", "look", "lock"] ==
           doublets("door", "lock")

    assert ["bank", "bonk", "book", "look", "loon", "loan"] ==
           doublets("bank", "loan")

    assert ["wheat", "cheat", "cheap", "cheep", "creep", "creed", "breed", "bread"] ==
           doublets("wheat", "bread")
  end

  test "with no word links found" do
    assert [] == doublets("ye", "freezer")
  end

  test "doublets_impl" do
       assert [] = doublets_impl([], "word")
       assert [] = doublets_impl([["word"]], "word")
       assert [] = doublets_impl([["word"]], "")
  end

  test "find_solution" do
       assert ["head", "heal", "teal", "tell", "tall", "tail"] 
       = find_solution([["head", "heal", "teal", "tell", "tall", "tail"],
                        ["head", "heal", "teal", "tell", "tall", "tell"],
                        ["head", "heal", "teal", "tell", "tall", "tale"]],"tail")
  end

  test "complete_seq_variants" do
       assert [["head", "heal"]] = complete_seq_variants(["head"])
       assert [["teal", "heal"], ["teal", "tell"]] = complete_seq_variants(["teal"])
  end  

  test "find_variants" do
       assert ["heal"] = find_variants("head")
       assert ["teal", "tall"] = find_variants("tell")
       assert [] = find_variants("asd")
  end

  test "same_lenght_words" do
       assert ["muta", "task", "quat", "heal", "teal", "tell", "tall", "tail", "door",
               "boor", "book", "look", "lock", "bank", "bonk", "loon", "loan"] 
               = same_length_words("head")
       assert ["ancistrocladaceous"] = same_length_words("indiscriminateness")
       assert [] = same_length_words("a")
       assert [] = same_length_words("")
  end

  test "distance" do
       assert 1 = distance("head", "heal")
       assert 4 = distance("head", "tail")
       assert 0 = distance("head", "head")
  end

  test "last_word" do
       assert "head" = last_word(["head"])
       assert "tell" = last_word(["head", "heal", "teal", "tell"])
  end
end
