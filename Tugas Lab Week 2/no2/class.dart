class BankAccount {
  double _balance;

  BankAccount(this._balance);

  // Getter for balance
  double get balance => _balance;

  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print('''Deposit $amount to Bank Account
New Balance: $_balance''');
    } else {
      print('Deposit amount must be positive.');
    }
  }

  void withdraw(double amount) {
    if (amount > 0) {
      if (amount <= _balance) {
        _balance -= amount;
        print('''Withdrawn $amount from Bank Account
New Balance: $_balance''');
      } else {
        print('Insufficient funds for withdrawal.');
      }
    } else {
      print('Withdrawal amount must be positive.');
    }
  }

  double checkBalance() {
    return _balance;
  }
}

class SavingsAccount extends BankAccount {
  double _interest;

  SavingsAccount(double initialBalance, this._interest) : super(initialBalance) {
    if (_interest < 0) {
      throw ArgumentError('Interest rate cannot be negative.');
    }
  }

  // Getter for interest
  double get interest => _interest;

  // Setter for interest with validation
  set interest(double newInterest) {
    if (newInterest < 0) {
      throw ArgumentError('Interest rate cannot be negative.');
    }
    _interest = newInterest;
  }

  void applyInterest() {
    double interestAmount = balance * _interest; // Use getter for balance
    deposit(interestAmount);
    print('Applied interest of $interestAmount. New balance: ${balance}');
  }
}
