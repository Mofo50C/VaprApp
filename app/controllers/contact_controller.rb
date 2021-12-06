class ContactController < ApplicationController

    def new
    end

    def create
        ContactMailer.with(email_params).support_email.deliver_now
    rescue StandardError => e
        puts e
        flash.now[:alert] = "error sending email"
        render "new"
    else
        flash.now[:notice] = "email sent"
        render "new"
    end

    private
    
    def email_params
        params.permit(:name, :email, :subject, :body)
    end

end