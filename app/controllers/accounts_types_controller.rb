class AccountsTypesController < ApplicationController
  # GET /accounts_types
  # GET /accounts_types.json
  def index
    @accounts_types = AccountsType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @accounts_types }
    end
  end

  # GET /accounts_types/1
  # GET /accounts_types/1.json
  def show
    @accounts_type = AccountsType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @accounts_type }
    end
  end

  # GET /accounts_types/new
  # GET /accounts_types/new.json
  def new
    @accounts_type = AccountsType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @accounts_type }
    end
  end

  # GET /accounts_types/1/edit
  def edit
    @accounts_type = AccountsType.find(params[:id])
  end

  # POST /accounts_types
  # POST /accounts_types.json
  def create
    @accounts_type = AccountsType.new(params[:accounts_type])

    respond_to do |format|
      if @accounts_type.save
        format.html { redirect_to @accounts_type, notice: 'Accounts type was successfully created.' }
        format.json { render json: @accounts_type, status: :created, location: @accounts_type }
      else
        format.html { render action: "new" }
        format.json { render json: @accounts_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /accounts_types/1
  # PUT /accounts_types/1.json
  def update
    @accounts_type = AccountsType.find(params[:id])

    respond_to do |format|
      if @accounts_type.update_attributes(params[:accounts_type])
        format.html { redirect_to @accounts_type, notice: 'Accounts type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @accounts_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts_types/1
  # DELETE /accounts_types/1.json
  def destroy
    @accounts_type = AccountsType.find(params[:id])
    @accounts_type.destroy

    respond_to do |format|
      format.html { redirect_to accounts_types_url }
      format.json { head :no_content }
    end
  end
end
