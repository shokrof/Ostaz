class Transaction_output

  def initialize(a,type)
      if type == "credit"	
         @credit=a.amount.to_s
         @debit = ""
         @date_credit=a.created_at.to_s
         @note_credit=a.note
         @note_debit=""
         @date_debit=""
      elsif
         @debit=a.amount.to_s
         @credit=""
         @date_credit=""
         @note_credit=""
         @date_debit=a.created_at.to_s
         @note_debit=a.note
      end
      @date=a.created_at
      @note=a.note
  end


   def date
    @date
   end
  def date_debit
    @date_debit
  end

  def date_credit
    @date_credit
  end

  def note_debit
    @note_debit
  end

  def note_credit
    @note_credit
  end


  def credit
    @credit
  end
  
  def debit
     @debit
  end
end

class AccountsController < ApplicationController
load_and_authorize_resource
  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.all.select{|a| can?(:read,a.account_type)}
    @account_types=AccountType.all.select{|a| can?(:read,a)}.collect{|a| a.name}
    session[:project]=3
  end
  # GET /accounts/1
  # GET /accounts/1.json
  def show
    @account = Account.find(params[:id])
    @transactions =[]
    @account.transactions_credit.each {|t| @transactions.push(Transaction_output.new(t,"credit")) }
    @account.transactions_debit.each {|t| @transactions.push(Transaction_output.new(t,"debit")) }
    @transactions.sort_by! {|a| a.date }

 end

  # GET /accounts/new
  # GET /accounts/new.json
  def new
  end

  # GET /accounts/1/edit
  def edit
    @account = Account.find(params[:id])
  end

  # POST /accounts
  # POST /accounts.json
  def create
    params[:account][:account_type_id]=(AccountType.find_by_name params[:account][:account] ).id
    params[:account].delete :account
    params[:account][:project_id]=session[:project]
    @account=Account.new params[:account]
        respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
        format.json { render json: @account, status: :created, location: @account }
      else
        format.html { render action: "new" }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end

  end

  # PUT /accounts/1
  # PUT /accounts/1.json
 # def update
 #   @account = Account.find(params[:id])

  #  respond_to do |format|
    #  if @account.update_attributes(params[:account])
    #    format.html { redirect_to @account, notice: 'Account was successfully updated.' }
    #    format.json { head :no_content }
    #  else
    #    format.html { render action: "edit" }
   #     format.json { render json: @account.errors, status: :unprocessable_entity }
  #    end
 #   end
#  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
#  def destroy
 #   @account = Account.find(params[:id])
 #   @account.histories.each{|a| a.destroy}
#    @account.destroy
     
 #   respond_to do |format|
 #     format.html { redirect_to accounts_url }
 #     format.json { head :no_content }
 #   end
#  end
end
