class Users::RegistrationsController < Devise::RefistrationsController
  class << self
    def build_resource(hash=nil)
      hash[:uid] = User.create_unique_string
      super
    end
  end
end
