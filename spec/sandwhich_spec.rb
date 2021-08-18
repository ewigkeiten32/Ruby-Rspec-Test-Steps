require_relative '../sandwhich'

RSpec.describe 'An ideal sandwhich' do
  before { @sandwhich = Sandwhich.new('delicious', []) }

  it 'is delicious' do
    taste = @sandwhich.taste
    expect(taste).to eq('delicious')
  end

  it 'should have toppings' do
    toppings = @sandwhich.toppings
    toppings << 'cheese'
    expect(toppings).not_to be_empty
  end
end
