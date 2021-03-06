class KeywordsController < ApplicationController
  before_action :set_keyword, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /keywords or /keywords.json
  def index
    @keywords = current_user.keywords.order("created_at DESC").page(params[:page])
  end

  # GET /keywords/1 or /keywords/1.json
  def show
  end

  # GET /keywords/new
  def new
    @keyword = Keyword.new
  end

  # GET /keywords/1/edit
  def edit
  end

  # POST /keywords or /keywords.json
  def create
    @keyword = Keyword.find_or_create_by(keyword_params)

    respond_to do |format|
      if @keyword.save
        current_user.keywords << @keyword
        format.html { redirect_to keywords_url, notice: "키워드 등록되었습니다." }
        format.json { render :show, status: :created, location: @keyword }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @keyword.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /keywords/1 or /keywords/1.json
  def update
    respond_to do |format|
      if @keyword.update(keyword_params)
        format.html { redirect_to keywords_url, notice: "Keyword was successfully updated." }
        format.json { render :show, status: :ok, location: @keyword }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @keyword.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /keywords/1 or /keywords/1.json
  def destroy
    current_user.keywords.destroy(@keyword)
    respond_to do |format|
      format.html { redirect_to keywords_url, notice: "성공적으로 삭제되었습니다." }
      format.json { head :no_content }
    end
  end

  def delete_all_user_keywords
    current_user.keywords.destroy_all
    respond_to do |format|
      format.html { redirect_to keywords_url, notice: "성공적으로 삭제되었습니다." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_keyword
      @keyword = Keyword.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def keyword_params
      params.require(:keyword).permit(:word)
    end
end
