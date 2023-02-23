class EventsController < ApplicationController
    def index
        @user = User.find(session[:user_id])
        @events = Event.all.order(:event_date).reverse_order
        @categories = Category.all
    end

    def new
        @event = Event.new
        @categories = Category.all
    end

    def create
        @event = Event.new(name: event_params[:name], description: event_params[:description], event_date: event_params[:event_date], category_id: event_params[:category_id])
        @event.creator_id = session[:user_id]

        if @event.save
            redirect_to users_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @event = @event = Event.find(params[:id])
        @categories = Category.all
    end
    
    def update
        @event = Event.find(params[:id])
        @user = User.find(session[:user_id])
    
        if @event.update(name: event_params[:name], description: event_params[:description], event_date: event_params[:event_date], category_id: event_params[:category_id])
            redirect_to user_events_path(@user)
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def enroll
        @user = User.find(session[:user_id])
        @enrolled_event = Event.find(params[:id])
        if @user.events.include?(@enrolled_event)
            redirect_to user_events_path(@user)
        else
            @user.events << @enrolled_event
            redirect_to user_events_path(@user)
        end
    end


    def filter
        @events = Event.all.where(category_id: params[:category])
    end

    def show
        @event = Event.find(params[:id])
        @user = User.find(session[:user_id])
        @likes = Like.all
    end

    def destroy
        @event = Event.find(params[:id])
        @user = User.find(session[:user_id])
        @event.destroy
    
        redirect_to user_events_path(@user), status: :see_other
      end    

    private

    def event_params
        params.require(:event).permit(:name, :description, :event_date, :creator_id, :category_id)
    end
end
