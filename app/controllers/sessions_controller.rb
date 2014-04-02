class SessionsController < Devise::SessionsController
  def create
    respond_to do |format|  
    format.html { super }  
    format.json {  
      puts auth_options
      self.resource = warden.authenticate!(auth_options)
      set_flash_message(:notice, :signed_in) if is_flashing_format?
      sign_in(resource_name, resource)
      yield resource if block_given?
      # respond_with resource, location: after_sign_in_path_for(resource)
      render :status => 200, :json => { :auth_token=>resource.authentication_token }  
    }  
    end
  end

end