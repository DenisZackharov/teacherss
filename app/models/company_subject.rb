class CompanySubject < ApplicationRecord
  belongs_to :company
  belongs_to :subject
end
