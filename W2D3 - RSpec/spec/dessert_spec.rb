require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs
(the `it` statements without blocks)! Be sure to
look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:brownie) { Dessert.new('baked goods', 25, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(brownie.type).to eq('baked goods')
    end

    it "sets a quantity" do
      expect(brownie.quantity).to eq(25)
    end

    it "starts ingredients as an empty array" do
      expect(brownie.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("baked goods", "3", chef) }.to raise_error
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(brownie.add_ingredient("walnuts")).to eq(@ingredients = ["walnuts"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      @ingredients = ['flour', 'milk', 'eggs']
      expect(brownie.mix!).to_not eq(@ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(brownie.eat(5)).to eq(20)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { brownie.eat(30) }.to raise_error('not enough left!')
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:serve).and_return("Chef")
      # expect(brownie.serve).to eq("Chef has made 25 baked goods!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(brownie)
      brownie.make_more
    end
  end
end
