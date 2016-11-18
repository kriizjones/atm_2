require './lib/account.rb'

class Person
  attr_accessor :name, :cash, :account

  def initialize(attrs = {})
    @name = (attrs[:name])
    @cash = 0
    

    if @name == nil
    raise 'a name is required'
    end
  end

  def create_account
    @account = account.new(owner: self)
  # skapa subject.account som en instance av Account class.
  end
end
