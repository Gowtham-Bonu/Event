class EventsController < ApplicationController
    def index
        @events = Event.all.order(:event_date).reverse_order
    end

    def new
        @event = Event.new
        @categories = Category.all
    end

    def create
        @event = Event.new(name: event_params[:name], description: event_params[:description], event_date: event_params[:event_date])
        @event.creator_id = session[:user_id]
        @category = Category.find(event_params[:category_id])
        @event.create_category(category: @category.category)

        if @event.save
            redirect_to users_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def enroll
        @user = User.find(session[:user_id])
        @enrolled_event = Event.find(params[:id])
        if @user.events.include?(@enrolled_event)
            redirect_to users_path
        else
            @user.events << @enrolled_event
            redirect_to users_path
        end
    end

    private

    def event_params
        params.require(:event).permit(:name, :description, :event_date, :creator_id, :category_id)
    end
end
