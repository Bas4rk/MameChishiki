class PagesController < ApplicationController
  before_action :sign_in_required, only: [:show]
  before_action :authenticate_user!, except: [:index]
  def index
  end

  def show
  end
end
