class TeamsController < ApplicationController
  before_action :set_team, only: :show

  def index
    @teams = Team.all
  end

  def show; end

  private

  def set_team
    @team = Team.find(params[:id])
  end
end
