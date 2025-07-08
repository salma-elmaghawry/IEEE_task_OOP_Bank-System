import 'class_bank_account.dart';

class SavingsAccount extends BankAccount {
  double _interestRate;

  SavingsAccount(String accountNumber, String accountHolder, double balance, this._interestRate)
      : super(accountNumber, accountHolder, balance);

  double get interestRate => _interestRate;

  @override
  void deposit(double amount) {
    if (amount > 0) {
      updateBalance(amount);
      print('Deposited: \$${amount.toStringAsFixed(2)}');
    } else {
      print('Invalid deposit amount');
    }
  }

  @override
  void withdraw(double amount) {
    if (amount > 0 && amount <= balance) {
      updateBalance(-amount);
      print('Withdrawn: \$${amount.toStringAsFixed(2)}');
    } else {
      print('Invalid withdrawal amount or insufficient funds');
    }
  }

  void applyInterest() {
    double interest = balance * _interestRate / 100;
    updateBalance(interest);
    print('Interest applied: \$${interest.toStringAsFixed(2)}');
  }

  @override
  void displayAccountInfo() {
    print('''
Savings Account Information:
  Account Number: $accountNumber
  Account Holder: $accountHolder
  Balance: \$${balance.toStringAsFixed(2)}
  Interest Rate: ${_interestRate}%
''');
  }
}