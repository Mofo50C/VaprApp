module GamesHelper
    def get_logo_path(title)
        "games/" + title.downcase.split.join("_")
    end
end