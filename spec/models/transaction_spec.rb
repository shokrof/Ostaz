require 'spec_helper'


describe Transaction do
  before(:each) do
 load Rails.root + "db/seeds.rb"
end
  it "should make the happy transactions"  do
	Account_bank =Account.find_by_name "Bank"
	Account_Capital=Account.find_by_name "Capital"
	Account_Debt=Account.find_by_name "Debt"
	Account_Phone_bill=Account.find_by_name "Project Expenses"
 
	Transaction.make(Account_Capital.id,Account_bank.id,100000,"put capital",1) 
        Account.valid.should eq true
        Transaction.make(Account_Debt.id,Account_bank.id,10000,"take a Debt",1)
	Account.valid.should eq true
        Transaction.make(Account_bank.id,Account_Phone_bill.id,100,"pay phone bill",1)
	Account.valid.should eq true
	Transaction.make(Account_bank.id,Account_Debt.id,5000,"pay part of the debt",1)
	Account.valid.should eq true
#	(Account.find_by_name :Bank).amount.should eq 104900
 #    	(Account.find_by_name :Debt).amount.should eq 5000
  #      (Account.find_by_name "Project Expenses").amount.should eq 100
#	(Account.find_by_name :Capital).amount.should eq 100000
  end


#  it "should not be able to make transaction where we dont have enough cash" do
 #    Account_bank =Account.find_by_name "Bank"
 #  Account_Debt =Account.find_by_name "Debt"


  #   Old_bank_value=Account_bank.amount
  #   Old_debt_value=Account_Debt.amount

   #  Transaction.make(Account_bank.id,Account_Debt.id,2000000,"put some cash",1)
  #   Account_bank.amount.should eq Old_bank_value
 #` end


end
