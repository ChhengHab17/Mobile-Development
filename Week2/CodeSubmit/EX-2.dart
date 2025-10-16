class BankAccount {
    // TODO
    int accountId;
    String accountOwner;
    double _balance;

    BankAccount(this.accountId, this.accountOwner) : _balance = 0.0;

    double get balance => _balance;

    void withdraw(double amount){
      if(amount > _balance){
        throw Exception("Insufficient balance for withdrawal!");
      }
      _balance -= amount;
      print("Withdraw \$${amount} from account $accountId. New balance: \$${_balance}");
    }
    void credit(double amount){
      _balance += amount;
      print("Added credit \$${amount} to account $accountId. New balance: \$${_balance}");
    }
}

class Bank {
    // TODO
    String name;
    List<BankAccount> _accounts;

    Bank({required this.name}) : _accounts = [];

    BankAccount createAccount(int accountId, String accountOwner){
      if(_accounts.any((account) => account.accountId == accountId)){
        throw Exception("Account with ID $accountId already exists!");
      }
      BankAccount newAccount = BankAccount(accountId, accountOwner);
      _accounts.add(newAccount);
      return newAccount;
    }

}
 
void main() {

  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
