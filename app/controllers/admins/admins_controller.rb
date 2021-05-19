class Admins::AdminController < ApplicationController

  def index
     @admins = Admin.find(current_admin.id)
  end

  def show
    @admins = Admin.find(current_admin.id)
  end
end
