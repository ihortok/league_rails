class PlayersController < ApplicationController
  before_action :set_player, only: :show

  def index
    @players = Player.all
  end

  def show; end

  private

  def set_player
    @player = Player.find(params[:id])
  end
end
