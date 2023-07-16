module ProfileHelper
  include Admin::BadgesHelper

  def user_condition_view(badge)
    condition_view(badge)
  end
end
