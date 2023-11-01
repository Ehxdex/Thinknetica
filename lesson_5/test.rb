require_relative 'menu'
require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'train_passenger'
require_relative 'train_cargo'
require_relative 'wagon'
require_relative 'wagon_passenger'
require_relative 'wagon_cargo'

require 'minitest/autorun'

describe Train do
  before do
    @train_pass1 = TrainPassenger.new(123)
    @wagon_pass1 = WagonPassenger.new

    @train_cargo1 = TrainCargo.new(345)
    @wagon_cargo1 = WagonCargo.new

    @station1 = Station.new("Moscow")
    @station2 = Station.new("Klin")
    @station3 = Station.new("Tver")
    @station4 = Station.new("S. Peterburg")

    @route1 = Route.new(@station1, @station4)
  end

  describe 'add wagon to passenger train' do
    it 'must respond positively' do
      @train_pass1.add_wagon(@wagon_pass1)
    end
  end 

  describe 'delete wagon from passenger train' do
    it 'must respond positively' do
      @train_pass1.delete_wagon
    end
  end


  describe 'add wagon to cargo train' do
    it 'must respond positively' do
      @train_cargo1.add_wagon(@wagon_cargo1)
    end
  end 

  describe 'delete wagon from cargo train' do
    it 'must respond positively' do
      @train_cargo1.delete_wagon
    end
  end

  describe 'add route to train' do
    it 'must respond positively' do
      @train_pass1.assign_route(@route1)
    end
  end

  describe 'move train next station' do
    it 'must respond positively' do
      @train_pass1.move_next_station
    end
  end

  describe 'move train previous station' do
    it 'must respond positively' do
      @train_pass1.move_previous_station
    end
  end
end