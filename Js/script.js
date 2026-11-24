// evita que um texto digitado vire html na pagina
function limpar(texto) {
  const div = document.createElement("div");
  div.textContent = texto;
  return div.innerHTML;
}

// SERVICOS: busca na tabela servicos e monta os cards
async function carregarServicos() {
  const caixa = document.getElementById("listaServicos");
  try {
    const resp = await fetch("php/servicos_listar.php");
    const servicos = await resp.json();

    caixa.innerHTML = "";
    servicos.forEach(function (s) {
      caixa.innerHTML += `
        <div class="col-md-4">
          <div class="card card-servico">
            <img src="${s.imagem}" alt="${limpar(s.nome)}">
            <div class="card-body d-flex flex-column">
              <h3 class="h5 fw-bold">${limpar(s.nome)}</h3>
              <p class="text-muted">${limpar(s.descricao)}</p>
              <div class="d-flex justify-content-between align-items-center mt-auto pt-2">
                <span class="price">R$ ${parseInt(s.preco)}<small class="fs-6 text-muted">/mês</small></span>
                <a href="${s.pagina}" class="btn btn-orcamento btn-sm">Solicitar orçamento</a>
              </div>
            </div>
          </div>
        </div>`;
    });
  } catch (erro) {
    caixa.innerHTML = '<p class="text-white text-center">Não foi possível carregar os serviços.</p>';
  }
}

// DEPOIMENTOS: busca na tabela depoimentos e monta os cards
async function carregarDepoimentos() {
  const caixa = document.getElementById("listaDepoimentos");
  try {
    const resp = await fetch("php/depoimentos_listar.php");
    const depoimentos = await resp.json();

    caixa.innerHTML = "";
    depoimentos.forEach(function (d) {
      let foto = '<i class="bi bi-person-circle fs-1 me-3"></i>';
      if (d.foto) {
        foto = `<img src="${d.foto}" alt="Foto de ${limpar(d.nome)}" class="me-3">`;
      }

      caixa.innerHTML += `
        <div class="col-md-4">
          <div class="card card-depoimento p-4">
            <i class="bi bi-quote quote-icon mb-2"></i>
            <p>"${limpar(d.mensagem)}"</p>
            <div class="d-flex align-items-center mt-3">
              ${foto}
              <div>
                <strong>${limpar(d.nome)}</strong>
                <div class="text-muted small">${d.data}</div>
              </div>
            </div>
          </div>
        </div>`;
    });
  } catch (erro) {
    caixa.innerHTML = '<p class="text-center">Não foi possível carregar os depoimentos.</p>';
  }
}

// DEPOIMENTOS: envia o formulario para gravar na tabela
async function enviarDepoimento(evento) {
  evento.preventDefault();
  const form = evento.target;
  const aviso = document.getElementById("msgDepoimento");

  const resp = await fetch("php/depoimentos_inserir.php", {
    method: "POST",
    body: new FormData(form)
  });
  const dados = await resp.json();

  aviso.textContent = dados.msg;
  aviso.className = dados.ok ? "mt-3 fw-semibold text-success" : "mt-3 fw-semibold text-danger";

  if (dados.ok) {
    form.reset();
    carregarDepoimentos();
  }
}

// CONTATO: envia o formulario para gravar na tabela
async function enviarContato(evento) {
  evento.preventDefault();
  const form = evento.target;
  const aviso = document.getElementById("msgContato");

  const resp = await fetch("php/contato_inserir.php", {
    method: "POST",
    body: new FormData(form)
  });
  const dados = await resp.json();

  aviso.textContent = dados.msg;
  aviso.className = dados.ok ? "mt-3 fw-semibold text-success" : "mt-3 fw-semibold text-warning";

  if (dados.ok) {
    form.reset();
  }
}

document.getElementById("formDepoimento").addEventListener("submit", enviarDepoimento);
document.getElementById("formContato").addEventListener("submit", enviarContato);

carregarServicos();
carregarDepoimentos();
