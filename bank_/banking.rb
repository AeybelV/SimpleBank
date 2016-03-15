class Banking
    @@totalAccounts = 0
    @@accounts = {}
    @@balances = {}
    def initialize()
        
    end
    def createAccount(account,pin)
        @@accounts[account] = pin
        @@balances[account] = 100
        @accountBalance = @@balances[account]
        @@totalAccounts += 1
        @time = Time.now
        puts "Created account for '#{account}' at #{@time} with a starting balance of $#{@accountBalance}"
    end
    
    def displayTotalAccounts
       return @@totalAccounts
    end
    
    def deposit(account,pin,ammount)
        if @@accounts[account] == pin
            puts "Accessed Account '#{account}' depostied $#{ammount}"
            @@balances[account] += ammount.to_i
        else
           return  pinError
        end
    end
    
    def withdraw(account,pin,ammount)
        if @@accounts[account] == pin
            puts "Accessed Account '#{account}' withdrew $#{ammount}"
            @@balances[account] -= ammount.to_i
        else
           return  pinError
        end
    end
    
    def displayBalance(account,pin)
        if @@accounts[account] == pin
            puts "Accessed Account '#{account}', you have $#{@@balances[account]}"
        else
           return  pinError
        end
    end
    def changePin(account,pin,npin)
        if @@accounts[account] == pin
            puts "Changed Account: '#{account}' pin"
            @@accounts[account] = npin
        else
           return  pinError
        end
    end
    def delAccount(account,pin)
        if @@accounts[account] == pin
            puts "Removed account '#{account}'"
            @@accounts.delete(account)
            @@balances.delete(account)
            @@totalAccounts -= 1
        else
           return  pinError
        end
    end
    def ifLogIn(account,pin)
        if @@accounts[account] == pin
            return true
        else
            return false
        end
    end
    def pinError
        puts "DENIED:INCORRECT PIN OR ACCOUNT"
    end
end