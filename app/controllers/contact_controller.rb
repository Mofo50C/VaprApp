class ContactController < ApplicationController

    def new
    end

    def create
        ContactMailer.with(
            name: params[:name],
            email: params[:email],
            subject: params[:subject],
            body: params[:body]
        ).support_email.deliver_now
    rescue StandardError => e
        puts e
        flash.now[:alert] = "error sending email"
    else
        flash.now[:notice] = "email sent"
    ensure
        render "new"
    end

end