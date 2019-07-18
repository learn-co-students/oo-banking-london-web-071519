class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status
  attr_reader
  attr_writer

    def initialize(sender, receiver, amt)
      @sender = sender
      @receiver = receiver
      @amount = amt
      @status = "pending"
    end

    def valid?
      self.sender.valid? && self.receiver.valid?
    end

    def execute_transaction
      if self.status == "pending" && self.sender.balance - amount > 0 && self.valid?
        self.sender.balance -= amount
        self.receiver.balance += amount
        self.status = "complete"
      else
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      end

    end

    def reverse_transfer
      if self.status == "complete"
        self.receiver.balance -= amount
        self.sender.balance += amount
        self.status = "reversed"
      end
    end

end
