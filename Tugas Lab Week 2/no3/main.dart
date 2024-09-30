import 'class.dart'; 

void main() {
  ATM atm = ATM(1000);  // Initialize ATM with an initial balance

  // Display initial balance
  print('Initial Balance: ${atm.checkBalance()}');

  // Perform deposit
  print('Enter amount to deposit:');
  double depositAmount = 200; // For demonstration purposes; replace with user input if desired
  atm.deposit(depositAmount);

  // Perform withdrawal
  print('Enter amount to withdraw:');
  double withdrawAmount = 150; // For demonstration purposes; replace with user input if desired
  atm.withdraw(withdrawAmount);

  // Check final balance
  print('Final Balance: ${atm.checkBalance()}');
}
