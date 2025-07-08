import 'class_bank_account.dart';

class CurrentAccount extends BankAccount {
  double _overdraftLimit;

  CurrentAccount(String accountNumber, String accountHolder, double balance, this._overdraftLimit)
      : super(accountNumber, accountHolder, balance);

  double get overdraftLimit => _overdraftLimit;

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
    if (amount > 0 && (balance - amount) >= -_overdraftLimit) {
      updateBalance(-amount);
      print('Withdrawn: \$${amount.toStringAsFixed(2)}');
    } else {
      print('Invalid withdrawal amount or exceeds overdraft limit');
    }
  }

  @override
  void displayAccountInfo() {
    print('''
Current Account Information:
  Account Number: $accountNumber
  Account Holder: $accountHolder
  Balance: \$${balance.toStringAsFixed(2)}
  Overdraft Limit: \$${_overdraftLimit.toStringAsFixed(2)}
''');
  }
}

