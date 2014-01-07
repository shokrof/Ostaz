class TransactionsController < ApplicationController
  # GET /transactions
  # GET /transactions.json
  #~ def index
    #~ if params[:note] && !params[:note].empty?
      #~ @transactions =Transaction.find_all_by_note params[:note]
    #~ else
      #~ @transactions = Transaction.all
    #~ end
  #~ end

  # GET /transactions/1
  # GET /transactions/1.json
  #~ def show
    #~ @transaction = Transaction.find(params[:id])
#~ 
    #~ respond_to do |format|
      #~ format.html # show.html.erb
      #~ format.json { render json: @transaction }
    #~ end
  #~ end

  # GET /transactions/new
  # GET /transactions/new.json
#~ 
  #~ def new
    #~ @transaction = Transaction.new
    #~ @account=Account.all.collect {|p| p.name } 
  #~ end

  # GET /transactions/1/edit
  #~ def edit
    #~ @transaction = Transaction.find(params[:id])
  #~ end

  # POST /transactions
  # POST /transactions.json
  def create
  @account=Account.all.collect {|p| p.name }
    created= true
    msg=""
        account_credit=Account.find_by_name params[:transaction][:credit]
        account_debit=Account.find_by_name params[:transaction][:debit]
        params[:transaction][:file] =params[:file]
        params[:transaction].delete :credit
        params[:transaction].delete :debit
        params[:transaction][:account_id_credit]=account_credit.id
	params[:transaction][:account_id_debit]=account_debit.id
	params[:transaction][:user_id]=current_user.id
       p params[:transaction] 
       @t=Transaction.new params[:transaction]
                 
      respond_to do |format|
      if @t.save
        format.html { redirect_to root_path, notice: 'Account was successfully created.' }
        format.json { render json: @t, status: :created, location: @t }
      else
        format.html { redirect_to root_path }
        format.json { render json: @t.errors, status: :unprocessable_entity }
      end
    end

  end


  # PUT /transactions/1
  # PUT /transactions/1.json
  #~ def update
    #~ @transaction = Transaction.find(params[:id])
#~ 
    #~ respond_to do |format|
      #~ if @transaction.update_attributes(params[:transaction])
        #~ format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        #~ format.json { head :no_content }
      #~ else
        #~ format.html { render action: "edit" }
        #~ format.json { render json: @transaction.errors, status: :unprocessable_entity }
      #~ end
    #~ end
  #~ end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  #~ def destroy
    #~ @transaction = Transaction.find(params[:id])
    #~ @transaction.destroy
    #~ respond_to do |format|
      #~ format.html { redirect_to transactions_url }
      #~ format.json { head :no_content }
    #~ end
  #~ end
end
