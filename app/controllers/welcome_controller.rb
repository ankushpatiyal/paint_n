class WelcomeController < ApplicationController

  def index
  	@paintings = ActiveStorage::Attachment.where(name: "paintings").where(show: true)
  end

end
