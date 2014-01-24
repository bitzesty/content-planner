class ContentPlansController < ApplicationController
  expose_decorated(:content_plan, attributes: :content_plan_params)
  expose_decorated(:content_plans) {
    ContentPlanSearch.new(params[:search]).results.page(params[:page])
  }
  expose(:comment) {
    current_user.comments.build(commentable: content_plan)
  }

  before_filter :authorize_user

  def index
    @search = ContentPlanSearch.new(params[:search])
    respond_to do |format|
      format.html
      format.json {
        render json: content_plans.map { |cp| { id: cp.id, text: cp.name } }
      }
    end
  end

  def create
    if content_plan.save
      update_maslow_need_ids!
      redirect_to content_plans_path, notice: 'Content plan was successfully created.'
    else
      render :new
    end
  end

  def versions
  end

  def update
    if content_plan.save
      update_maslow_need_ids!
      redirect_to content_plans_path
    else
      render :edit
    end
  end

  def destroy
    content_plan.destroy
    redirect_to content_plans_path
  end

  private

  def content_plan_params
    params.require(:content_plan).permit(:tag_list,
      :status,
      :ref_no,
      :title,
      :details,
      :slug,
      :handover_detailed_guidance,
      :notes,
      :maslow_need_ids,
      :due_quarter,
      :due_year,
      :maslow_need_ids,
      :joined_organisation_ids
    )
  end

  def update_maslow_need_ids!
    if content_plan_params[:maslow_need_ids].present?
      ContentPlanNeed.where(content_plan_id: content_plan.id).destroy_all
      need_ids = content_plan_params[:maslow_need_ids].split(",")
      need_ids.each do |nid|
        ContentPlanNeed.find_or_create_by!(content_plan_id: content_plan.id, need_id: nid)
      end
    end
  end

  def authorize_user
    authorize content_plan
  end
end
