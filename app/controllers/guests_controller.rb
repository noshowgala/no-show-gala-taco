class GuestsController < ApplicationController
  def create
    @guest = GuestListEntry.new(guest_params)
    if @guest.save
      @guests = GuestListEntry.order(created_at: :desc)
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.replace('guest-list', partial: 'guest_list'),
            turbo_stream.remove('name-input-area')
          ]
        end
        format.html { redirect_to root_path }
      end
    end
  end

  private

  def guest_params
    params.require(:guest).permit(:name)
  end
end
