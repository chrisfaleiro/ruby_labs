require_relative "produto"

class EBook < Produto

  def matches?(tipo)
    ["ebook", "digital"].include? tipo
  end

end