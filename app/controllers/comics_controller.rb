# frozen_string_literal: true

class ComicsController < OpenReadController
  before_action :set_comic, only: %i[show update destroy]

  # GET /comics
  def index
    @comics = current_user.comics.all

    render json: @comics
  end

  # GET /comics/1
  def show
    render json: @comic
  end

  # POST /comics
  def create
    @comic = current_user.comics.build(comic_params)

    if @comic.save
      render json: @comic, status: :created
    else
      render json: @comic.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comics/1
  def update
    if @comic.update(comic_params)
      render json: @comic
    else
      render json: @comic.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comics/1
  def destroy
    @comic.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comic
      @comic = current_user.comics.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comic_params
      params.require(:comic).permit(:issue, :title, :user_id)
    end
end
