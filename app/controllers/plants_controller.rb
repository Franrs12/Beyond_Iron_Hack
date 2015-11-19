class PlantsController < ApplicationController
  helper_method :sort_column, :sort_direction

  before_action :set_plant, only: [:show, :edit, :update, :destroy]

  # GET /plants
  # GET /plants.json
  def index
    #sort_column y sort_direction están en métodos privados, ABAJO
    @plants = Plant.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 4, :page => params[:page])
  end

  # GET /plants/1
  # GET /plants/1.json
  def show
  end

  # GET /plants/new
  def new
    @plant = Plant.new
  end

  # GET /plants/1/edit
  def edit
  end

  # POST /plants
  # POST /plants.json
  def create
    @plant = Plant.new(plant_params)

    respond_to do |format|
      if @plant.save
        format.html { redirect_to @plant, notice: 'Plant was successfully created.' }
        format.json { render :show, status: :created, location: @plant }
      else
        format.html { render :new }
        format.json { render json: @plant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plants/1
  # PATCH/PUT /plants/1.json
  def update
    respond_to do |format|
      if @plant.update(plant_params)
        format.html { redirect_to @plant, notice: 'Plant was successfully updated.' }
        format.json { render :show, status: :ok, location: @plant }
      else
        format.html { render :edit }
        format.json { render json: @plant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plants/1
  # DELETE /plants/1.json
  def destroy
    @plant.destroy
    respond_to do |format|
      format.html { redirect_to plants_url, notice: 'Plant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    @plants = Plant.search params[:search]
    render 'index'
  end

  private
    def sort_column
      Plant.column_names.include?(params[:sort]) ? params[:sort] : "common_name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"      
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_plant
      @plant = Plant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plant_params
      params.require(:plant).permit(:common_name, :scientific_name, :max_temp, :min_temp, :description, :url_image, :url_flower_image, :url_leaves_image, :watering)
    end
end
