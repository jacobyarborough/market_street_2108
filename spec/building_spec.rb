require 'rspec'
require './lib/renter'
require './lib/apartment'
require './lib/building'

describe Building do

  before(:each) do
    @building = Building.new
    @unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    @unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    @unit3 = Apartment.new({number: "C3", monthly_rent: 1150, bathrooms: 2, bedrooms: 2})
    @unit4 = Apartment.new({number: "D4", monthly_rent: 1500, bathrooms: 2, bedrooms: 3})
  end

  describe '#initialize' do
    it "creates an instance object of Building class" do
      expect(@building).to be_an_instance_of(Building)
    end

    it 'has readable attributes' do
      expect(@building.units).to eq([])
    end
  end

  describe '#add_unit' do
    it 'adds unit to a units array' do
      @building.add_unit(@unit1)
      @building.add_unit(@unit2)

      expect(@building.units).to eq([@unit1, @unit2])
    end
  end

  describe '#renters' do
    it 'returns an array of renter in the Building instance object' do
      @building.add_unit(@unit1)
      @building.add_unit(@unit2)
      renter1 = Renter.new("Aurora")
      renter2 = Renter.new("Tim")
      @unit1.add_renter(renter1)
      @unit2.add_renter(renter2)

      expect(@building.renters).to eq(["Aurora", "Tim"])
    end
  end

  describe '#average_rent' do
    it 'calculates average rent' do
      @building.add_unit(@unit1)
      @building.add_unit(@unit2)

      expect(@building.average_rent).to eq(1099.5)
    end
  end

  describe '#rented_units' do
    it "returns an array of rented units" do
      @building.add_unit(@unit1)
      @building.add_unit(@unit2)
      @building.add_unit(@unit3)
      renter1 = Renter.new("Spencer")
      @unit2.add_renter(renter1)

      expect(@building.rented_units).to eq([@unit2])
    end
  end

  describe '#renter_with_highest_rent' do
    it 'returns renter with highest rent' do
      @building.add_unit(@unit1)
      @building.add_unit(@unit2)
      @building.add_unit(@unit3)
      renter1 = Renter.new("Spencer")
      renter2 = Renter.new("Jessie")
      @unit2.add_renter(renter1)
      @unit1.add_renter(renter2)

      expect(@building.renter_with_highest_rent).to eq(renter2)
    end
  end

  describe '#units_by_number_of_bedrooms' do
    xit 'creates a hash with bedrooms as keys and units as values' do
      @building.add_unit(@unit1)
      @building.add_unit(@unit2)
      @building.add_unit(@unit3)
      @building.add_unit(@unit4)
      renter1 = Renter.new("Spencer")
      renter2 = Renter.new("Jessie")
      renter3 = Renter.new("Max")
    end
  end

end
