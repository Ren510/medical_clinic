class HomesController < ApplicationController
  def top
  end

  def about
    puts "作成したキー #{ENV['Google_Maps_API_Key']}"   
  end
end
