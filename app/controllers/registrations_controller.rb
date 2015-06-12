class RegistrationsController < Devise::RegistrationsController
  def new
    build_resource({})
    self.resource.user_info = UserInfo.new
    self.resource.addresses.build
    self.resource.phones.build
    respond_with self.resource
  end

  def after_sign_up_path_for(resource)
     case resource
       when :user, User
         resource.valid? ? profile_index_path : root_path
       else
         super
      end
  end
end