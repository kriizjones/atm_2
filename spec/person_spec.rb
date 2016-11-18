require './lib/person.rb'
require './lib/atm.rb'


describe Person do
subject { described_class.new(name: 'Kristoffer') }

  it 'is expected to have a :name on initialize' do
    expect(subject.name).not_to be nil
  end

  it 'is expected to raise error if no name is set' do
    expect { described_class.new }.to raise_error 'a name is required'
  end

it 'is expected to have a :cash attribute with value of 0 on initialize' do
  expect(subject.cash).to eq 0
end

it 'is expected to have a :account attribute' do
  expect(subject.account).to be nil
end

describe 'can create an account' do
  before { subject.create_account }
  it 'of account class' do
    expect(subject.account).to be_an_instance_of Account
  end
  it 'with himself as an owner' do
    expect(subject.account.owner).to be subject
  end
end

# describe 'can manage funds if an account been created' do
#   let(:atm) { Atm.new }
#   before { subject.create_account }
#   it 'can deposit funds' do
#     expect(subject.deposit(100)).to be_truthy
#   end
#
#   describe 'can not manage funds if no account been created' do
#     it 'can\'t deposit funds' do
#       expect { subject.deposit(100) }.to raise_error(RuntimeError, 'no account present')
#     end
#   end
end