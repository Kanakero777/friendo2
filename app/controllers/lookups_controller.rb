class LookupsController < ApplicationController
  def index
    if params[:search] == nil
        @search = Profile.all
      elsif params[:search] == ""
        @search = Profile.all
      else
        #部分検索
        @search = Profile.where("name LIKE ? ",'%' + params[:search] + '%').or(Profile.where("homeCountry LIKE ? ", '%' + params[:search] + '%')).or(Profile.where("nativeLanguage LIKE ? ", '%' + params[:search] + '%')).or(Profile.where("homeCountry LIKE ? ", '%' + params[:search] + '%')).or(Profile.where("sex LIKE ? ", '%' + params[:search] + '%')).or(Profile.where("residence LIKE ? ", '%' + params[:search] + '%'))
      end
  end
end
