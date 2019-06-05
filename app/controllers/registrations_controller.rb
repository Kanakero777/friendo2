# class RegistrationsController < ApplicationController
class RegistrationsController < Devise::RegistrationsController
  protect_from_forgery except: :update
  protected
  def after_update_path_for(resource)
      users_show_path
    end

end
# end
#使わない方
