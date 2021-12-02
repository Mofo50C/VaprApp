class ContactMailer < ApplicationMailer
    default to: "support@vapor.org", from: "no-reply@vapor.org"

    def support_email
        @name = params[:name]
        @email = params[:email]
        @name_email = email_address_with_name(@email, @name)
        @subject = params[:subject]
        @body = params[:body]
        mail(cc: @email, subject: @subject)
    end

end
