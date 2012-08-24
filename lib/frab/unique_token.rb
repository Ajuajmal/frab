require "securerandom"

module Frab
  module UniqueToken

    def generate_token_for(attribute)
      loop do
        token = SecureRandom.urlsafe_base64(15)
        if self.class.where(attribute => token).count > 0
          next
        else
          self.send(:"#{attribute}=", token)
          break token
        end
      end
    end

  end
end
