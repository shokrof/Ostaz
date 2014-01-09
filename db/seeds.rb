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

asset.accounts.create name:"Cash" , amount:0
asset.accounts.create name:"Bank" , amount:0
asset.accounts.create name:"Equipment" , amount:0
asset.accounts.create name:"Accounts Receivable" , amount:0

liabilities.accounts.create name:"Accounts Payable" ,amount:0
liabilities.accounts.create name:"Debt" ,amount:0

equity.accounts.create name:"Capital" , amount:0
equity.accounts.create name:"Revenue" , amount:0

expenses.accounts.create name:"Office Expenses" ,amount:0
expenses.accounts.create name:"Project Expenses" ,amount:0

role_admin=Role.create name:"admin"
user_admin=User.create email:"admin@ostaz.com",  password: "12345678" ,role_id:role_admin.id

AccountType.all.each{|a| RoleCanView.create role_id: role_admin.id ,account_type_id: a.id}


