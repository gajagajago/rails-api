class Api::V1::TransactionsController < ApplicationController
  def index
    @transaction = Transaction.all

    render json: @transaction
  end

  def show
    @transaction = Transaction.find(params[:id])

    render json: @transaction
  end

  def create
    @transaction = Transaction.new(transaction_params)

    if @transaction.save
      json_response("successfully saved transaction", true, { transaction: @transaction }, 200)
    else
      json_response("transaction save failed", false, {}, 500)
    end
  end

  def update

  end

  def destroy

  end

  private
  def transaction_params
    params.require(:transaction).permit(:title, :amount, :date)
  end
end
