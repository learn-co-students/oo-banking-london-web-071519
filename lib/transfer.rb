require 'pry'

class Transfer

  # can initialize a Transfer 
  # initializes with a sender 
  # initializes with a receiver 
  # always initializes with a status of 'pending'
  # initializes with a transfer amount
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  # can check that both accounts are valid
  # calls on the sender and receiver's #valid? methods

def valid?
  sender.valid? & receiver.valid?
end
  
# can execute a successful transaction between two accounts 
# each transfer can only happen once 
# rejects a transfer if the sender does not have enough funds (does not have a valid account) 

def reject_transfer
  self.status = "rejected"
  return "Transaction rejected. Please check your account balance."
end

# can execute a successful transaction between two accounts
# each transfer can only happen once 
# rejects a transfer if the sender does not have enough funds (does not have a valid account)

def execute_transaction
  if valid? && sender.balance > amount && self.status == "pending"
    sender.balance -= amount
    receiver.balance += amount
    self.status = "complete"
  else
    reject_transfer
  end
end

# can reverse a transfer between two accounts
# it can only reverse executed transfer
def reverse_transfer
  if valid? && sender.balance > amount && self.status == "complete"
    receiver.balance -= amount
    sender.balance += amount
    self.status = "reversed"
  else
    reject_transfer
  end
end

end


