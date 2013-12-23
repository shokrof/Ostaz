require 'spec_helper'

describe Transaction do
  before(:each) do
    AccountType.create({ name:"Asset" , sign:-1 ,credit:-1, debit:1})
    AccountType.create({ name:"Liabilities" , sign:1 ,credit:1, debit:-1})
    AccountType.create({ name:"Equity" , sign:1 ,credit:1, debit:-1})
    AccountType.create({ name:"Expenses" , sign:-1 ,credit:-1, debit:1})

    Account.create( {name:"Capital" ,amount:0,account_type_id:3})
    Account.create( {name:"Bank" ,amount:0,account_type_id:1})
    Account.create( {name:"Debit" ,amount:0,account_type_id:2})
    Account.create( {name:"Phone_bill" ,amount:0,account_type_id:4})
end
  
  it "should make the happy transactions"  do
	Account_bank =Account.find_by_name "Bank"
	Account_Capital=Account.find_by_name "Capital"
	Account_Debt=Account.find_by_name "Debit"
	Account_Phone_bill=Account.find_by_name "Phone_bill"
 
	Transaction.make(Account_Capital.id,Account_bank.id,100000,"put capital",1) 
        Account.valid.should eq true
        Transaction.make(Account_Debt.id,Account_bank.id,10000,"take a Debt",1)
	Account.valid.should eq true
        Transaction.make(Account_bank.id,Account_Phone_bill.id,100,"pay phone bill",1)
	Account.valid.should eq true
	Transaction.make(Account_bank.id,Account_Debt.id,5000,"pay part of the debt",1)
	Account.valid.should eq true
	(Account.find_by_name :Bank).amount.should eq 104900
     	(Account.find_by_name :Debit).amount.should eq 5000
        (Account.find_by_name :Phone_bill).amount.should eq 100
	(Account.find_by_name :Capital).amount.should eq 100000
  end


  it "should not be able to make transaction where we dont have enough cash" do
     Transaction.make(1,2,1000,"put some cash",1)
     expect {Transaction.make(2,4,100000,"try to make bigger transaction" ,1)}.to raise_error
     (Account.find 2 ).amount.should eq 1000
  end


end
