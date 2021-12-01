module OrdersHelper
    def format_total_price(total)
        "#{t('.total')}: #{t('currency')}%.2f" % total
    end
end