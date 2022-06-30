require '../decorator'

describe Decorator do
  it 'has a name' do
    decorator = Decorator.new('John')
    expect(decorator).to have_attributes(nameable: 'John')
  end
end

describe CapitalizeDecorator do
  it 'Capitalizes name' do
    expect(CapitalizeDecorator.new(Decorator.mew('John'))).to have_attributes(nameable: 'John')
  end
end
describe TrimmerDecorator do
  it 'Trims name' do
    expect(TrimmerDecorator.new(Decorator.mew('John'))).to have_attributes(nameable: 'John')
  end
end
