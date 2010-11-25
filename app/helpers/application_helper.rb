# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def display_phone_number (country_code, area_code, number, ext)
    phone = ""

    phone << "(" << country_code << ")" if !country_code.blank?
    phone <<  area_code if !area_code.blank?
    phone << "-" << number if !number.blank?
    phone << " ext " << ext if !ext.blank?

    phone << "N/A" if phone == ""

    return phone
  end

  def display_address (addr_line_1,addr_line_2, addr_line_3,city, state, country, postal_code)
    address = ""

    address << addr_line_1 << "<br/>" if !addr_line_1.blank?
    address << addr_line_2 << "<br/>"  if !addr_line_2.blank?
    address << addr_line_3 << "<br/>" if !addr_line_3.blank?
    address << city << "<br/>" if !city.blank?
    address << state << "<br/>" if !state.blank?
    address << country << "<br/>" if !country.blank?
    address << postal_code << "<br/>" if !postal_code.blank?

    address << "N/A" if address == ""

    return address
  end

  def sort_link(title, column, options = {})
    condition = options[:unless] if options.has_key?(:unless)
    sort_dir = params[:d] == 'up' ? 'down' : 'up'
    link_to_unless condition, title, request.parameters.merge( {:c => column, :d => sort_dir} )
  end

  def sort_flag (column)

    if params.has_key?(:c) && params[:c].to_s().eql?(column.to_s()) then
      (params[:d] == 'up') ? image_tag("arrow-down.gif") : image_tag("arrow-up.gif")
    end

  end

  def global_print_link
    link_to_function("Print this Page", "javascript:print()", :class => "printbutton")
  end

end
