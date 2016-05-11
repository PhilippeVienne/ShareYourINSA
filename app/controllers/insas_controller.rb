class InsasController < ApplicationController
  before_action :set_insa, only: [:show, :edit, :update, :destroy]

  # GET /insas
  # GET /insas.json
  def index
    @insas = Insa.all
  end

  # GET /insas/1
  # GET /insas/1.json
  def show
  end

  # GET /insas/new
  def new
    @insa = Insa.new
  end

  # GET /insas/1/edit
  def edit
  end

  # POST /insas
  # POST /insas.json
  def create
    @insa = Insa.new(insa_params)

    respond_to do |format|
      if @insa.save
        format.html { redirect_to @insa, notice: 'Insa was successfully created.' }
        format.json { render :show, status: :created, location: @insa }
      else
        format.html { render :new }
        format.json { render json: @insa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /insas/1
  # PATCH/PUT /insas/1.json
  def update
    respond_to do |format|
      if @insa.update(insa_params)
        format.html { redirect_to @insa, notice: 'Insa was successfully updated.' }
        format.json { render :show, status: :ok, location: @insa }
      else
        format.html { render :edit }
        format.json { render json: @insa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /insas/1
  # DELETE /insas/1.json
  def destroy
    @insa.destroy
    respond_to do |format|
      format.html { redirect_to insas_url, notice: 'Insa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_insa
      @insa = Insa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def insa_params
      params.require(:insa).permit(:name, :location)
    end
end
