class WelcomeController < ApplicationController
  def index
    @transactions = Transaction.all
    if params[:note] && !params[:note].empty?
      @transactions =Transaction.find_all_by_note params[:note]
    end
    @transactions.reverse!
    @account=Account.all.collect {|p| p.name }
  end
end
