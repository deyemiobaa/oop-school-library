require '../book'

describe Book do
  it 'has a title' do
    book = Book.new('The Hobbit', 'Author')
    expect(book.title).to eq('The Hobbit', 'Author')
  end
  it 'has a author' do
    book = Book.new('The Hobbit', 'Author')
    expect(book.author).to eq('Author')
  end
end
