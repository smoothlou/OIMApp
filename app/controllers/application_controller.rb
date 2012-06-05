class ApplicationController < ActionController::Base
  protect_from_forgery

  def new
    @contact = Contact.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contact }
    end
  end

  # GET /contacts/1/edit
  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(params[:contact])
    if params[:keyword].present?
      @new = Contact.new(:first_name => params[:keyword])
      @new.save
      redirect_to @contact
    end

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        format.json { render json: @contact, status: :created, location: @contact }
      else
        format.html { render action: "new" }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end
end
