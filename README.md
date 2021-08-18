# RSpec testing guide for Ruby

## Purpose
This repo is designed to guide students through their first RSpec tests by creating a simple application following TDD (Test Driven Development) principles.  
The aim is to provide a better understanding of testing to use with code challenges for technical interviews.  
This is in conjunction with the RSpec Testing Workshops with Le Wagon. 

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

### A little refactor with Hooks
There will be multiple tests that use an instance of the Sandwhich object.  
Rather than writing 
```ruby
sandwhich = Sandwhich.new('delicious', [])
```
multiple times we will refactor it into something called a Hook, specifically the *before* hook  
Refactor the spec to look like the below:  

```ruby
RSpec.describe 'An ideal sandwhich' do
  before { @sandwhich = Sandwhich.new('delicious', []) }

  it 'is delicious' do
    taste = @sandwhich.taste
    expect(taste).to eq('delicious')
  end
end
```  

Note that we are using the @ instance of sandwhich within the ```it``` block  
The ```before``` hook will run before any examples in the spec file


### Add another test
Let's add another test.  
Below the first ```it``` block, add:  
```ruby
  it 'should have toppings' do
    toppings = @sandwhich.toppings
    expect(toppings).not_to be_empty
  end
```

Running ```rspec``` now, you will see there is one test passing (```is delicious```) and one that is failing (```should have toppings```)  

We know we will need to read from toppings so let's add that to the Sandwhich object:
```ruby
attr_reader :taste, :toppings
```

run ```rspec```  
Still errors... this is because our second test is checking that ```toppings``` is not empty, it must have a value in it.  

In the spec file, test adding a topping:  
```ruby
  it 'should have toppings' do
    toppings = @sandwhich.toppings
    toppings << 'cheese'
    expect(toppings).not_to be_empty
  end

```  

Running ```rspec``` again should now pass
