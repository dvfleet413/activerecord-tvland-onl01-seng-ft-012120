class Show < ActiveRecord::Base
  has_many :characters
  has_many :actors, through: :characters
  belongs_to :network
  
  def actors_list
    self.actors.collect{|actor| actor.full_name}
  end 
  
  def build_network(args = {})
    network = Network.new
    args.each {|key, value| network[key] = value}
    network.shows << self
    network.save
    network
  end 
end