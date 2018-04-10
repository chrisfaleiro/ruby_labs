require_relative "contador"

class Estoque 

  attr_reader :livros

  def initialize
    @livros = []
    @livros.extend Contador
    @vendas = []
  end

  def << (livro)
    @livros << livro if livro
    self
  end

  def vende(livro)
    @livros.delete(livro)
    @vendas << livro
  end

  def method_missing(name)
    matcher = name.to_s.match "(.+)_que_mais_vendeu_por_(.+)"
    if matcher
      tipo = matcher[1]
      campo = matcher[2].to_sym
      que_mais_vendeu_por(tipo, &campo)
    else
      super
    end
  end

  def respond_to? (name)
    name.to_s.match "(.+)_que_mais_vendeu_por_(.+)" || super
  end

  def maximo_necessario
    @livros.maximo_necessario
  end

  def exporta_csv 
    @livros.each do |livro|
      livro.to_csv
    end
  end

  def total
    @livros.size
  end

  def mais_baratos_que(valor)
    @livros.select do |livro|
      if valor > livro.preco
        livro.titulo
      end
    end
  end

  private

  def quantidade_vendas_por(produto, &campo)
    @vendas.count { |venda| campo.call(venda) == campo.call(produto)}
  end

  def que_mais_vendeu_por(tipo, &campo)
    @vendas.select{|produto| produto.matches? tipo}.sort {|x1,x2| quantidade_vendas_por(x1, &campo) <=> quantidade_vendas_por(x2, &campo)}.last
  end

end