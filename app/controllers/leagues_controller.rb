class LeaguesController < ApplicationController
  before_action :set_leagues, only: :show

  def index
    @leagues = League.all
  end

  def show; end

  private

  def set_leagues
    @league = League.find(params[:id])
  end
end
