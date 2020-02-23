require 'pry'
class Character < ActiveRecord::Base
  belongs_to :actor
  belongs_to :show
  
  def say_that_thing_you_say
    "#{self.name} always says: #{self.catchphrase}"
  end
  
  def build_show(args = {})
    show = Show.new
    args.each {|key, value| show[key] = value}
    show.characters << self
    show.save
  end 
end