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

  def find_contact (last_name)  
    @contacts.each do |contact|
      if contact.last_name == last_name
        return contact
      end
    end

  end

  def find_contact (attribute)  
    @contacts.each do |contact|
      if contact.last_name == attribute
        return contact
      elsif contact.first_name == attribute
        return contact
      elsif contact.email == attribute
        return contact
      elsif contact.id == attribute
        return contact
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
  




  def show_all_contacts
    @contacts.each do |x|
      puts "Contact id: #{x.id}"
      puts "First Name: #{x.first_name}"
      puts "Last Name: #{x.last_name}"
      puts "Email: #{x.email}"
      puts "Notes: #{x.notes}"
      puts ""
    end  
  end
   
  
end

