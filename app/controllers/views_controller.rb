class ViewsController < ApplicationController
  before_action :set_view, only: [:show, :edit, :update, :destroy]


  def new
    @view = View.new
    respond_to do |format|
      format.js
    end
  end

  # GET /views/1/edit
  def edit
  end

  def show
    respond_to do |format|
      format.js
    end
  end

  # POST /views
  # POST /views.json
  def create
    @view = View.new(view_params)
    @view.user = current_user
    respond_to do |format|
      if @view.save
        format.js
      else
        format.js
      end
    end
  end

  # PATCH/PUT /views/1
  # PATCH/PUT /views/1.json
  def update
    respond_to do |format|
      if @view.update(view_params)
        format.html { redirect_to @view, notice: 'View was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @view.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /views/1
  # DELETE /views/1.json
  def destroy
    @view.destroy
    respond_to do |format|
      format.html { redirect_to views_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_view
      @view = View.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def view_params
      params.require(:view).permit(:name, :body, :user_id)
    end
end
