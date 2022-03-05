// Write your code below 🏦
struct SwiftBank {
// Static properties
static let depositBonusRate = 0.01

 //Static Properties
 //  static let depositBonusRate = 0.01

//Counter used to keep track if a $1000 deposit has or has not been made.
   var depositBonusCounter = 0

// Private properties

  private let password: String 

  private var balance : Double = 0 {
        didSet {
            if balance < 100 {
                displayLowBalanceMessage()
            }
        }
  }

// Initializers

   init(initialDeposit: Double, password: String) {
   self.password = password
       if depositBonusCounter == 0 {
     if initialDeposit >= 1000 {
       let initialdepositWithBonus = initialDeposit + (SwiftBank.depositBonusRate * initialDeposit)
       self.balance += initialdepositWithBonus
       self.depositBonusCounter += 1
       return
     }
   }
   if initialDeposit <= 0 {
   print("You cannot make an initial deposit of $\(initialDeposit). Your deposit must be a positive amount.")
   return
   }
     print("Making a $\(initialDeposit) deposit")
     self.balance += initialDeposit
   }


// Private methods

  private func isValid(_ enteredPassword: String) -> Bool {
    if enteredPassword == password {
      return true
    } else {
      return false
    }
  }

  private func finalDepositWithBonus(fromInitialDeposit deposit: Double) -> Double {
      return deposit + (deposit * SwiftBank.depositBonusRate)
  }

  private func displayLowBalanceMessage() {
    print("Alert: Your balance is under $100.")
  }

// Internal methods

mutating func makeDeposit(ofAmount depositAmount: Double) {
   if depositBonusCounter == 0 {
    if depositAmount >= 1000 {
     let depositWithBonus = depositAmount + (depositAmount * SwiftBank.depositBonusRate)
   print("Making a $\(depositWithBonus) deposit")
   self.balance += depositWithBonus
   self.depositBonusCounter += 1
   return
   }
   }
   if depositAmount <= 0{
   print("You cannot make a deposit amount of $\(depositAmount). Your deposit amount must be positive.")
   return
   }
     print("Making a $\(depositAmount) deposit")
     self.balance += depositAmount
}


   mutating func makeWithdrawal(ofAmount withdrawalAmount: Double, usingPassword password: String) {
  if isValid(password) {
    if withdrawalAmount <= 0 {
      print("You cannot withdraw $\(withdrawalAmount). Withdrawal amount must be positive.")
    return
    }
    else if withdrawalAmount > balance {
    print("You cannot make a withdrawal of $\(withdrawalAmount) because you have an insufficient balance.")
     return
     }
    else if withdrawalAmount <= balance {
    print("Making a $\(withdrawalAmount) withdrawal.")
    self.balance -= withdrawalAmount
    return
    }
    }
  else {
    print("Error: Invalid password. Cannot make withdrawal.")
  }
}

    func displayBalance(usingPassword password: String) {
      if !isValid(password) {
        print("Error: Invalid password. Cannot retrieve balance.")
        return 
      } else {
        print("Your current balance is $\(balance).")
      }
    }
}

var myAccount = SwiftBank(initialDeposit: 500.00, password: "TiddlyWinks")
myAccount.makeDeposit(ofAmount: 50.00)
myAccount.makeWithdrawal(ofAmount: 100.00, usingPassword: "Fiddlesticks")
myAccount.makeWithdrawal(ofAmount: 100.00, usingPassword: "TiddlyWinks")
myAccount.displayBalance(usingPassword: "TiddlyWinks")
myAccount.makeDeposit(ofAmount: -25)
myAccount.makeDeposit(ofAmount: 0)
myAccount.makeWithdrawal(ofAmount: -25, usingPassword: "TiddlyWinks")
myAccount.makeWithdrawal(ofAmount: 0, usingPassword: "TiddlyWinks")
myAccount.makeWithdrawal(ofAmount: 1500, usingPassword: "TiddlyWinks")

