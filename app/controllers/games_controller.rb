class GamesController < ApplicationController

    def index
        @games = Game.order(:title)
    end

    def show
        @game = Game.find(params[:id])
    end

end