# RSpec testing steps

## Setup

### Create a new directory and 'cd' into it
```mkdir Ruby-Rspec-Test-Steps && cd Ruby-Rspec-Test-Steps```

### Initialize Gemfile
```bundle init```  
This creates a Gemfile in the root of your project

### Install RSpec
Open the Gemfile and add the below line  
```gem 'rspec'```  
Then in your terminal install the dependencies with  
```bundle```  
or   
```bundle install```

### Create files
Create the root app file  
```touch app.rb```  
Create the test directory  
```mkdir spec```

### Create specs 
```touch spec/sandwhich_spec.rb```  
In this file add:  
```ruby
RSpec.describe 'An ideal sandwhich' do
  it 'is delicious' do
  end
end
```  

### Fill in the nested block and expectation
```ruby
RSpec.describe 'An ideal sandwhich' do
  it 'is delicious' do
    sandwhich = Sandwhich.new('delicious', [])
    taste = sandwhich.taste
    expect(taste).to eq('delicious')
  end
end
```

The ```describe``` block defines what you're testing and keeps related specs together
The nested block ```it``` is the use of the sandwhich.  
```expect``` is an expectation and verifies the exptected outcome

### Test! 
In your terminal type:  
```rspec```  
You should see an error  
```uninitialized constant Sandwhich```  

To fix this you will need to create the Sandwhich object  

Create a new file ```sandwhich.rb```  
You will then need to require sandwhich.rb in your test file  
At the top of spec/sandwhich.rb add:  
```require_relative '../sandwhich'```  

In sandwhich.rb, fill it with: 
```ruby
class Sandwhich
  def initialize(taste, toppings)
    @taste = taste
    @toppings = toppings
  end
end
```  

Run ```rspec``` again  
You should see the error ```undefined method `taste' for #<Sandwhich:0x00```  
Make ```taste``` readable  
You should then have the following: 
```ruby 
class Sandwhich
  attr_reader :taste

  def initialize(taste, toppings)
    @taste = taste
    @toppings = toppings
  end
end
```  

Run ```rspec``` again and look at that green!
