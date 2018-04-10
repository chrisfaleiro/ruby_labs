require_relative 'ui'

def salva_rank(nome, pontos)
    conteudo = "#{nome}\n#{pontos}"
    File.write "rank.txt", conteudo
end

def le_rank
  texto = File.read("rank.txt")
  palavras = texto.split("\n")
  campeao = palavras[0]
  pontos_campeao = palavras[1]
  avisa_campeao_atual campeao, pontos_campeao
end