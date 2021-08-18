require_relative '../sandwhich'

RSpec.describe 'An ideal sandwhich' do
  it 'is delicious' do
    sandwhich = Sandwhich.new('delicious', [])
    taste = sandwhich.taste
    expect(taste).to eq('delicious')
  end
end
