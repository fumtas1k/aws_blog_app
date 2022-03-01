module CommonModule
  extend ActiveSupport::Concern

  included do
    scope :default, -> () { order(created_at: :desc)}
  end
end
