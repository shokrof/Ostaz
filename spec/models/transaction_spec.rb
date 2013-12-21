require 'spec_helper'

describe Transaction do
  before(:each) do
    AccountType.create({ name:"Asset" , sign:-1 ,credit:1, debit:-1})
    AccountType.create({ name:"Liabilities" , sign:1 ,credit:-1, debit:1})
    AccountType.create({ name:"Equity" , sign:1 ,credit:-1, debit:1})
    AccountType.create({ name:"Expenses" , sign:-1 ,credit:1, debit:-1})

    Account.create( {name:"Capital" ,amount:0,account_type_id:3})
    Account.create( {name:"Bank" ,amount:0,account_type_id:1})
    Account.create( {name:"Debt" ,amount:0,account_type_id:2})
    Account.create( {name:"Phone_bill" ,amount:0,account_type_id:4})
end
  
  it "should make the happy transactions"  do
pending "to be implemented" 
	Transaction.make(1,2,100000)#put capital 
        Account.valid.should_be true
        Transaction.make(3,2,10000)#take a Debt
	Account.valid.should_be true
        Transaction.make(2,4,100)#pay phone bill
	Account.valid.should_be true
	Transaction.make(2,3,5000)#pay part of the debt
	Account.valid.should_be true
	(Account.find_by_name :Capital).amount.should == 100000
     	(Account.find_by_name :Dept).amount.should == 5000
        (Account.find_by_name :Expenses).amount.should == 100
	(Account.find_by_name :Capital).amount.should == 104900
  end


  it "should not be able to make transaction where we dont have enough cash" do
pending "to be implemented " 
     Transaction.make(1,2,1000)#put some cash
     Transaction.make(2,4,100000).should_not be vaild
  end


end
