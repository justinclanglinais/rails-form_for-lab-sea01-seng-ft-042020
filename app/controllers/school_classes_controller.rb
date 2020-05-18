class SchoolClassesController < ApplicationController
    def new
        @schoolclass = SchoolClass.new
    end
	def create
		@schoolclass = SchoolClass.new(school_class_params(:title, :room_number))
		@schoolclass.save
		redirect_to @schoolclass
    end
    def show
        @schoolclass = SchoolClass.all.find(params[:id])
    end
    def index
        @schoolclasses = SchoolClass.all
    end
    def update
		@schoolclass = SchoolClass.find(params[:id])
		@schoolclass.update(school_class_params(:title, :room_number))
		redirect_to @schoolclass
    end

    def edit
		@schoolclass = SchoolClass.find(params[:id])
	end
	  
    private
    
    def school_class_params(*args)
        # byebug
        params.require(:school_class).permit(*args)
    end
end