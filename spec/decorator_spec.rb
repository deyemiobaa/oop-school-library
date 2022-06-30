require '../decorator'

describe Decorator do
  it 'has a name' do
    decorator = Decorator.new('alabamaTheFirst')
    expect(decorator).to have_attributes(nameable: 'alabamaTheFirst')
  end
end

describe CapitalizeDecorator do
  it 'Capitalizes name' do
    decorator = CapitalizeDecorator.new('alabamaTheFirst')
    expect(decorator).to respond_to(:correct_name)
  end
end

describe TrimmerDecorator do
  it 'Trims name' do
    decorator = TrimmerDecorator.new('AlabamaTheFirst')
    expect(decorator).to respond_to(:correct_name)
  end
end
