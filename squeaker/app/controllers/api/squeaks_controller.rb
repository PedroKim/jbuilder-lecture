class Api::SqueaksController < ApplicationController
  def index
    # debugger
    @squeaks = Squeak.all
    render json: @squeaks
  end

  def create
    @squeak = Squeak.new(squeak_params)
    debugger
    if @squeak.save
      render json: @squeak
    else
      render json: @squeak.errors.full_messages, status: 422
    end
  end

  private

  def squeak_params
    params.require(:squeak).permit(:body, :author_id)
  end
end