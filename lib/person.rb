require './lib/account.rb'

class Person
  attr_accessor :name, :cash, :account

  def initialize(attrs = {})
    @name = (attrs[:name])
    @cash = 0
    @account = nil

    if @name == nil
    raise 'a name is required'
    end
  end

  def create_account
    @account = Account.new(owner: self)
  end

  def deposit(amount)
  @account == nil
  end


end
