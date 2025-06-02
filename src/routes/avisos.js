var express = require("express");
var router = express.Router();

var avisoController = require("../controllers/avisoController");

router.get("/listar", function (req, res) {
    avisoController.listar(req, res);
});

router.post("/publicar/:idUsuario", function (req, res) {
    avisoController.publicar(req, res);
});

router.delete("/deletar/:idPost", function (req, res) {
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