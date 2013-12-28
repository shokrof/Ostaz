class Transaction < ActiveRecord::Base
  attr_accessible :account_id_credit,:account_id_debit, :amount, :note, :user_id 
  belongs_to :credit,class_name: "Account",foreign_key: "account_id_credit"
  belongs_to :debit,class_name: "Account", foreign_key: "account_id_debit"
  belongs_to :user

  def self.make(account_id_credit ,account_id_debit ,amount , note,user_id)

#	account_credit=Account.find account_id_credit

#	account_debit=Account.find account_id_debit

  #      if((account_credit.amount + amount*account_credit.account_type.credit)<0||(account_debit.amount + amount*account_debit.account_type.debit)<0)
 #           raise "There is no enough money in the account"
#	end

#	account_debit.histories.create({account_id:account_id_debit,amount:account_debit.amount})
##	account_credit.histories.create({account_id:account_id_credit ,amount:account_credit.amount})
#	account_credit.amount=account_credit.amount + amount*account_credit.account_type.credit
#	account_debit.amount=account_debit.amount + amount*account_debit.account_type.debit
#	account_credit.save
#	account_debit.save



 # 	t_credit=Transaction.new({account_id:account_id_credit ,amount:amount ,user_id:user_id ,note:note, transaction_type:"credit" })
#	t_debit=Transaction.new({account_id:account_id_debit ,amount:amount ,user_id:user_id ,note:note, transaction_type:"debit" })
#	t_credit.save
#	t_debit.save
#	t_credit.transaction_id=t_debit.id
#	t_debit.transaction_id=t_credit.id
#	t_credit.save
#	t_debit.save
	
  end


end
