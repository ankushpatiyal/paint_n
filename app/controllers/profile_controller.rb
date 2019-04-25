class ProfileController < ApplicationController

  def index

  end

  def show
    @user = User.where(id: params[:id]).first
  end

  def upload_profile_photo
    @user = User.where(id: params[:user_id]).last
    return false unless @user
    if params[:picture_type] == "painting"
      @user.paintings.attach(params[:picture_data])
      picture = @user.paintings.last
      return render json: {value: render_to_string(partial: 'painting', locals: {painting: picture})}
    else
      @user.profile_photo.attach(params[:picture_data])
      return render json: {url: url_for(@user.profile_photo)}
    end
  end


  def hide_painting
    painting = ActiveStorage::Attachment.where(id: params[:id]).first
    return false unless painting
    if params[:show_painting] == "true"
      painting.update_attribute(:show, true)
    else
      painting.update_attribute(:show, false)
    end
    
  end

end
