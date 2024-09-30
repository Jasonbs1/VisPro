class ATM {
  double _balance;


  ATM(this._balance);



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

void main() {
  
}