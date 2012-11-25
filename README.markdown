# tablinate

* Code: [http://github.com/unholydh/tablinate](http://github.com/unholydh/tablinate)

## Author(s)

* [Kyle Carter](http://github.com/unholydh)
* [Kevin Collette](http://github.com/collettiquette)

## Description

tablinate is a ruby gem that takes arrays of hashes or active record objects and converts them into tables in a view file. It is intended for use in small projects or applications whose schemas are closely related to what a table's output should be.

## Install

    gem install tablinate

## Sample Sinatra Code:

### 1) app.rb

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

### 2) views/index.haml

    %body
      =Tablinate.generate_table(@employees)

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
        <td>Matt</td>
        <td>Smith</td>
        <td>Time Lord</td>
      </tr>
      <tr>
        <td>2</td>
        <td>Jack</td>
        <td>Harkness</td>
        <td>Time Agent</td>
      </tr>
      <tr>
        <td>3</td>
        <td>Tom</td>
        <td>Baker</td>
        <td>Time Lord</td>
      </tr>
      <tr>
        <td>4</td>
        <td>David</td>
        <td>Tennant</td>
        <td>Time Lord</td>
      </tr>
      <tr>
        <td>5</td>
        <td>Christopher</td>
        <td>Eccleston</td>
        <td>Time Lord</td>
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
        <td>Matt</td>
        ...
        ...
### Further notes on options
Options are highly expandable, and support many useful notations. For example:
    @table_params = {
      :table => { :class => "eek", :id => 'rawr' },
      :tbody => {
        :tr => { :class => [ 'class1', 'class2', 'class3' ], :id => 'meow' },
        :td => { :class => 'rawr', :id => [1,2,3] }
      }
    }
    @table = [
      { :column1 => 'value1', :column2 => 'value2', :column3 => 'value3' },
      { :column1 => 'value1', :column2 => 'value2', :column3 => 'value3' },
      { :column1 => 'value1', :column2 => 'value2', :column3 => 'value3' },
      { :column1 => 'value1', :column2 => 'value2', :column3 => 'value3' }
    ]

    Tablinate.generate_table(@table, @table_params)

    <table class='eek' id='rawr'>
    <table>
    <thead>
      <tr>
        <th>column1</th>
        <th>column2</th>
        <th>column3</th>
      </tr>
    </thead>
    <tbody>
      <tr class='class1' id='meow'>
        <td class='rawr' id='1value1</td>
        <td class='rawr' id='2value2</td>
        <td class='rawr' id='3value3</td>
      </tr>
        <tr class='class2' id='meow'>
        <td class='rawr' id='1value1</td>
        <td class='rawr' id='2value2</td>
        <td class='rawr' id='3value3</td>
      </tr>
      <tr class='class3' id='meow'>
        <td class='rawr' id='1value1</td>
        <td class='rawr' id='2value2</td>
        <td class='rawr' id='3'>value3</td>
      </tr>
      <tr class='class1' id='meow'>
        <td class='rawr' id='1'>value1</td>
        <td class='rawr' id='2'>value2</td>
        <td class='rawr' id='3'>value3</td>
      </tr>
    </tbody>
    </table>
### Haml note

When using haml, you may need to unescape html tags by: 

    %body
      != Tablinate.generate_table(...
