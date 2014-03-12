require 'rspec'
require 'term'

describe Term do
  before do
    Term.clear
  end
  describe '#initialize' do
    it 'creates an instance of Term' do
      test_term = Term.new("word", "definition")
      test_term.should be_an_instance_of Term
    end
  end
  describe '.all' do
    it 'is an empty array' do
      Term.all.should eq []
    end
  end

  describe '#save' do
    it 'saves a term to the array' do
      test_term = Term.new('word', 'definition')
      test_term.save
      Term.all.should eq [test_term]
    end
  end

  describe '.clear' do
    it 'clears the array before each spec is run' do
      test_term = Term.new('word', 'definition')
      test_term.save
      Term.clear
      Term.all.should eq []
    end
  end
  describe '.create' do
    it 'creates an instance of Term' do
      test_term = Term.create('word', 'definition')
      test_term.should be_an_instance_of Term
    end
    it 'saves a new instance to the array' do
      test_term = Term.create('word', 'definition')
      Term.all.should eq [test_term]
    end
  end
end
