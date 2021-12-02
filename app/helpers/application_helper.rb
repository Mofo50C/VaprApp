module ApplicationHelper
    def format_total_price(total)
        format_label(t('orders.total')) + format_price(total)
    end

    def format_price(price)
        number_to_currency(price, unit: "£")
    end

    def format_label(label)
        "#{label}: "
    end
end
