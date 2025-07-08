abstract class BankAccount {
  String _accountNumber;
  String _accountHolder;
  double _balance;

  BankAccount(this._accountNumber, this._accountHolder, this._balance);

  // Getters for encapsulation
  String get accountNumber => _accountNumber;
  String get accountHolder => _accountHolder;
  double get balance => _balance;

  // Abstract methods
  void deposit(double amount);
  void withdraw(double amount);
  void displayAccountInfo();

  // Concrete method
  void updateBalance(double amount) {
    _balance += amount;
  }
}