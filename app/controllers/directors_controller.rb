class DirectorsController < ApplicationController
  def index
    @director = Director.all
    render("directors/index.html.erb")
  end

  def show
    @director = Director.find(params[:id])
    render("directors/index.html.erb")
  end

  def new_form
    @director = Director.new

    render("directors/new.html.erb")
  end

  def create
    @director = Director.new

    @director.name = params[:name]
    @director.dob = params[:dob]
    @director.bio = params[:bio]
    @director.image_url = params[:image_url]

    save_status = @director.save

    if save_status == true
      redirect_to("/directors/#{@director.id}", :notice => "Director created successfully.")
    else
      render("directors/new.html.erb")
    end
  end


  def edit_form
    @director = Director.find(params[:id])
  end

  def update_row
    @director = Director.find(params[:id])

    @director.dob = params[:dob]
    @director.name = params[:name]
    @director.bio = params[:bio]
    @director.image_url = params[:image_url]

    @director.save

    render("show")
  end

  def destroy
    @director = Director.find(params[:id])

    @director.destroy
    render("directors/index.html.erb")
  end
end
