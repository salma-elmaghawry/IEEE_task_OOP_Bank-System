import 'dart:io';
import 'class_bank.dart';
import 'class_current_account.dart';
import 'class_savings_account.dart';

void main() {
  final bank = Bank();
  bool running = true;

  print('=== Bank Management System ===');

  while (running) {
    print('\nMenu:');
    print('1. Create Savings Account');
    print('2. Create Current Account');
    print('3. Deposit');
    print('4. Withdraw');
    print('5. Display Account Info');
    print('6. Display All Accounts');
    print('7. Apply Interest (Savings Account)');
    print('8. Exit');
    stdout.write('Enter your choice: ');

    var choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write('Enter account number: ');
        var accNumber = stdin.readLineSync() ?? '';
        stdout.write('Enter account holder name: ');
        var accHolder = stdin.readLineSync() ?? '';
        stdout.write('Enter initial balance: ');
        var balance = double.tryParse(stdin.readLineSync() ?? '0') ?? 0;
        stdout.write('Enter interest rate (%): ');
        var interestRate = double.tryParse(stdin.readLineSync() ?? '0') ?? 0;
        
        var account = SavingsAccount(accNumber, accHolder, balance, interestRate);
        bank.addAccount(account);
        break;

      case '2':
        stdout.write('Enter account number: ');
        var accNumber = stdin.readLineSync() ?? '';
        stdout.write('Enter account holder name: ');
        var accHolder = stdin.readLineSync() ?? '';
        stdout.write('Enter initial balance: ');
        var balance = double.tryParse(stdin.readLineSync() ?? '0') ?? 0;
        stdout.write('Enter overdraft limit: ');
        var overdraft = double.tryParse(stdin.readLineSync() ?? '0') ?? 0;
        
        var account = CurrentAccount(accNumber, accHolder, balance, overdraft);
        bank.addAccount(account);
        break;

      case '3':
        stdout.write('Enter account number: ');
        var accNumber = stdin.readLineSync() ?? '';
        var account = bank.findAccount(accNumber);
        
        if (account != null) {
          stdout.write('Enter amount to deposit: ');
          var amount = double.tryParse(stdin.readLineSync() ?? '0') ?? 0;
          account.deposit(amount);
        } else {
          print('Account not found');
        }
        break;

      case '4':
        stdout.write('Enter account number: ');
        var accNumber = stdin.readLineSync() ?? '';
        var account = bank.findAccount(accNumber);
        
        if (account != null) {
          stdout.write('Enter amount to withdraw: ');
          var amount = double.tryParse(stdin.readLineSync() ?? '0') ?? 0;
          account.withdraw(amount);
        } else {
          print('Account not found');
        }
        break;

      case '5':
        stdout.write('Enter account number: ');
        var accNumber = stdin.readLineSync() ?? '';
        var account = bank.findAccount(accNumber);
        
        if (account != null) {
          account.displayAccountInfo();
        } else {
          print('Account not found');
        }
        break;

      case '6':
        bank.displayAllAccounts();
        break;

      case '7':
        stdout.write('Enter account number: ');
        var accNumber = stdin.readLineSync() ?? '';
        var account = bank.findAccount(accNumber);
        
        if (account is SavingsAccount) {
          account.applyInterest();
        } else if (account != null) {
          print('This is not a savings account.');
        } else {
          print('Account not found');
        }
        break;

      case '8':
        running = false;
        print('Exiting Bank Management System. Goodbye!');
        break;

      default:
        print('Invalid choice. Please try again.');
    }
  }
}