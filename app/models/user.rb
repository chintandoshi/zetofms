class User < ActiveRecord::Base
    acts_as_authentic

    validates_presence_of :login, :email

    validates_format_of :email,
                        :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
                        :message => 'Email address must be valid',
                        :allow_nil => true, :allow_blank => true

    has_and_belongs_to_many :roles

    attr_accessor :role_list

    def role_symbols
      roles.map do |role|
        role.name.underscore.to_sym
      end
    end
end
