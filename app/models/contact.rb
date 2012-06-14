class Contact < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :nickname, :job_title, :phone, :email, :twitter, :address, :city, :state, :zip, :we_met_at, :we_met_on, :we_chatted_about, :adjective, :user_id, :photo, :story_id, :group_id
  
  validates_presence_of :first_name
  
  has_many :stories
  belongs_to :group
  belongs_to :user
  
  # require 'aws/s3'
  
  #paperclip
  has_attached_file :photo,
    :styles  => {
      :thumb => "100x100#",
      :small => "400x400" 
      }
      

      # I ran into the same issue and found a good blog post about it: 
      # 
      #      http://labnotesh.wordpress.com/2009/05/19/attach-non-image-files-in-rails-with-paperclip/ 
      # 
      #      He recommends doing the following in your model: 

# before_post_process :image? 
#       def image? 
#         !(data_content_type =~ /^image.*/).nil? 
#       end 

      # I went a step further and mooched attachment_fu's list of image 
      #       content-types: 
      
        IMAGE_TYPES = [ 
          "image/jpeg", 
          "image/pjpeg", 
          "image/jpg", 
          "image/gif", 
          "image/png", 
          "image/x-png", 
          "image/jpg", 
          "image/x-ms-bmp", 
          "image/bmp", 
          "image/x-bmp", 
          "image/x-bitmap", 
          "image/x-xbitmap", 
          "image/x-win-bitmap", 
          "image/x-windows-bmp", 
          "image/ms-bmp", 
          "application/bmp", 
          "application/x-bmp", 
          "application/x-win-bitmap", 
          "application/preview", 
          "image/jp_", 
          "application/jpg", 
          "application/x-jpg", 
          "image/pipeg", 
          "image/vnd.swiftview-jpeg", 
          "image/x-xbitmap", 
          "application/png", 
          "application/x-png", 
          "image/gi_", 
          "image/x-citrix-pjpeg" 
        ] 

        # def image? 
        #           IMAGE_TYPES.include?(data_content_type) 
        #         end
  
end
