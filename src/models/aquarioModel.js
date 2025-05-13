var database = require("../database/config");

function buscarAquariosPorEmpresa(exercicioId) {

  var instrucaoSql = `SELECT * FROM exercicio e WHERE id = ${exercicioId}`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function cadastrar(fk_exercicio, data_dia, valor) {

  var instrucaoSql = `INSERT INTO (fk_exercicio, data_dia, valor) personalrecord VALUES (${fk_exercicio}, ${data_dia}, ${valor})`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}


module.exports = {
  buscarAquariosPorEmpresa,
  cadastrar
}
