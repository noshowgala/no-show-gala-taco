class PagesController < ApplicationController
  def home
    @guests = GuestListEntry.order(created_at: :desc)
  end
end
