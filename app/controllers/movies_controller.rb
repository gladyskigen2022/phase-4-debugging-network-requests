class MoviesController < ApplicationController
  wrap_parameters format: []

  #GET /movies
  def index
    movies = Movie.all
    render json: movies
  end

  #POST /movies/:id
  def create
     movie = Movie.create(movie_params)
     render json: movie, status: :created 
  end

  #PATCH /movies/:id
  def update
     movie = Movie.find(params[:id])
     movie.update(movie_params)
     render json: movie
  end

  # DELETE /movies/:id
  def destroy
      movie = Movie.find(params[:id])
      movie.destroy
      head :no_content
  end


  private

  def movie_params
    params.permit(:title, :year, :length, :director, :description, :poster_url, :category, :discount, :female_director)
  end

end
