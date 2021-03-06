class CommentsController < ApplicationController
    before_action :set_comment, :set_post, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = @post.comments
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new(parent_id: params[:parent_id])
  end

  # GET /comments/1/edit
  def edit
    (redirect_to :back and flash[:error] = 'Neces razbojnice') unless @comment.user == current_user
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = current_user.comments.create(comment_params)

    respond_to do |format|
      if @comment
        format.html { redirect_back(fallback_location: root_path, notice: 'Comment was successfully created.') }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { redirect_back(fallback_location: root_path, error: 'Comment was not created! You suck balls!.') }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @post, notice: 'Comment was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_post
      puts params
      @post = Post.find_by(params[:post_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :post_id, {:user_id => [current_user.id]})
    end
end
