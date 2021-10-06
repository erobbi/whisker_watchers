class Weight < ApplicationRecord
  belongs_to :cat

  def formattedDate
    self.created_at.strftime('%b %d')
  end

end
