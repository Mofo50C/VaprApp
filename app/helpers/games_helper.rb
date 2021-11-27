module GamesHelper
    def get_logo_path(title)
        "games/" + title.downcase.split.join("_")
    end

    def get_price_string(game)
        "#{t('currency')}%0.2f" % (game.price * (100 - game.discount) / 100)
    end
end