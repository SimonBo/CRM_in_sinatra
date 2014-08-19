class Rolodex

  attr_reader :contacts

	def initialize
    @contacts=[]
    @index = 1000
  end

  def add_contact(contact)
    contact.id = @index
    @contacts << contact
    @index+=1
    contact
  end

  def find(contact_id)
    @contacts.find {|contact| contact.id == contact_id }
  end

  def find_contact (attribute)  
    @contacts.each do |contact|
      if contact.last_name.downcase == attribute.downcase
        return contact
      elsif contact.first_name.downcase == attribute.downcase
        return contact
      elsif contact.email.downcase == attribute.downcase
        return contact
      elsif contact.id == attribute
        return contact
      else
        return
      end
    end
  end

  def delete_contact(contact)
    @contacts.delete(contact)
  end

  def find_attribute(attribute)
    @contacts.each do |contact|
      if attribute == 'id'
        puts "#{contact.id}"
      elsif attribute == 'first_name'
        puts "#{contact.first_name}"
      elsif attribute == 'last_name'
        puts "#{contact.last_name}"
      elsif attribute == 'email'
        puts "#{contact.email}"
      end
    end
  end
  


   
  
end

