import 'class_bank_account.dart';

class Bank {
  List<BankAccount> _accounts = [];

  void addAccount(BankAccount account) {
    _accounts.add(account);
    print('Account ${account.accountNumber} added successfully.');
  }

  BankAccount? findAccount(String accountNumber) {
    for (var account in _accounts) {
      if (account.accountNumber == accountNumber) {
        return account;
      }
    }
    return null;
  }

  void displayAllAccounts() {
    if (_accounts.isEmpty) {
      print('No accounts in the bank.');
      return;
    }
    
    print('\nAll Bank Accounts:');
    for (var account in _accounts) {
      account.displayAccountInfo();
    }
  }
}