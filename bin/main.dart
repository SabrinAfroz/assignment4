import "dart:io";

abstract class Account
{
  int? accountNumber;
  double? balance;

  Account(this.accountNumber, this.balance);

   deposit(double amount)
  {
    balance = balance! + amount;
  }
   withdraw(double amount);
}

class SavingsAccount extends Account
{
  double? interestsRate;
  SavingsAccount(super.accountNumber,super.balance, this.interestsRate);
  @override
   withdraw(double amount)
  {
    balance = (balance!-amount) * (1-interestsRate!);
  }

}
class CurrentAccount extends Account
{
  double? overdraftLimit;
  CurrentAccount(super.accountNumber, super.balance, this.overdraftLimit);

  @override
   withdraw(double amount)
  {
    if(amount <= overdraftLimit!)
      {
        balance = balance! - amount;
        return balance;
      }
    else
      {
        return "Insufficient Funds.";
      }
  }
}

void main()
{
  SavingsAccount customer1 = SavingsAccount(2874875, 40000.0, 0.10);
  print("Customer Account No : ${customer1.accountNumber}");
  print("Balance after deposit: ${customer1.deposit(500.0)}");
  print("Balance after withdraw: ${customer1.withdraw(300.0)}");


  CurrentAccount customer2 = CurrentAccount(17151089, 150000.0, 20000.0);
  print("\nCustomer Account No : ${customer2.accountNumber}");
  print("Balance after deposit: ${customer2.deposit(500.0)}");
  print("Balance after withdraw: ${customer2.withdraw(30000.0)}");
}