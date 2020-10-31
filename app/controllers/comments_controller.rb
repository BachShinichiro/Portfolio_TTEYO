class CommentsController < ApplicationController
  before_action :set_event, only: [:create, :edit, :update]
  skip_before_action :authenticate_user!

  def create
    if user_signed_in? 
      @comment = @event.comments.build(comment_params)
      respond_to do |format|
        if @comment.save
          format.js { render :index }
        else
          format.html { redirect_to event_path(@event), notice: '投稿できませんでした...' }
        end
      end
    else
      redirect_to event_path(@event), notice: '質問するにはログインしてください' 
    end
  end

  def edit
    @comment = @event.comments.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = 'コメントの編集中'
      format.js { render :edit }
    end
  end

  def update
    @comment = @event.comments.find(params[:id])
    if @comment.update(comment_params)
      respond_to do |format|
        flash.now[:notice] = 'コメントが編集されました'
        format.js { render :index }
      end
    else
      redirect_to event_path(@event), notice: 'コメントの編集に失敗しました'
    end
  end

  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      flash.now[:notice] = 'コメントが削除されました'
      format.js { render :index }
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:event_id, :content)
  end
  def set_event
    @event = Event.find(params[:event_id])
  end
end