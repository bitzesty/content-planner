module ContentPlansHelper
  def content_plan_tag_filters(tags)
    tags.map do |t|
      link_to(t, content_plans_path(tag: t), class: 'label label-success tag')
    end.join.html_safe
  end
end
