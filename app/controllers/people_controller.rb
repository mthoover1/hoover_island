class PeopleController < ApplicationController
  def index
    @people = Person.all.order(:last_name, :first_name)
  end

  def show
    @person = Person.find(params[:id])
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])

    if current_user.id == @person.id && @person.update_attributes(params[:person])
      redirect_to person_path(@person)
    else
      render 'edit'
    end
  end
end
