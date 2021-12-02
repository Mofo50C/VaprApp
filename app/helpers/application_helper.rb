module ApplicationHelper
    def format_total_price(total)
        t('orders.total') + ": " + format_price(total)
    end

    def format_price(price)
        number_to_currency(price, unit: "£")
    end
end
