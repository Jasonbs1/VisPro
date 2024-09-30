class BankAccount {
  double _balance;

  BankAccount(this._balance);

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

  void applyInterest() {
    double interest = _balance * _interest;
    deposit(interest);
    print('Applied interest of $interest. New balance: $_balance');
  }
}

void main() {
  
}
