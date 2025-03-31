class LinesController < ApplicationController
  def show
    text = FileReader.instance.read_line(params[:line].to_i)
    
    if text
      render json: { text: }, status: :ok
    else
      render json: { error: " Content too large" }, status: :content_too_large
    end
  end
end
