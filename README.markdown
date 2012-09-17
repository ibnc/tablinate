# Tablinate

* Code: [http://github.com/unholydh/tablinate](http://github.com/unholydh/tablinate)

## Author(s)

* [Kyle Carter](http://github.com/unholydh)
* [Kevin Collette](http://github.com/collettiquette)

## Description

A gem that takes hashes or active record objects and converts them into tables in a view file.

## Sample Sinatra Code:

### 1) app.rb

    require 'sinatra'
    require 'tablinate'

    get '/' do
      @employees = [
        { :id => '1', :first_name => "Kyle", :last_name => "Carter", :title => "Programmer" },
        { :id => '2', :first_name => "Kevin", :last_name => "Collette", :title => "Programmer" },
        { :id => '3', :first_name => "David", :last_name => "Hahn", :title => "System Administrator" },
        { :id => '4', :first_name => "Brad", :last_name => "Rice", :title => "System Administrator" },
        { :id => '5', :first_name => "Roy", :last_name => "Mereness", :title => "IT Director" }
      ] 
      haml :index
    end

### 2) views/index.haml

    %body
      =Tablinate.generate_table(@guests, {})

## Install

    gem install tablinate


