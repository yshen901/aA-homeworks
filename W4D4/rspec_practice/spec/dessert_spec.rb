require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  let(:cake) { Dessert.new("cake", 5, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(cake.type).to eq("cake")
    end

    it "sets a quantity" do
      expect(cake.quantity).to eq(5)
    end

    it "starts ingredients as an empty array" do
      expect(cake.ingredients.length).to eq(0)
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cake", "5", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      cake.add_ingredient("flour")
      expect(cake.ingredients[0]).to eq("flour")
    end
    
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      cake.add_ingredient("sugar")
      cake.add_ingredient("butter")
      cake.mix!
      expect(cake.ingredients).to_not eq(["flour", "sugar", "butter"])
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      cake.eat(5)
      expect(cake.quantity).to eq(0)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { cake.eat(6) }.to raise_error(RuntimeError)
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Tucker the Great Baker")
      allow(cake).to receive(:serve).and_return("Chef Tucker the Great Baker has made 5 cakes!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      cake.make_more
      expect(cake.temp).to eq(400)
    end
  end
end
