// Importa a classe Receita definida em receita.dart, pra poder usá-la aqui
import 'package:nutrireceitas/models/receita.dart';

// Declara a variável receitasMock: uma lista de objetos do tipo Receita
List <Receita> receitas = [   // ← mudou de "receitasMock" para "receitas"

  // ===== Categoria: Café da manhã =====
  Receita(
    nome: 'Bolo de Banana Fit', // Nome da receita
    categoria: 'Café da manhã', // Categoria à qual pertence
    imagem: 'https://loremflickr.com/400/300/banana,cake', // Link da imagem
    ingredientes: ['2 bananas', '2 ovos', '1 xícara de aveia', '1 colher de mel'], // Lista de ingredientes
    modoPreparo: 'Amasse as bananas, misture tudo e leve ao forno por 30 minutos.', // Instruções de preparo
    tempoPreparo: 40, // Tempo de preparo em minutos
  ), // Fim da receita "Bolo de Banana Fit"
  Receita(
    nome: 'Panqueca de Aveia', // Nome da receita
    categoria: 'Café da manhã', // Categoria à qual pertence
    imagem: 'https://loremflickr.com/400/300/oat,pancake', // Link da imagem
    ingredientes: ['1 banana', '2 ovos', '3 colheres de aveia', 'canela a gosto'], // Lista de ingredientes
    modoPreparo: 'Bata tudo no liquidificador e frite em frigideira antiaderente.', // Instruções de preparo
    tempoPreparo: 15, // Tempo de preparo em minutos
  ), // Fim da receita "Panqueca de Aveia"
  Receita(
    nome: 'Vitamina de Frutas Vermelhas', // Nome da receita
    categoria: 'Café da manhã', // Categoria à qual pertence
    imagem: 'https://loremflickr.com/400/300/berry,smoothie', // Link da imagem
    ingredientes: ['1 copo de leite', 'morango', 'amora', '1 colher de aveia'], // Lista de ingredientes
    modoPreparo: 'Bata todos os ingredientes no liquidificador até ficar homogêneo.', // Instruções de preparo
    tempoPreparo: 5, // Tempo de preparo em minutos
  ), // Fim da receita "Vitamina de Frutas Vermelhas"

  // ===== Categoria: Low carb =====
  Receita(
    nome: 'Salada de Grão-de-bico', // Nome da receita
    categoria: 'Low carb', // Categoria à qual pertence
    imagem: 'https://loremflickr.com/400/300/chickpea,salad', // Link da imagem
    ingredientes: ['1 xícara de grão-de-bico cozido', 'tomate', 'pepino', 'azeite'], // Lista de ingredientes
    modoPreparo: 'Misture todos os ingredientes e tempere com azeite e sal.', // Instruções de preparo
    tempoPreparo: 15, // Tempo de preparo em minutos
  ), // Fim da receita "Salada de Grão-de-bico"
  Receita(
    nome: 'Frango Grelhado com Legumes', // Nome da receita
    categoria: 'Low carb', // Categoria à qual pertence
    imagem: 'https://loremflickr.com/400/300/grilled,chicken', // Link da imagem
    ingredientes: ['1 filé de frango', 'abobrinha', 'brócolis', 'azeite e temperos'], // Lista de ingredientes
    modoPreparo: 'Grelhe o frango e refogue os legumes no azeite com temperos a gosto.', // Instruções de preparo
    tempoPreparo: 25, // Tempo de preparo em minutos
  ), // Fim da receita "Frango Grelhado com Legumes"
  Receita(
    nome: 'Omelete de Espinafre', // Nome da receita
    categoria: 'Low carb', // Categoria à qual pertence
    imagem: 'https://loremflickr.com/400/300/spinach,omelette', // Link da imagem
    ingredientes: ['3 ovos', 'punhado de espinafre', 'sal e pimenta'], // Lista de ingredientes
    modoPreparo: 'Bata os ovos, misture o espinafre picado e frite na frigideira.', // Instruções de preparo
    tempoPreparo: 10, // Tempo de preparo em minutos
  ), // Fim da receita "Omelete de Espinafre"

  // ===== Categoria: Vegano =====
  Receita(
    nome: 'Wrap de Grão-de-bico', // Nome da receita
    categoria: 'Vegano', // Categoria à qual pertence
    imagem: 'https://loremflickr.com/400/300/vegan,wrap', // Link da imagem
    ingredientes: ['1 tortilla integral', 'grão-de-bico amassado', 'alface', 'cenoura ralada'], // Lista de ingredientes
    modoPreparo: 'Monte o wrap recheando a tortilla e enrole bem.', // Instruções de preparo
    tempoPreparo: 10, // Tempo de preparo em minutos
  ), // Fim da receita "Wrap de Grão-de-bico"
  Receita(
    nome: 'Curry de Legumes', // Nome da receita
    categoria: 'Vegano', // Categoria à qual pertence
    imagem: 'https://loremflickr.com/400/300/vegetable,curry', // Link da imagem
    ingredientes: ['leite de coco', 'batata-doce', 'couve-flor', 'curry em pó'], // Lista de ingredientes
    modoPreparo: 'Refogue os legumes, adicione o leite de coco e o curry, cozinhe por 20 min.', // Instruções de preparo
    tempoPreparo: 30, // Tempo de preparo em minutos
  ), // Fim da receita "Curry de Legumes"
  Receita(
    nome: 'Hambúrguer de Lentilha', // Nome da receita
    categoria: 'Vegano', // Categoria à qual pertence
    imagem: 'https://loremflickr.com/400/300/lentil,burger', // Link da imagem
    ingredientes: ['1 xícara de lentilha cozida', 'farinha de aveia', 'cebola', 'temperos'], // Lista de ingredientes
    modoPreparo: 'Amasse a lentilha, misture os demais ingredientes e frite os hambúrgueres.', // Instruções de preparo
    tempoPreparo: 20, // Tempo de preparo em minutos
  ), // Fim da receita "Hambúrguer de Lentilha"

  // ===== Categoria: Saladas =====
  Receita(
    nome: 'Salada Caprese Fit', // Nome da receita
    categoria: 'Saladas', // Categoria à qual pertence
    imagem: 'https://loremflickr.com/400/300/caprese,salad', // Link da imagem
    ingredientes: ['tomate', 'mussarela de búfala', 'manjericão', 'azeite'], // Lista de ingredientes
    modoPreparo: 'Fatie o tomate e a mussarela, intercale e finalize com manjericão e azeite.', // Instruções de preparo
    tempoPreparo: 10, // Tempo de preparo em minutos
  ), // Fim da receita "Salada Caprese Fit"
  Receita(
    nome: 'Salada de Quinoa', // Nome da receita
    categoria: 'Saladas', // Categoria à qual pertence
    imagem: 'https://loremflickr.com/400/300/quinoa,salad', // Link da imagem
    ingredientes: ['1 xícara de quinoa cozida', 'pepino', 'tomate cereja', 'limão'], // Lista de ingredientes
    modoPreparo: 'Misture a quinoa com os vegetais picados e tempere com limão e azeite.', // Instruções de preparo
    tempoPreparo: 20, // Tempo de preparo em minutos
  ), // Fim da receita "Salada de Quinoa"
  Receita(
    nome: 'Salada Verde com Frango', // Nome da receita
    categoria: 'Saladas', // Categoria à qual pertence
    imagem: 'https://loremflickr.com/400/300/chicken,salad', // Link da imagem
    ingredientes: ['folhas verdes', 'frango desfiado', 'tomate cereja', 'azeite'], // Lista de ingredientes
    modoPreparo: 'Monte a base de folhas, adicione o frango e finalize com azeite.', // Instruções de preparo
    tempoPreparo: 15, // Tempo de preparo em minutos
  ), // Fim da receita "Salada Verde com Frango"

  // ===== Categoria: Lanches =====
  Receita(
    nome: 'Bolinho de Aveia e Cacau', // Nome da receita
    categoria: 'Lanches', // Categoria à qual pertence
    imagem: 'https://loremflickr.com/400/300/oat,cookie', // Link da imagem
    ingredientes: ['aveia', 'cacau em pó', 'banana amassada', 'mel'], // Lista de ingredientes
    modoPreparo: 'Misture tudo, molde bolinhas e leve à geladeira por 20 minutos.', // Instruções de preparo
    tempoPreparo: 20, // Tempo de preparo em minutos
  ), // Fim da receita "Bolinho de Aveia e Cacau"
  Receita(
    nome: 'Mix de Castanhas', // Nome da receita
    categoria: 'Lanches', // Categoria à qual pertence
    imagem: 'https://loremflickr.com/400/300/mixed,nuts', // Link da imagem
    ingredientes: ['castanha-do-pará', 'amêndoas', 'nozes', 'passas'], // Lista de ingredientes
    modoPreparo: 'Misture todas as castanhas e frutas secas em um pote.', // Instruções de preparo
    tempoPreparo: 5, // Tempo de preparo em minutos
  ), // Fim da receita "Mix de Castanhas"
  Receita(
    nome: 'Iogurte com Granola', // Nome da receita
    categoria: 'Lanches', // Categoria à qual pertence
    imagem: 'https://loremflickr.com/400/300/yogurt,granola', // Link da imagem
    ingredientes: ['iogurte natural', 'granola', 'mel', 'frutas picadas'], // Lista de ingredientes
    modoPreparo: 'Monte em camadas: iogurte, granola, frutas e finalize com mel.', // Instruções de preparo
    tempoPreparo: 5, // Tempo de preparo em minutos
  ), // Fim da receita "Iogurte com Granola"

  // ===== Categoria: Sobremesas =====
  Receita(
    nome: 'Mousse de Chocolate Fit', // Nome da receita
    categoria: 'Sobremesas', // Categoria à qual pertence
    imagem: 'https://loremflickr.com/400/300/chocolate,mousse', // Link da imagem
    ingredientes: ['abacate', 'cacau em pó', 'mel', 'leite vegetal'], // Lista de ingredientes
    modoPreparo: 'Bata todos os ingredientes no liquidificador até ficar cremoso e leve à geladeira.', // Instruções de preparo
    tempoPreparo: 10, // Tempo de preparo em minutos
  ), // Fim da receita "Mousse de Chocolate Fit"
  Receita(
    nome: 'Picolé de Frutas', // Nome da receita
    categoria: 'Sobremesas', // Categoria à qual pertence
    imagem: 'https://loremflickr.com/400/300/fruit,popsicle', // Link da imagem
    ingredientes: ['morango', 'banana', 'suco de laranja natural'], // Lista de ingredientes
    modoPreparo: 'Bata as frutas com o suco e congele em forminhas de picolé por 4 horas.', // Instruções de preparo
    tempoPreparo: 15, // Tempo de preparo em minutos
  ), // Fim da receita "Picolé de Frutas"
  Receita(
    nome: 'Brownie de Batata-doce', // Nome da receita
    categoria: 'Sobremesas', // Categoria à qual pertence
    imagem: 'https://loremflickr.com/400/300/sweet,potato,brownie', // Link da imagem
    ingredientes: ['batata-doce cozida', 'cacau em pó', 'ovos', 'mel'], // Lista de ingredientes
    modoPreparo: 'Amasse a batata-doce, misture os demais ingredientes e asse por 25 minutos.', // Instruções de preparo
    tempoPreparo: 35, // Tempo de preparo em minutos
  ), // Fim da receita "Brownie de Batata-doce"
]; // Fim da lista receitasMock