class TagsController < ApplicationController
  before_filter :authorize_user

  def index
    page = params[:page] || 1
    if params[:q].present?
      @tags = ActsAsTaggableOn::Tag.named_like(params[:q]).page(page).per(25)
    else
      @tags = ActsAsTaggableOn::Tag.page(page).per(25)
    end

    respond_to do |format|
      format.html {}
      format.json {
        render json: @tags.map { |t| { id: t.name, text: t.name } }
      }
    end
  end

  def new
    @tag = ActsAsTaggableOn::Tag.new
  end

  def create
    name = params[:tag][:name]
    if name.present?
      downcase_name = name.strip.mb_chars.downcase.to_s
      ActsAsTaggableOn::Tag.find_or_create_with_like_by_name(downcase_name)
    end
    redirect_to tags_path
  end

  def edit
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
  end

  def update
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
    name = params[:tag][:name]
    downcase_name = name.strip.mb_chars.downcase.to_s
    @tag.name = downcase_name
    @tag.save!
    redirect_to tags_path
  end

  def destroy
    ActsAsTaggableOn::Tag.destroy(params[:id])
    redirect_to tags_path
  end

  def authorize_user
    authorize self
  end
end
