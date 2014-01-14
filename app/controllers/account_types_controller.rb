class AccountTypesController < ApplicationController
  load_and_authorize_resource
  # GET /account_types
  # GET /account_types.json
  def index
    @account_types = AccountType.all.select{|a| can?(:read,a)}
    @accounts_sum={}
    @account_types.each do |a|
     sum=0
     a.accounts.each{|acc| sum+=acc.amount}
     @accounts_sum[a.name]=sum
    end
  end

  # GET /account_types/1
  # GET /account_types/1.json
   def show
     @account = AccountType.find(params[:id])
 
    #~ respond_to do |format|
      #~ format.html # show.html.erb
      #~ format.json { render json: @account_type }
    #~ end
    end

  # GET /account_types/new
  # GET /account_types/new.json
  def new
    @account_type = AccountType.new
  end

  # GET /account_types/1/edit
  #~ def edit
    #~ @account_type = AccountType.find(params[:id])
  #~ end

  # POST /account_types
  # POST /account_types.json
  def create

    like=AccountType.find_by_name params[:account][:like]
    params[:account_type][:credit]=like.credit
    params[:account_type][:debit]=like.debit
  
    @account_type = AccountType.new(params[:account_type])
    respond_to do |format|
      if @account_type.save
        current_user.role.role_can_edit.create :account_type_id => @account_type.id
        format.html { redirect_to @account_type, notice: 'Account type was successfully created.' }
        format.json { render json: @account_type, status: :created, location: @account_type }
      else
        format.html { render action: "new" }
        format.json { render json: @account_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /account_types/1
  # PUT /account_types/1.json
  #~ def update
    #~ @account_type = AccountType.find(params[:id])
#~ 
    #~ respond_to do |format|
      #~ if @account_type.update_attributes(params[:account_type])
        #~ format.html { redirect_to @account_type, notice: 'Account type was successfully updated.' }
        #~ format.json { head :no_content }
      #~ else
        #~ format.html { render action: "edit" }
        #~ format.json { render json: @account_type.errors, status: :unprocessable_entity }
      #~ end
    #~ end
  #~ end

  # DELETE /account_types/1
  # DELETE /account_types/1.json
 # def destroy
   # @account_type = AccountType.find(params[:id])
   # @account_type.accounts.each{|a| a.destroy}
   # @account_type.destroy
   # respond_to do |format|
   #   format.html { redirect_to account_types_url }
  #    format.json { head :no_content }
 #   end
#  end
end
