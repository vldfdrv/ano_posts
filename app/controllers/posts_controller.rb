class PostsController < ApplicationController
  before_action :authorized

  def index
    if current_user.admin?
      @posts = Post.where(status: Post::STATUS_INSPECT)
    else
      @posts = Post.where(status: Post::STATUS_APPROVED, region: current_user.region)
    end
    authors_ids = @posts.pluck(:user_id).uniq
    @authors = User.where(id: authors_ids)
    scope = params[:user_id].blank? ? @posts.all : @posts.where(user_id: params[:user_id])
    scope = scope.where("LOWER(region) LIKE LOWER(?)", "%#{params[:region].downcase}%") if params[:region].present?
    if params[:created_at_from].present?
      created_at_from_date = Date.parse(params[:created_at_from])
      scope = scope.select{|x| x.created_at.to_date >= created_at_from_date}
    end

    if params[:created_at_to].present?
      created_at_to_date = Date.parse(params[:created_at_to])
      scope = scope.select{|x| x.created_at.to_date <= created_at_to_date}
    end

    @posts = @posts.where(id: scope.pluck(:id))

    respond_to do |format|
      format.html
      format.xlsx
    end
  end

  def my_drafts
    @posts = Post.where(user_id: current_user.id, status: [Post::STATUS_DRAFT, Post::STATUS_INSPECT, Post::STATUS_REJECTED])
  end

  def new
    @post = Post.new()
    @file = File.new()
  end

  def create
    @post = Post.new(text: params[:post][:text])
    @post.user_id = current_user.id
    @post.region = current_user.region
    @post.status = if params[:to_draft].present?
                     Post::STATUS_DRAFT
                   elsif params[:to_inspect].present?
                     Post::STATUS_INSPECT
                   elsif params[:to_approved].present?
                     Post::STATUS_APPROVED
                   end
    if @post.save
      redirect_to posts_path, notice: "Successfully created post!"

    else
      render :new
    end
  end

  def approve_or_reject
    post = Post.find(params[:id])
    status = case params[:status]
    when "approve"
      Post::STATUS_APPROVED
    when "reject"
      Post::STATUS_REJECTED
    else
      Post::STATUS_INSPECT
    end
    post.update(status: status, created_at: DateTime.now)
    redirect_to posts_path
  end


  def authorized
    redirect_to log_in_path unless logged_in?
  end
end