class TransactionsController < ApplicationController
  # GET /transactions
  # GET /transactions.json
  def index
    @credits = Transaction.where("transaction_type = 'credit'")
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
    @transaction = Transaction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @transaction }
    end
  end

  # GET /transactions/new
  # GET /transactions/new.json

  def new
    @transaction = Transaction.new
    @account=Account.all.collect {|p| p.name }

 
  end

  # GET /transactions/1/edit
  def edit
    @transaction = Transaction.find(params[:id])
  end

  # POST /transactions
  # POST /transactions.json
  def create

  @account=Account.all.collect {|p| p.name }
    created= true
    msg=""
    if params[:credit] == params[:debit]
      msg="Credit and debit cant be on the same account"
      created=false
    else
      begin
        account_credit=Account.find_by_name params[:credit]
        account_debit=Account.find_by_name params[:debit]
        Transaction.make(account_credit.id,account_debit.id,Integer(params[:transaction][:amount]),params[:transaction][:note],current_user.id) 
      rescue Exception => e
      	created = false
        msg=e.message
      end
    end

    
    respond_to do |format|
      if created
        format.html { redirect_to transactions_path, notice: 'Transaction was successfully created.' }
        format.json { render json: transactions_path, status: :created, location: @transaction }
      else
        format.html { redirect_to new_transaction_path, notice:msg }
        format.json { render json: transactions_path, status: :created, location: @transaction }
      end
    end
  end

  # PUT /transactions/1
  # PUT /transactions/1.json
  def update
    @transaction = Transaction.find(params[:id])

    respond_to do |format|
      if @transaction.update_attributes(params[:transaction])
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy

    respond_to do |format|
      format.html { redirect_to transactions_url }
      format.json { head :no_content }
    end
  end
end
