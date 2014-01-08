class EnoughMoneyValidator < ActiveModel::Validator
 def validate(record)
       if record.account_id_credit ==record.account_id_debit
		record.errors[:base] << "Cannot make transactions between the same account" 
       else
        account_credit=Account.find record.account_id_credit
        account_debit=Account.find record.account_id_debit
	amount=record.amount.to_i
       	if((account_credit.amount + amount*account_credit.account_type.credit)<0||(account_debit.amount + amount*account_debit.account_type.debit)<0)
            record.errors[:base] << "Accounts doesnt have enough money"
       	end
       end
 end
end

class Transaction < ActiveRecord::Base
  attr_accessible :account_id_credit,:account_id_debit, :amount, :note, :user_id 
  belongs_to :credit,class_name: "Account",foreign_key: "account_id_credit"
  belongs_to :debit,class_name: "Account", foreign_key: "account_id_debit"
  belongs_to :user
  attr_accessible :file
  has_attached_file :file, :styles => { :medium => "500x500>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_with EnoughMoneyValidator

  after_save do |transaction|
	account_credit=Account.find transaction.account_id_credit
	account_debit=Account.find transaction.account_id_debit
	account_credit.amount=account_credit.amount + amount*account_credit.account_type.credit
	account_debit.amount=account_debit.amount + amount*account_debit.account_type.debit
	account_credit.save
	account_debit.save
  end
  def self.make(account_id_credit ,account_id_debit ,amount , note,user_id)
       Transaction.create({account_id_credit:account_id_credit ,account_id_debit:account_id_debit,amount:amount,note:note,user_id:user_id})
  end

  #def self.all
  #  super.take_while{|t|can?(:read, Object.const_set(t.credit.account_type.name.classify, Class.new))&&can?(:read, Object.const_set(t.debit.account_type.name.classify, Class.new)) }
  
 # end
  
end


