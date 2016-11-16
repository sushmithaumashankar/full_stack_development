class EventsController < ApplicationController
before_filter :find_event_id
	def new
		@event=Event.new


	end
	def newform
		@event=Event.new
		@users=User.all
	end
	def create
		current_user.events << Event.new(event_params)

	  # Event.last.owner=current_user
	 	binding.pry
	 	current_user.events.last.invitees << User.find(params["invitee_ids"])
	    
        redirect_to events_list_path
        # else
        # render "new"
      # end
	end
	def index
		
		@users=User.all
		@events=Event.all
	end
	def edit
		@event_edit=@event.id
        @users=User.all
		end
    def update
   
        @event.update_attributes(event_params)
        redirect_to events_list_path 
    end
	private
	  def event_params
        params.require(:event).permit(:eventtitle,:venue,:date,:time,:description,:invitees,:status)
    end
    def find_event_id
    	@event=Event.find_by_id(params[:id])
    end
 
end
