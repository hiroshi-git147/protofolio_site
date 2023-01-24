class CommentsController < ApplicationController
  
  
  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_back(fallback_location: root_path)  #コメント送信後は、一つ前のページへリダイレクトさせる。
    else
      redirect_back(fallback_location: root_path)  #同上
    end
  end
  
  def edit
  end

  def update
    if @answer.update(answer_params)
      redirect_to question_path(@question), notice: 'Success'
    else
      redirect_to question_path(@question), alert: 'Invalid'
    end
  end

  def destroy
    @answer.destroy
    redirect_to question_path(@question), notice: 'Question was successfully destroyed.'
  end

  private
  def comment_params
    params.require(:comment).permit(%i[comment_content post_id user_id])  #formにてpost_idパラメータを送信して、コメントへpost_idを格納するようにする必要がある。
  end
end
