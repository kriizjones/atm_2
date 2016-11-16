class Atm
  attr_accessor :funds

  def initialize
    @funds = 1000
  end

  def withdraw(amount, pin_code, account)
    case
    when insufficient_funds_in_account?(amount, account) then
      { status: false, message: 'insufficient funds in account', date: Date.today }
    when insufficient_funds_in_atm?(amount) then
      { status:false, message: 'insufficient funds in atm', date: Date.today }
    when incorrect_pin?(pin_code, account.pin_code) then
      { status: false, message: 'wrong pin', date: Date.today }
    when card_expired?(account.exp_date)
      { status: false, message: 'card expired', date: Date.today }
    else
      perform_transaction(amount, account)
    end
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

  def insufficient_funds_in_atm?(amount)
    @funds < amount
  end

  def incorrect_pin?(pin_code, actual_pin)
    pin_code != actual_pin
  end

  def card_expired?(exp_date)
    Date.strptime(exp_date, '%m/%y') < Date.today
  end

end
