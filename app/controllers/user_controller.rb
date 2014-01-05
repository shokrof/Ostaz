class UserController < ApplicationController
  def show
   @user=User.find params[:id]
   if params[:note] && !params[:note].empty?
     t =Transaction.find_all_by_note params[:note]
   else
     t = Transaction.all
   end
    @transactions=[]
    t.each {|ct| if ct.user_id == @user.id then @transactions.push ct end }
  end

  def index
  end
end
