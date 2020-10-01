class ClientsPurchaser < ApplicationRecord
  belongs_to :Client
  belongs_to :purchaser
end
