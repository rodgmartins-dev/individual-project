var express = require("express");
var router = express.Router();

var avisoController = require("../controllers/avisoController");

router.get("/listar", function (req, res) {
    avisoController.listar(req, res);
});

router.get("/listar/:idUsuario", function (req, res) {
    avisoController.listarPorUsuario(req, res);
});

router.get("/pesquisar/:descricao", function (req, res) {
    avisoController.pesquisarDescricao(req, res);
});

router.post("/publicar/:idUsuario", function (req, res) {
    avisoController.publicar(req, res);
});

router.put("/editar/:idAviso", function (req, res) {
    avisoController.editar(req, res);
});

router.delete("/deletar/:idAviso", function (req, res) {
    avisoController.deletar(req, res);
});

router.get("/listarExercicio", function (req, res) {
    avisoController.listarExercicio(req, res);
});

router.get("/listarExercicioUsuarios/:usuario", function (req, res) {
    avisoController.listarExercicioUsuarios(req, res);
});

router.get("/obterDadosGrafico/:idExercicio", function (req, res) {
    avisoController.obterDadosGrafico(req, res);
});

module.exports = router;