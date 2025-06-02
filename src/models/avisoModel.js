var database = require("../database/config");

function listar() {
    console.log("ACESSEI O AVISO  MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()");
    var instrucaoSql = `SELECT usuario.id, usuario.nome AS usuario, exercicio.nome, pr.id AS idPost, pr.data_dia, pr.valor
	    FROM exercicio
        JOIN personalrecord pr ON exercicio.id = pr.fk_exercicio
        JOIN usuario ON pr.fk_usuario = usuario.id
        ORDER BY exercicio.nome;`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function publicar(fk_usuario, fk_exercicio, date, valor) {
    console.log("ACESSEI O AVISO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function publicar(): ", fk_usuario, fk_exercicio, date, valor);
    var instrucaoSql = `
        INSERT INTO personalrecord (fk_usuario, fk_exercicio, data_dia, valor) VALUES ('${fk_usuario}', '${fk_exercicio}', '${date}', '${valor}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function deletar(idAviso) {
    console.log("ACESSEI O AVISO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function deletar():", idAviso);
    var instrucaoSql = `
        DELETE FROM personalrecord WHERE id = ${idAviso};
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function listarExercicio() {
    console.log("ACESSEI O AVISO  MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listarExercicio()");
    var instrucaoSql = `
        Select id, nome FROM exercicio;
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function listarExercicioUsuarios(usuario) {
    console.log("ACESSEI O AVISO  MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listarExercicioUsuarios()");
    var instrucaoSql = `
    SELECT ex.id, ex.nome FROM exercicio ex INNER JOIN personalrecord pr
    ON ex.id = pr.fk_exercicio
    WHERE pr.fk_usuario = ${usuario}
    GROUP BY ex.id;
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function obterDadosGrafico(idusuario, idExercicio) {
    console.log("ACESSEI O AVISO  MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function obterDadosGrafico()");
    var instrucaoSql = `
    Select  PR.valor, PR.data_dia From Exercicio EX INNER JOIN PersonalRecord PR
    ON Ex.Id = PR.fk_exercicio
    WHERE PR.fk_usuario =  ${idusuario} AND PR.FK_EXERCICIO = ${idExercicio}
    ORDER BY DATA_DIA DESC;
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}



module.exports = {
    listar,
    listarExercicio,
    listarExercicioUsuarios,
    obterDadosGrafico,
    publicar,
    deletar
}
