var express = require('express');
var router = express.Router();
const db = require('../db');

//create user_type table
router.get('/create_user_type_table', (req, res, next) => {
  db.createUserTypeTable(res);
});

//create user_type table
router.get('/create_doctor_type_table', (req, res, next) => {
  db.createDoctorTypeTable(res);
});

//create user_type table
router.get('/create_patient_type_table', (req, res, next) => {
  db.createPatientTypeTable(res);
});

//create user_type table
router.get('/create_doctors_table', (req, res, next) => {
  db.createDoctorsTable(res);
});

//create user_type table
router.get('/create_patient_table', (req, res, next) => {
  db.createPatientTable(res);
});

//create user_type table
router.get('/create_disease_type_table', (req, res, next) => {
  db.createDiseaseTypeTable(res);
});

//drop Table
router.get('/drop-table/:name', (req, res, next) => {
  db.dropTable(req.params.name, res);
});

//select *
router.get('/select/:name', (req, res, next) => {
  db.selectAll(req.params.name, res);
});

//insert into
router.get('/insert/:name', (req, res, next) => {
  db.insertInto(req.params.name, res);
});

module.exports = router;
