# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview

    def support_email
        name = "name"
        email = "email@domain.com"
        subject = "subject"
        body = "body"
        ContactMailer.with(
            name: name,
            email: email,
            subject: subject,
            body: body
        ).support_email
    end

end
