desc "Assign default Group"
task :assign_defaults => :environment do
  Contact.all.each do |contact|
    if contact.group.nil?
      contact.group = Group.first
      contact.save
    end
  end
end
