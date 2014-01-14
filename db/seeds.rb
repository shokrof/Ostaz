# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
equity=AccountType.create name:"Equity" , sign:1 , credit:1 , debit:-1
asset=AccountType.create name:"Asset" , sign:-1 , credit:-1 , debit:1
liabilities=AccountType.create name:"Liabilities" , sign:1 , credit:1 , debit:-1
expenses=AccountType.create name:"Expenses" , sign:-1 , credit:-1 , debit:1

cash=asset.accounts.create name:"Cash" , amount:0
asset.accounts.create name:"Bank" , amount:0
equ=asset.accounts.create name:"Equipment" , amount:0
asset.accounts.create name:"Accounts Receivable" , amount:0

liabilities.accounts.create name:"Accounts Payable" ,amount:0
debt=liabilities.accounts.create name:"Debt" ,amount:0

capital=equity.accounts.create name:"Capital" , amount:0
equity.accounts.create name:"Revenue" , amount:0

expenses.accounts.create name:"Office Expenses" ,amount:0
expenses.accounts.create name:"Project Expenses" ,amount:0

role_admin=Role.create name:"admin"
user_admin=User.create email:"admin@ostaz.com",  password: "12345678" ,role_id:role_admin.id

AccountType.all.each{|a| RoleCanView.create role_id: role_admin.id ,account_type_id: a.id}

role_assit =Role.create name:"assit"
user_assit=User.create email:"assit@ostaz.com" ,password: "87654321" ,role_id:role_assit.id

role_assit.role_can_edit.create account_type_id: equity.id
role_assit.role_can_edit.create account_type_id:  asset.id
role_assit.role_can_edit.create account_type_id:  liabilities.id
Transaction.make(capital.id,cash.id,10000,"Put some money in the bussiness",user_assit.id)
Transaction.make(cash.id,equ.id,100,"buy some equ by cash",user_assit.id)
Transaction.make(debt.id,equ.id,200,"buy some equ by debt",user_assit.id)
Transaction.make(cash.id,debt.id,50,"pay part of the debt",user_assit.id)



Transaction.make(capital.id,cash.id,10000,"Put Some in the bussiness ",user_admin.id)



