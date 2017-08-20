class MoviesController < ApplicationController
  def index
    @movie = Movie.all
    
    render("movies/index.html.erb")
  end

  def show
    @movie = Movie.find(params[:id])
    render("movies/index.html.erb")
  end

  def new_form
    @movie = Movie.new
    @character = Character.new
    render("movies/new.html.erb")
  end

  def create
    @movie = Movie.new

    @movie.title = params[:title]
    @movie.year = params[:year]
    @movie.duration = params[:duration]
    @movie.description = params[:description]
    @movie.image_url = params[:image_url]
    @movie.director_id = params[:director_id]

    save_status = @movie.save

    if save_status == true
      redirect_to("/movies/#{@movie.id}", :notice => "Movie created successfully.")
    else
      render("movies/new.html.erb")
    end
  end

  def edit_form
    @movie = Movie.find(params[:id])
  end

  def update_row
    
    @movie = Movie.find(params[:id])
    @movie.title = params[:title]
    @movie.year = params[:year]
    @movie.duration = params[:duration]
    @movie.description = params[:description]
    @movie.image_url = params[:image_url]
    @movie.director_id = params[:director_id]
    
    @movie.save

    render("show")
  end

  def destroy
    @movie = Movie.find(params[:id])

    @movie.destroy
    render("movies/index.html.erb")
  end
end
