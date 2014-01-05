class WelcomeController < ApplicationController
  def index
    @transactions = Transaction.all.reverse
    if params[:note] && !params[:note].empty?
      @transactions =Transaction.find_all_by_note params[:note].reverse
    end
    @account=Account.all.collect {|p| p.name }
  end
end
