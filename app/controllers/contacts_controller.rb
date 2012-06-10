class ContactsController < ApplicationController
  
  SEARCH_PEOPLE = ["First Name", "Last Name"]
  
  # GET /contacts
  # GET /contacts.json
  def index
    
    @contact = Contact.new
    @user = User.new
    
    if params[:keyword].present? & params[:choose].present?
      @contacts = Contact.where("LOWER(#{params[:choose]}) LIKE ?", "%#{params[:keyword].downcase}%")
      @contacts = @contacts.page(params[:page]).per(5)
    else
      @contacts = Contact.page(params[:page]).per(5)
    end
    

    respond_to do |format|
      @contact.save
      format.html # index.html.erb
      format.json { render json: @contacts }
    end
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    @contact = Contact.find(params[:id])
    # @contact.stories = Story.find(params[:contact_id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contact }
    end
  end

  # GET /contacts/new
  # GET /contacts/new.json
  
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
  
  def edit
    @contact = Contact.find(params[:id])
  end

  # PUT /contacts/1
  # PUT /contacts/1.json
  def update
    @contact = Contact.find(params[:id])

    respond_to do |format|
      if @contact.update_attributes(params[:contact])
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    respond_to do |format|
      format.html { redirect_to contacts_url }
      format.json { head :no_content }
    end
  end
end
