class GameController < ApplicationController
  require 'game'

  before_filter :get_game

  def new
    reset_session
    get_game
    render :index
  end

  def index
  end

  def update
    @monopoly.throw_dice if params[:game_action].to_sym == :throw_dice
    session[:monopoly] = @monopoly
    respond_to do |format|
      format.html{ render :index }
      format.js
    end
  end

  private

  def get_game
    @monopoly = session[:monopoly]
    if @monopoly.nil?
      p = Player.all.map{|p| Monopoly::Player.new(p.name)}
      settings = Monopoly::Settings.new(p)
      @monopoly = Monopoly::Monopoly.new(settings)
    else
      @monopoly
    end
  rescue Exception => @game_message
    @game_message
  end

end

