require_relative "produto"
require_relative "impresso"

class Revista < Produto

  include Impresso

  attr_reader :numero

  def initialize(titulo, preco, ano_lancamento, possui_reimpressao, editora, numero)
    super(titulo, preco, ano_lancamento, editora) 
    @possui_reimpressao = possui_reimpressao
    @numero = numero
  end

  def matches?(tipo)
    ["revista", "impresso"].include? tipo
  end

end