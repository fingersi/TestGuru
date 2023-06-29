class BadgeFinder

  attr_accessor :condition, :badge

  def initialize(test_passing)
    @tp = test_passing
  end

  def find_badge
    Badge.all_activated.each do |badge|
      next unless badge.check_badge_condition(@tp)

      @tp.badges << badge
      @tp.save
    end
  end
end
