const express = require('express');
const mysql = require('mysql');
const bodyparser = require('body-parser');
const cors = require('cors')
const app = express();
var ds = require('./Data_Access/Student');
var moment = require('moment');
var date = require('./DateFormat');

const JSON2CSV = require('json2csv').parse;
const FileSystem = require('fs')

app.use(bodyparser.json());
app.use(cors());

app.listen(8080, () => {
    console.log("Server is Running on port 8080");
});

//Get Inverter
app.get('/inverter', (req, res) => {
    ds.getInverter((function (err, results) {
        const csv = JSON2CSV(results, { fields: ["id", "timestamp", "device_id", "site_id", "error_code", "error_code_raw", "lifetime_power", "dc_voltage", "dc_current", "dc_power", "ac_phase1_voltage", "ac_phase2_vol1tage", "ac_phase3_voltage", "ac_phase1_current", "ac_phase2_current", "ac_phase3_current", "power_factor", "ac_active_power", "ac_reactive_power", "grid_frequency", "operation_state", "operation_state_raw", "internal_temp", "lifetime_operation_hour"] });
        FileSystem.appendFile('C://CSV/csvtest.csv', csv, function (err) {
            if (err) console.log(err);
            res.send("hello");
        });
    }));
}); -

    //Get RawData
    app.get('/rawData', (req, res) => {
        ds.getRawData((function (err, results) {
            const csv = JSON2CSV(results);
            // , { fields: ["Id","SiteId","Device Name","data","date_int","device_category_id","is_formatted"] }
            FileSystem.appendFile('C://CSV/rawTest.csv', csv, function (err) {
                if (err) console.log(err);
                res.send("hello");
            });
        }));
    });

        //Get Data Test
        app.post('/reports/:type', (req, res) => {
            const type = req.params.type;
            var date = moment(new Date(),'YYYYMMDD');
            const types = ['inverter', 'radiator', 'thermometer'];
            if (type !== 'null') {
                ds.getDataTest((function (err, results) {
                    const csv = JSON2CSV(results);
                    FileSystem.appendFile('C://CSV/' + type + "_" + date + '.csv', csv, function (err) {
                        if (err) console.log(err);
                        res.send("Save Success!");
                    })
                }), req, type);
            }
            else {
                types.map(a => {
                    ds.getDataTest((function (err, results) {
                        const csv = JSON2CSV(results);
                        FileSystem.appendFile('C://CSV/' + a + '.csv', csv, function (err) {
                            if (err) console.log(err);
                        })
                    }), req, a);
                });
                res.send("Save Success!");
            }
        });

//Get Student CSV
app.get('/studentcsv', (req, res) => {
    ds.getData((function (err, results) {
        if (err) console.log(err);

        else {
            consoloe.log('result is=>', result);
            const csv = JSON2CSV(results, { fields: ["Sid", "Name", "Nrc", "Pno", "Address", "fName", "MName", "Religion", "FNrc", "MNrc"] });
            FileSystem.appendFile('C://CSV/studentList.csv', csv, function (err) {
                if (err) console.log(err);
                res.send("hello");
            });
        }
    }));
});

// Get all Student
app.get('/student', (req, res) => {
    ds.getData((function (err, results) {
        if (err) res.send(err);
        else res.send(results);
    }));
});

//Get an Student
app.get('/student/:id', (req, res) => {
    ds.getDataById((function (err, results) {
        if (err) res.send(err);
        else res.send(results);
    }), req);
});

//Insert Method
app.post('/student', (req, res) => {
    console.log("req is=>",req);
    ds.postData((function (err, results) {
        if (err) console.log("Failed :", err);
        else console.log("Success Inserting!");
    }), req);
    res.send('ok');
});

//Update Method
app.put('/student', (req, res) => {
    ds.putData((function (err, results) {
        if (err) console.log("Failed :", err);
        else console.log("Success Updating!");
    }), req);
    res.send('ok');
});

//Delete Method
app.delete('/student', (req, res) => {
    ds.putData((function (err, results) {
        if (err) console.log("Failed :", err);
        else console.log("Success Deleting!");
    }), req);
    res.send('ok');
});


