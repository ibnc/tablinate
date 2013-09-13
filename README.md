# Tablinate

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'tablinate'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tablinate

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

# Tablinate

* Code: [http://github.com/unholydh/tablinate](http://github.com/unholydh/tablinate)

## Author(s)

* [Kyle Carter](http://github.com/unholydh)
* [Kevin Collette](http://github.com/collettiquette)

## Description

Tablinate is a ruby gem that takes arrays of hashes, ActiveRecord::Relation objects, or a JSON array of hashes, and converts them into html tables. It is intended for use in small projects or applications whose schemas are closely related to what a table's output should be.

## Installation

Add this line to your application's Gemfile:

    gem 'tablinate'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tablinate


## Usage

### Sample Sinatra Code:

#### 1) app.rb

    require 'sinatra'
    require 'tablinate'

    get '/' do
      @employees = [
        { :id => '1', :first_name => "Matt", :last_name => "Smith", :title => "Time Lord" },
        { :id => '2', :first_name => "Jack", :last_name => "Harkness", :title => "Time Agent" },
        { :id => '3', :first_name => "Tom", :last_name => "Baker", :title => "Time Lord" },
        { :id => '4', :first_name => "David", :last_name => "Tennant", :title => "Time Lord" },
        { :id => '5', :first_name => "Christopher", :last_name => "Eccleston", :title => "Time Lord" }
      ] 
      haml :index
    end

#### 2) views/index.haml

    %body
      = @employees.tablinate()

#### 3) view-source:http://localhost:4567/

    <body>
      <table>
      <thead>
      <tr>
        <th>id</th>
        <th>first_name</th>
        <th>last_name</th>
        <th>title</th>


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
