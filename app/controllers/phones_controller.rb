class PhonesController < ApplicationController
  def new
    contact = Contact.find(params[:contact_id])
    @phone = contact.phones.new
    render('phones/new.html.erb')
  end

  def create
    @phone = Phone.new(:number => params[:number],
                       :contact_id => params[:contact_id])
    if @phone.save
      @contact = Contact.find(params[:contact_id])
      render('phones/success.html.erb')
    else
      render('phones/new.html.erb')
    end
  end

  def destroy
    contact = Contact.find(params[:contact_id])
    @phone = Phone.find(params[:phone_id])
    @phone.destroy
    redirect_to("/contacts/#{contact.id}")
  end

  def edit
    @phone = Phone.find(params[:phone_id])
    render('phones/edit.html.erb')
  end

  def update
    contact = Contact.find(params[:contact_id])
    @phone = Phone.find(params[:phone_id])
    if @phone.update(:number => params[:number])
      redirect_to("/contacts/#{contact.id}")
    else
      render("phones/edit.html.erb")
    end
  end

end
