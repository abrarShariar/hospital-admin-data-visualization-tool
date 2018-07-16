const mysql = require('mysql');
const db = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_DATABASE
});

db.connect();

//create user_type table
const createUserTypeTable = (res) => {
  const queryStr = `CREATE TABLE IF NOT EXISTS user_type (
    id int not null auto_increment,
    type varchar(255),
    primary key (id)
  )`;
  db.query(queryStr, (err, rows, fields) => {
    if(err) throw err

    console.log('createUserTypeTable: ', rows);
    return res.json(rows);
  });
};

//create dcotor_type table
const createDoctorTypeTable = (res) => {
  const queryStr = `CREATE TABLE IF NOT EXISTS doctor_type (
    id int not null auto_increment,
    type varchar(255),
    primary key (id)
  )`;
  db.query(queryStr, (err, rows, fields) => {
    if(err) throw err

    console.log('createDoctorTypeTable: ', rows);
    return res.json(rows);
  });
};

//create patient_type table
const createPatientTypeTable = (res) => {
  const queryStr = `CREATE TABLE IF NOT EXISTS patient_type (
    id int not null auto_increment,
    type varchar(255),
    primary key (id)
  )`;
  db.query(queryStr, (err, rows, fields) => {
    if(err) throw err

    console.log('createPatientTypeTable: ', rows);
    return res.json(rows);
  });
};

//create disease_type table
const createDiseaseTypeTable = (res) => {
  const queryStr = `CREATE TABLE IF NOT EXISTS disease_type (
    id int not null auto_increment,
    type varchar(255),
    primary key (id)
  )`;
  db.query(queryStr, (err, rows, fields) => {
    if(err) throw err

    console.log('createDiseaseTypeTable: ', rows);
    return res.json(rows);
  });
};


//create doctors table
const createDoctorsTable = (res) => {
  const queryStr = `CREATE TABLE IF NOT EXISTS doctors (
    id int not null auto_increment,
    name varchar(255),
    designation varchar(255),
    title varchar(255),
    available_hours varchar(255),
    join_date timestamp,
    date_of_birth timestamp,
    specialization varchar(255),
    primary key (id)
  )`;
  db.query(queryStr, (err, rows, fields) => {
    if(err) throw err

    console.log('createDoctorsTable: ', rows);
    return res.json(rows);
  });
};

//create doctors table
const createPatientTable = (res) => {
  const queryStr = `CREATE TABLE IF NOT EXISTS patient (
    id int not null auto_increment,
    name varchar(255),
    date_of_admit timestamp,
    release_date timestamp,
    disease varchar(255),
    critical_level int,
    address varchar(255),
    primary key (id)
  )`;
  db.query(queryStr, (err, rows, fields) => {
    if(err) throw err

    console.log('createPatientTable: ', rows);
    return res.json(rows);
  });
};


//drop any table by param
const dropTable = (name, res) => {
  const queryStr = 'drop table ' + name;
  db.query(queryStr, (err, rows, fields) => {
    if(err) throw err

    console.log('drop Table: ', rows);
    return res.json(rows);
  })
};

//select all
const selectAll = (name, res) => {
  const queryStr = 'select * from ' + name;
  db.query(queryStr, (err, rows, fields) => {
    if(err) throw err

    console.log('select Table: ', rows);
    return res.json(rows);
  })
}


//insert
const insertInto = (name, res) => {
  const queryStrType = `
    INSERT INTO ${name}
    (type)
    VALUES
      ('test1'),
      ('test2'),
      ('test3'),
      ('test4')
  `;

  const queryStrDoctors = `
    INSERT INTO doctors
      (name, designation, title, specialization)
    VALUES
      ('abc', 'intern', 'intern doctor', 'eye'),
      ('xyz', 'intern', 'intern doctor', 'ear'),
      ('test1', 'child', 'child care doctor', 'child'),
      ('test2', 'psychiatrist', 'psychiatrist care doctor', 'psychology')
  `;

  const queryStrPatient = `
    INSERT INTO patient
      (name, disease, critical_level, address)
    VALUES
      ('p1', 'eye surgery', 10, 'dhaka'),
      ('p2', 'paralysis', 1, 'comilla'),
      ('p3', 'neural path', 2, 'aiub'),
      ('p4', 'psychiatrist', 4, 'banani')
  `;

  let str = queryStrType;
  if(name === 'doctors'){
    str = queryStrDoctors;
  } else if (name === 'patient') {
    str = queryStrPatient;
  }

  db.query(str, (err, rows, fields) => {
    if(err) throw err

    console.log('insert into table: ', rows);
    return res.json(rows);
  });

}


module.exports = {
  createUserTypeTable,
  createDoctorTypeTable,
  createPatientTypeTable,
  createDoctorsTable,
  createPatientTable,
  createDiseaseTypeTable,
  dropTable,
  selectAll,
  insertInto
}
