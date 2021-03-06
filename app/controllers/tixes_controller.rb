class TixesController < ApplicationController

	def index
		@tixes = Tix.all 
	end

 	def create
	  @tix = Tix.new(tix_params)

	  if @tix.save
	    render json: @tix
	  else
	    render json: @tix.errors, status: :unprocessable_entity
	  end
  end

  def update
    @tix = Tix.find(params[:id])
    if @tix.update(tix_params)
      render json: @tix
    else
      render json: @tix.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @tix = Tix.find(params[:id])
    @tix.destroy
    head :no_content
  end


 	private

    def tix_params
      params.require(:tix).permit(:tag, :task, :date, :comment, :priority, :user_id)
    end

	
end
