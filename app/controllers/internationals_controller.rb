class InternationalsController < ApplicationController
  before_action :set_international, only: [:show, :edit, :update, :destroy]

  def index
    @internationals = International.all
  end

  def show
    @internationals = International.all
    @other_internationals = International.other_internationals(params[:id])
  end

  def new
    @international = International.new
  end

  def edit
  end

  def create
    @international = International.new(international_params)

    respond_to do |format|
      if @international.save
        format.html { redirect_to root_path, notice: 'International was successfully created.' }
        format.json { render :show, status: :created, location: @international }
      else
        format.html { render :new }
        format.json { render json: @international.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @international.update(international_params)
        format.html { redirect_to @international, notice: 'International was successfully updated.' }
        format.json { render :show, status: :ok, location: @international }
      else
        format.html { render :edit }
        format.json { render json: @international.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @international.destroy
    respond_to do |format|
      format.html { redirect_to internationals_url, notice: 'International was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_international
      @international = International.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def international_params
      params.require(:international).permit(:name, :country)
    end
end
