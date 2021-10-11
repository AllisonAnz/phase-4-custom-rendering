class CheesesController < ApplicationController

  # GET /cheeses
  def index
    cheeses = Cheese.all
    render json: cheeses, except: [:created_at, :updated_at], methods: [:summary]
  end

  # GET /cheeses/:id
  def show
    cheese = Cheese.find_by(id: params[:id])
    if cheese 
      render json: cheese
    else  
      render json: {error: "Cheese not found"}, status: :not_found #or 404
    end
  end

end

#--------------------------------------------------------
#  def index
#     cheeses = Cheese.all
#     render json: cheeses, only: [:id, :name]
#   end
#
#  def index
#     cheeses = Cheese.all
#     render json: cheeses, except: [:created_at, :updated_at]
#   end

 # A use case we could have for :methods would be to call some 
 # instance methods and get that data from that instance method returned
 # as part of our serialized object
 # if we wanted to include the cheese.rb summary method 
 
 # cheese.rb... 
 #  class Cheese < ApplicationRecord
 #    def summary
 #      "#{name}: $#{price}"
 #    end
 #   end

 # Now the summary method gets called for each one of our cheeses
 # and is part of the response
 # cheese_controller.rb....
 #  def index
 #     cheeses = Cheese.all
 #     render json: cheeses, except: [:created_at, :updated_at], methods: [:summary]
 #  end

 # Adding Error Handling 
 # def show
 #     cheese = Cheese.find_by(id: params[:id])
 #     if cheese 
 #       render json: cheese
 #     else  
 #       render json: {error: "Cheese not found"}, status: :not_found #or 404
 #     end
 #   end