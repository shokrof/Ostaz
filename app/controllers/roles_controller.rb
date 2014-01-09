class RolesController < ApplicationController
load_and_authorize_resource
  # GET /roles
  # GET /roles.json
  def index
    @roles = Role.all.select{|a| can?(:read,a)}
  end

  # GET /roles/1
  # GET /roles/1.json
  def show
    @role = Role.find(params[:id])
  end

  # GET /roles/new
  # GET /roles/new.json
  def new
    @role = Role.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @role }
    end
  end

  # GET /roles/1/edit
  def edit
    @role = Role.find(params[:id])
    @account_types=AccountType.all.collect{|a| [a.name,a.id]}
  end

  # POST /roles
  # POST /roles.json
  def create
    @role = Role.new(params[:role])
    respond_to do |format|
      if @role.save
        format.html { redirect_to @role, notice: 'Role was successfully created.' }
        format.json { render json: @role, status: :created, location: @role }
      else
        format.html { render action: "new" }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

 def add_ability
    @role = Role.find(params[:id])
    if params[:role][:id] == "Edit"
       @role.role_can_edit.create :account_type_id => params[:role][:name].to_i
    else
       @role.role_can_view.create :account_type_id =>  params[:role][:name].to_i
    end
    redirect_to role_path(@role.id)
 end
 def delete_view_ability
    @role =Role.find(params[:id])
    @role.role_can_view.find{|a| a.account_type_id = params[:account_type_id]}.destroy
    redirect_to role_path(@role.id)
 end
 def delete_edit_ability
    @role =Role.find(params[:id])
    @role.role_can_edit.find{|a| a.account_type_id = params[:account_type_id]}.destroy
    redirect_to role_path(@role.id)
 end


  # PUT /roles/1
  # PUT /roles/1.json
  def update

   # respond_to do |format|
  #    if @role.update_attributes(params[:role])
       # format.html { redirect_to @role, notice: 'Role was successfully updated.' }
      #  format.json { head :no_content }
     # else
      #  format.html { render action: "edit" }
     #   format.json { render json: @role.errors, status: :unprocessable_entity }
    #  end
   # end
  end

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
    @role = Role.find(params[:id])
    @role.destroy
    respond_to do |format|
      format.html { redirect_to roles_url }
      format.json { head :no_content }
    end
  end


end
