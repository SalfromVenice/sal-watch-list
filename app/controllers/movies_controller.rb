class MoviesController < ApplicationController
  def index
    list_id = params[:passed_params][:list]
    @list = List.find(list_id)
    query = params[:passed_params][:query].gsub(/[[:punct:]]/, '%')
    @movies = Movie.where("lower(replace(title, '-', '')) LIKE lower(?)", "%#{query}%").order('popularity DESC')
  end

  def new
    if params[:passed_params]
      list_id = params[:passed_params][:list_id]
    else
      list_id = params[:search][:list_id]
    end
    @list = List.find(list_id)
    if params[:search]
      query = params[:search][:title]
      @movies = Movie.search(query)
      redirect_to movies_path(passed_parameter: { query: params[:search][:title], list: list_id })
    else
      @movies = ''
    end
  end
end
