import 'dart:io';
import 'class.dart';
void main() {
  print('Enter initial balance for your Savings Account:');
  double initialBalance = double.parse(stdin.readLineSync()!);
  
  print('Enter interest rate (as a decimal, e.g., 0.01 for 1%):');
  double interestRate = double.parse(stdin.readLineSync()!);

  // Create a SavingsAccount instance
  SavingsAccount savingsAccount = SavingsAccount(initialBalance, interestRate);

  // Display initial balance
  print('Initial Balance: ${savingsAccount.balance}');

  // Perform deposit
  print('Enter amount to deposit:');
  double depositAmount = double.parse(stdin.readLineSync()!);
  savingsAccount.deposit(depositAmount);

  // Perform withdrawal
  print('Enter amount to withdraw:');
  double withdrawAmount = double.parse(stdin.readLineSync()!);
  savingsAccount.withdraw(withdrawAmount);

  // Apply interest
  savingsAccount.applyInterest();

  // Check final balance
  print('Final Balance: ${savingsAccount.balance}');
}
