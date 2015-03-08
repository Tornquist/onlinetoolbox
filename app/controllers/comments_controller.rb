class CommentsController < ApplicationController
  add_breadcrumb "Students", :students_path

  # GET /comments/new
  def new
    add_breadcrumb "New Comment", :new_comment_path
    @student = nil
    if params.has_key? :student_id
      @student = Student.find(params[:student_id])
    end
    @comment = Comment.new
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to new_comment_path(student_id: @comment.student.id), notice: 'Comment was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:user_id, :student_id, :content, :contact_type_id, :recruit_status_id)
    end
end
