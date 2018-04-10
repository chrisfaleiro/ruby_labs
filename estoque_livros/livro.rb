require_relative "produto"
require_relative "impresso"

class Livro < Produto

  include Impresso

  attr_reader :possui_sobrecapa

  def initialize(titulo, preco, ano_lancamento, possui_reimpressao, editora, possui_sobrecapa)
    super(titulo, preco, ano_lancamento, editora) 
    @possui_reimpressao = possui_reimpressao
    @possui_sobrecapa = possui_sobrecapa
  end

  def matches?(tipo)
    ["livro", "impresso"].include? tipo
  end

end