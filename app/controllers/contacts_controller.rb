class ContactsController < ApplicationController
  # GET /contacts
  # GET /contacts.json
  def index
    
    @contact = Contact.new
    @user = User.new
    @zebra = User.find_by_id(session[:userid])
    @groups = Group.all
    @stories = Story.all
    
    # if params[:keyword].present? & params[:search].present?
    #       @contacts = Contact.where("LOWER(#{params[:search]}) LIKE ?", "%#{params[:keyword].downcase}%")
  
    
    
    if params[:keyword].present?   
      @contacts = Contact.where("LOWER(first_name) LIKE ? OR LOWER(last_name) LIKE ? OR LOWER(email) LIKE ? OR LOWER(adjective) LIKE ?","%#{params[:keyword].downcase}%","%#{params[:keyword].downcase}%","%#{params[:keyword].downcase}%","%#{params[:keyword].downcase}%") #&& Contact.where("(user_id) = #{session[:userid]}")
      @contacts = @contacts.page(params[:page]).per(5)
    else
      @contacts = Contact.where("(user_id) = #{session[:userid]}")
      @contacts = @contacts.page(params[:page]).per(5)
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
    
    if @contact.twitter.present?
    @tweet = @contact.twitter
    twitter_url = "http://search.twitter.com/search.json?q=#{@tweet}&include_entities=true&result_type=mixed&limit=10"
    feeds = JSON.parse(open(twitter_url).read)
    @results = feeds["results"]
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contact }
    end
  end

  # GET /contacts/new
  # GET /contacts/new.json
  
  def new
    @contact = Contact.new
    @contact.user = current_user
    

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
    @contact.user = User.find(session[:userid])
    # @contact = @user.contact.create(params[:contact])
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
      format.html { redirect_to @contact, notice: "contact has been deleted" }
      format.json { head :no_content }
    end
  end
end
