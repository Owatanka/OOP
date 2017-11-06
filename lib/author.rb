class Author

  attr_reader :name, :biography

  def initialize(name, biography)
    @name, @biography = name, biography
  end

  def to_s
    "#{name}"
  end
  
  def ==(other)
    if other.is_a? Book
      title == other.title && author == other.author
    else
      false
    end
  end
 
end
