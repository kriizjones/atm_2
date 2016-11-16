class Atm
  attr_accessor :funds

  def initialize
    @funds = 1000
  end

  def withdraw(amount, account)
    case
    when insufficient_funds_in_account?(amount, account) then
      return
    else
      perform_transaction(amount, account)
    end
    #@funds -= amount
  end


  private
  def insufficient_funds_in_account?(amount, account)
    amount > account.balance
  end

  def perform_transaction(amount, account)
    lower_atm_funds(amount)
    deduct_funds_from_account(amount, account)
    return_success_message(amount)
  end

  def lower_atm_funds(amount)
    @funds -= amount
  end

  def deduct_funds_from_account(amount, account)
    account.balance -= amount
  end

  def return_success_message(amount)
    { status: true, message: 'success', date: Date.today, amount: amount}
  end

end
