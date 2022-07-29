module UuidHelper
  extend ActiveSupport::Concern

  included do
    before_create :generate_uuid
    self.primary_key = 'id'

    def generate_uuid
      if (id.blank?)
        self.id = SecureRandom.uuid
      end
    end
  end
end