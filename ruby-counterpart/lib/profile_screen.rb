require_relative 'model'

ProfileScreen = Model.new(:user, :app_theme) do
  def header_background_color

    # This line looks remarkably like Swift -- but doesn't work.
    # What is different? What needs to change?

    #user.avatar&.style.background_color || app_theme.background_color
    if (user.avatar != nil)
    	if (user.avatar.style.background_color != nil)
    		user.avatar.style.background_color
    	else
    		app_theme.background_color
    	end
    else
    	app_theme.background_color
    end

  end
end
