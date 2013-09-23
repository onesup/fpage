class Pages < ActiveRecord::Base
  has_one :tokens, as: :identifiable
end
