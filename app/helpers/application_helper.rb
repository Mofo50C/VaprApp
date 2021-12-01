module ApplicationHelper
    def get_price_string(price, discount)
        "#{t('currency')}%0.2f" % (price * (100 - discount) / 100)
    end
end
