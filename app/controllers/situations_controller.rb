class SituationsController < ApplicationController
  before_action :set_situation, only: %i[ show update destroy ]

  # GET /situations
  def index
    @situations = Situation.all

    render json: @situations
  end

  # GET /situations/1
  def show
    render json: @situation
  end

  # POST /situations
  def create
    @situation = Situation.new(situation_params)

    if @situation.save
      render json: @situation, status: :created, location: @situation
    else
      render json: @situation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /situations/1
  def update
    if @situation.update(situation_params)
      render json: @situation
    else
      render json: @situation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /situations/1
  def destroy
    @situation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_situation
      @situation = Situation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def situation_params
      params.require(:situation).permit(:name)
    end
end
