# tablinate

* Code: [http://github.com/unholydh/tablinate](http://github.com/unholydh/tablinate)

## Author(s)

* [Kyle Carter](http://github.com/unholydh)
* [Kevin Collette](http://github.com/collettiquette)

## Description

tablinate is a ruby gem that takes hashes or active record objects and converts them into tables in a view file. It is intended for use in small projects or applications whose schemas are closely related to what a table's output should be.

## Install

    gem install tablinate

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
      =Tablinate.generate_table(@employees, {})

### 3) view-source:http://localhost:4567/

    <body>
      <table>
      <thead>
      <tr>
        <th>id</th>
        <th>first_name</th>
        <th>last_name</th>
        <th>title</th>
      </thead>
      <tbody>
      <tr>
        <td>1</td>
        <td>Kyle</td>
        <td>Carter</td>
        <td>Programmer</td>
      </tr>
      <tr>
        <td>2</td>
        <td>Kevin</td>
        <td>Collette</td>
        <td>Programmer</td>
      </tr>
      <tr>
        <td>3</td>
        <td>David</td>
        <td>Hahn</td>
        <td>System Administrator</td>
      </tr>
      <tr>
        <td>4</td>
        <td>Brad</td>
        <td>Rice</td>
        <td>System Administrator</td>
      </tr>
      <tr>
        <td>5</td>
        <td>Roy</td>
        <td>Mereness</td>
        <td>IT Director</td>
      </tr>
      </tbody>
      </table>
    </body>

## Options

Because it uses normal html markup, tablinated tables are easily styled using CSS, Sass, etc. That being said, tablinate is configurable via an options hash. The hash can style the table or add classes to it. For example:

### views/index.haml

    %body
      =Tablinate.generate_table(@employees, { :table => { :border => 1, :class => 'fluid' }, :tbody => { :class => 'foo' } } )

### view-source:http://localhost:4567/

    <body>
      <table border='1' class='fluid'>
      <thead>
      <tr>
        <th>id</th>
        <th>first_name</th>
        <th>last_name</th>
        <th>title</th>
      </thead>
      <tbody class='foo'>
      <tr>
        <td>1</td>
        <td>Kyle</td>
        ...
        ...
      
