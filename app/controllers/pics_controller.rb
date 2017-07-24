class PicsController < ApplicationController
  before_action :find_pic, only: [:show, :edit, :update, :destroy, :find_comments]


  def index
    @pics = Pic.all.order('created_at DESC')
  end

  def show
    @comments = find_comments
  end

  def new
    @pic = current_user.pic.build
  end

  def create
    @pic = current_user.pic.build(pic_params)

    if @pic.save
      redirect_to @pic, notice: "Picture Added"
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @pic.update(pic_params)
      redirect_to @pic, notice: 'Updated Pic info'
    else
      render 'edit'
    end
  end

  def destroy
    @pic.destroy
    redirect_to root_path
  end

  private

  def pic_params
    params.require(:pic).permit(:title, :description, :image)
  end

  def find_pic
    @pic = Pic.find(params[:id])
  end

  def find_comments
    @comments = Comment.where(['pic_id =:p',{ p: @pic.id}])
  end


#   dont repeat ourseleves

end
