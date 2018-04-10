require_relative "livro"
require_relative "revista"
require_relative "ebook"
require_relative "estoque"

def livro_para_newsletter(livro)
     if livro.ano_lancamento < 2000
     puts "Newsletter/Liquidacao"
     puts livro.titulo
     puts livro.preco
     puts livro.possui_reimpressao?
     end
end

algoritmos = Livro.new("Algoritmos", 100.00, 2011, true, "Abril", true)
arquitetura = Livro.new("Introdução À Arquitetura e Design de Software", 70.00, 2011, true, "Six", false)
revistona = Revista.new("Revista de Ruby", 10.00, 2018, false, "Revistas", 2)
online_arquitetura = EBook.new("Introdução a Arquitetura e Design de Software", 50.00, 2012, "editora")

estoque = Estoque.new

estoque << algoritmos
estoque << algoritmos
estoque << algoritmos
estoque << arquitetura
estoque << arquitetura
estoque << arquitetura
estoque << arquitetura
estoque << arquitetura
estoque << revistona
estoque << online_arquitetura
estoque.vende (algoritmos)
estoque.vende (algoritmos)
estoque.vende (arquitetura)
estoque.vende (arquitetura)
estoque.vende (arquitetura)
estoque.vende (revistona)
estoque.vende (online_arquitetura)

puts estoque.livro_que_mais_vendeu_por_titulo.titulo

puts estoque.revista_que_mais_vendeu_por_titulo.titulo

puts estoque.ebook_que_mais_vendeu_por_titulo.titulo

puts estoque.respond_to? :ebook_que_mais_vendeu_por_titulo

#estoque.exporta_csv

#estoque_total = estoque.total

#puts "#{estoque_total}"

#livros_mais_baratos_que = estoque.mais_baratos_que(80)

#puts "mais baratos que 80: #{livros_mais_baratos_que}"