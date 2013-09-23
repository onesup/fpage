class Page < ActiveRecord::Base
  has_one :token, as: :identifiable
end
