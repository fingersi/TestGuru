module Admin::BadgesHelper
  def condition_view(badge)
    "#{badge.condition} : #{badge.value} " 
  end
end
