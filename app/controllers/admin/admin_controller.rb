class Admin::AdminController < ApplicationController

  def index
     @admin = Admin.find(current_admin.id)
  end

  def show
    @admin = Admin.find(current_admin.id)
  end
end
