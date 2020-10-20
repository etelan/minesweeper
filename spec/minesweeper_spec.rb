# File to require
require 'minesweeper'


describe 'get_size' do
  it 'returns beginner when input is b' do

    allow($stdin).to receive(:gets).and_return('b')

    test = Minesweeper.new
    test.stub(:gets) {'b'}

    expect(test.get_size).to eq 'beginner'
  end
end
