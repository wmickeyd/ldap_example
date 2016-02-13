#!/usr/bin/env ruby

require 'net/ldap'
require 'json'

class Ldap_User
  def authenticate(h)
    username = "#{h['username']}"
    password = "#{h['password']}"
    ldap = Net::LDAP.new(:host => 'xxxxxxx',
		     :port => 389,
                     :base => 'ou=CCP,dc=ra,dc=ccp,dc=xxxx,dc=xxxx,dc=com',
                     :auth => {
                       :method => :simple,
                       :username => "uid=#{username},ou=CCP,dc=ra,dc=ccp,dc=cable,dc=comcast,dc=com",
                       :password => "#{password}"
                      })

    if ldap.bind
      return "code => #{ldap.get_operation_result.code}, message => #{ldap.get_operation_result.message}"
    else
      return nil
    end
  end
end
