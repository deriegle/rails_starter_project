module LastCreated
  extend ActiveSupport::Concern

  class_methods do
    def last_created
      order(:created_at).last
    end
  end
end
