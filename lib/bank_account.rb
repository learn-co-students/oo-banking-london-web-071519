require 'pry'

class BankAccount

    #can initialize a Bank Account
    # initializes with a name
    # always initializes with balance of 1000
    # always initializes with a status of 'open'
    # can't change its name
    attr_reader :name
    attr_accessor :balance, :status
    
    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
    end

    #can deposit money into its account
    def deposit(money)
        @balance += money
    end

    #can display its balance
    def display_balance
        return "Your balance is $#{@balance}."
    end

    #is valid with an open status and a balance greater than 0
    def valid?
        @balance > 0 && @status == "open" 
    end

    #can close its account
    def close_account
        @status = "closed"
    end

end


