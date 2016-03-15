require_relative 'banking.rb'
class Interface
    @@banking_sys = Banking.new
    @@commands = {
        "help" => "Display avaliable commands",
        "create" => "Creates a account",
        "remove" => "Removes a account",
        "bank" => "Info about the bank",
        "login" => "Login to your account",
        "logout" => "logout from your account",
        "exit" => "Exit the banking application",
        "pin" => "Change pin of an account"
    }
    @@acommands = {
        "deposit" => "Deposit money",
        "withdraw" => "Withdraw money",
        "balance" => "Display Balance",
        "logout" => "Logout from your account"
    }
    def initialize(name)
        @@name = name
    end
    def startBank
        puts "Welcome to #{@@name}"
        askCmd
    end
    
    def askCmd
        print "||: "
        input = gets.chomp
        if input.downcase == "help"
            puts "Commands: "
            @@commands.each{|c,h|
                puts "#{c}  :   #{h}"
            }
            askCmd
        elsif input.downcase == "create"
            puts "Name for the new account: "
            name = gets.chomp
            puts "PIN for the new account: "
            pin = gets.chomp
            @@banking_sys.createAccount(name,pin)
            askCmd
        elsif input.downcase == "remove"
            puts "Account to remove: "
            name = gets.chomp
            puts "PIN for the account: "
            pin = gets.chomp
            @@banking_sys.delAccount(name,pin)
            askCmd
        elsif input.downcase == "logout"
            puts "You must be logged into a account before you can logout from it"
            askCmd
        elsif input.downcase == "login"
            puts "Account: "
            name = gets.chomp
            puts "PIN: "
            pin = gets.chomp
            if @@banking_sys.ifLogIn(name,pin)
                puts "Logged In"
                puts "Welcome, #{name}"
                logIn(name,pin)
            else
                @@banking_sys.pinError
                askCmd
            end
        elsif input.downcase == "pin"
            puts "Account to change: "
            name = gets.chomp
            puts "Old PIN for the account: "
            pin = gets.chomp
            puts "New PIN: "
            npin = gets.chomp
            @@banking_sys.changePin(name,pin,npin)
            askCmd
        elsif input.downcase == "bank"
            puts "#{@@name} has a total of #{@@banking_sys.displayTotalAccounts} accounts"
            askCmd
        elsif input.downcase == "exit"
            puts "Exiting"
        else
            puts "Unknown command '#{input.downcase}' type 'help' for more info"
            askCmd
        end
    end
    
    
    def logIn(account,pin)
        print "#{account}||: "
        input = gets.chomp
        if input.downcase == "help"
            puts "Commands: "
            @@acommands.each{|c,h|
                puts "#{c}  :   #{h}"
            }
            logIn(account,pin)
        elsif input.downcase == "balance"
            @@banking_sys.displayBalance(account,pin)
            logIn(account,pin)
        elsif input.downcase == "withdraw"
            puts "Ammount to withdraw (Only numbers): "
            ammount = gets.chomp
            @@banking_sys.withdraw(account,pin,ammount)
            logIn(account,pin)
        elsif input.downcase == "deposit"
            puts "Ammount to deposit"
            ammount = gets.chomp
            @@banking_sys.deposit(account,pin,ammount)
            logIn(account,pin)
        elsif input.downcase == "logout"
            puts "Logged Out"
            askCmd
        else
            puts "Unknown command '#{input.downcase}' type 'help' for more info"
            logIn(account,pin)
        end
    end
end