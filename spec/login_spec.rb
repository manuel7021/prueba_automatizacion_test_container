# coding: utf-8
require 'spec_helper'

describe "Login" do
  
  context "Con usuario falso" do
    
    it "no se loguea porque el usuario es invalido" do                                                   
      user_to_test = RSpec.configuration.fake_user
      login "falso" , "falso"
      page.has_content?("Debe ingresar su contraseña").should be_false
    end
  
  end

end

