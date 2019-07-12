class ApplicationRecord < ActiveRecord::Base
  include LastCreated

  self.abstract_class = true
end
