class BasesController < ApplicationController
  before_action :set_basis, only: %i[ show edit update destroy ]

  # GET /bases or /bases.json
  def index
    @bases = Base.all
  end

  # GET /bases/1 or /bases/1.json
  def show
  end

  # GET /bases/new
  def new
    @basis = Base.new
  end

  # GET /bases/1/edit
  def edit
  end

  # POST /bases or /bases.json
  def create
    @basis = Base.new(basis_params)

    respond_to do |format|
      if @basis.save
        format.html { redirect_to basis_url(@basis), notice: "Base was successfully created." }
        format.json { render :show, status: :created, location: @basis }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @basis.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bases/1 or /bases/1.json
  def update
    respond_to do |format|
      if @basis.update(basis_params)
        format.html { redirect_to basis_url(@basis), notice: "Base was successfully updated." }
        format.json { render :show, status: :ok, location: @basis }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @basis.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bases/1 or /bases/1.json
  def destroy
    @basis.destroy!

    respond_to do |format|
      format.html { redirect_to bases_url, notice: "Base was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_basis
      @basis = Base.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def basis_params
      params.fetch(:basis, {})
    end
end
