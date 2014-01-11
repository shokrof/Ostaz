class WelcomeController < ApplicationController
autocomplete :transaction, :note
   def index
    @trasaction =Transaction.new
    @transactions = Transaction.all
    if params[:transaction] && !params[:transaction][:note].empty?
      @transactions =Transaction.find_all_by_note params[:transaction][:note]
    end 
    @transactions=@transactions.select{|a| can?( :read, a.debit.account_type) && can?( :read ,a.credit.account_type) }.reverse
     @account=Account.all.select{|a| can?(:manage,a.account_type)}.collect{|a| a.name}
   # @account=Account.select{|a| can? }.collect {|p| if can?(:read, p.account_type) then  p.name }
  end
end
