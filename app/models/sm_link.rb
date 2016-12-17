class SmLink < ApplicationRecord
  belongs_to :sm_linkable, polymorphic: true
end
