class TicketsController < ApplicationController
before_action :authorize_admin!, except: [:index, :show]
before_action :set_project
before_action :set_ticket, only: [:edit, :show, :update, :destroy]

def new
	@ticket = @project.tickets.build
end

def show

end

def create
	@ticket = @project.tickets.build(ticket_params)
	@ticket.user = current_user
	if @ticket.save
		flash[:notice] = "Ticket has been created."
		redirect_to [@project, @ticket]
	else
		flash[:alert] = "Ticket has not been created."
		render "new"
	end
end

def update 
	if @ticket.update(ticket_params)
		flash[:notice] = "Ticket has been updated."
		redirect_to [@project, @ticket]
	else
		flash[:alert] = "Ticket has not been updated."
		render action: "edit"
	end
end
def destroy
	@ticket.destroy
	flash[:notice] = "Ticket has been deleted."
	redirect_to @project
end

private

def authorize_admin!
	require_signin!
	unless current_user.admin?
		flash[:alert] = "You Must be an admin to do that"
	end


end


def ticket_params
	params.require(:ticket).permit(:title, :description )
end

def set_project
	@project = Project.find(params[:project_id])
end

def set_ticket
	@ticket = @project.tickets.find(params[:id])
	end

end
