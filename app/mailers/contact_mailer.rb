class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
   
    ContactMailer.contact_mail(@contact)
  end
end
