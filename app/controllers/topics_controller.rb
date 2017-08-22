class TopicsController < ApplicationController
  before_action :set_topics, only:[:edit, :update, :destroy]
  before_action :aithemticate_user!

  def index
    @topics = Topic.all
  end

  def new
    if params[:back]
      @topic = Topic.new(topics_params)
    else
      @topic = Topic.new
    end
  end

  def create
    @topic = Topic.new(topics_params)
    @topic.user_id = current_user.id
    @topic.image.retrieve_from_cache! params[:cache][:image]
    if @topic.save
      redirect_to topics_path,notice:"トピックを投稿しました！"
      NoticeMailer.sendmail_topic(@topic).deliver
    else
      render'new'
    end
  end

  def edit
  end

  def update
    @topic.update(topics_params)
    redirect_to topics_path,notice:"投稿を更新しました！"
  end

  def destroy
    @topic.destory
    redirect_to topics_path,notice:"投稿を削除しました！"
  end

  def confirm
    @topic = Topic.new(topics_params)
    render :new if @topics.invalid?
  end

  private
  def topics_params
    params.reqire(:topic).permit(:title,:content,:image,:image_cache)
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end
end
