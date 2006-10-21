module Ruport::Data
  module Groupable

    def group_by_tag
      r_tags = data.map {|row| row.tags}.flatten.uniq
      d = r_tags.map do |t| 
	      select {|row| row.tags.include? t }.to_table(column_names)      
      end
      Record.new d, :attributes => r_tags
    end

    def create_tag_group(label,&block)
      select(&block).each { |r| r.tag label }
    end

  end
end
