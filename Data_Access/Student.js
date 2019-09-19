const mysql = require('mysql');
var date = require('../DateFormat');
var moment = require('moment')

mySqlconnection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'student'
});

// mySqlconnection = mysql.createConnection({
//     host: '159.65.138.197',
//     user: 'kumo',
//     password: 'kumO!8118',
//     database: 'sunedge_db'
// });

mySqlconnection.connect((err) => {
    if (!err) console.log("DB connection success!");
    else console.log("DB connection failed!", err);
});

var getData = function (callback) {
    mySqlconnection.query('SELECT * FROM student', (err, rows, fields) => {
        console.log('callback');
        callback(err, rows);
    });
}

//test inverter
var getInverter = function (callback) {
    mySqlconnection.query('SELECT * FROM tbl_site2014_inverter_data LIMIT 50;', (err, rows, fields) => {
        callback(err, rows);
    });
}

// date(moment.unix("1565344320",'YYYYMMDD')._d)

//test dataTest
var getDataTest = function (callback, req, type) {
    var dateArr = Object.values(req.body);
    var startDate = date.startDate(dateArr[0]);
    var endDate = date.endDate(dateArr[1]);
    mySqlconnection.query("SELECT * FROM tbl_site2084_" + type + "_data WHERE timestamp BETWEEN \'" + startDate + "\' AND \'" + endDate + "\' LIMIT 50 ", (err, rows, fields) => {
        callback(err, rows);
    });
}

//test rawData
var getRawData = function (callback) {
    mySqlconnection.query('SELECT data FROM tbl_raw_data LIMIT 50;', (err, rows, fields) => {
        callback(err, rows);
    });
}

var getDataById = function (callback, req) {
    mySqlconnection.query('SELECT * FROM student.student WHERE Sid = ?', [req.params.id], (err, rows, fields) => {
        callback(err, rows);
    });
}

var postData = function (callback, req) {
    var stu = Object.values(req.body);
    console.log("stur is=>",stu);
    var sql = "INSERT INTO student VALUES (?)";
    mySqlconnection.query(sql, [stu], (err, rows) => {
        callback(err, rows);
    });
}

var putData = function (callback, req) {
    var data = Object.entries(req.body).map(a => a[1]);
    var sid = data[0];
    var sql = "UPDATE student SET Sid =? ,Name = ?,Nrc = ?,Pno = ?,Address = ?,fName = ?,MName = ?,Religion = ?,FNrc = ?,MNrc = ? WHERE Sid=" + sid;
    mySqlconnection.query(sql, data, (err, rows) => {
        callback(err, rows);
    });
}

var deleteData = function (callback, req) {
    var sid = req.body.data
    var sql = "DELETE FROM student WHERE Sid=" + sid;
    mySqlconnection.query(sql, (err, rows) => {
        callback(err, rows);
    });
}

module.exports = {
    getData: getData,
    getDataById: getDataById,
    postData: postData,
    putData: putData,
    deleteData: deleteData,
    getInverter: getInverter,
    getRawData: getRawData,
    getDataTest: getDataTest
} 