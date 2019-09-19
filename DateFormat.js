const moment = require('moment')

var startDate = function(d){
    var tmpDate =  moment(new Date(d)).format("YYYY-MM-DD");
    return moment(new Date(tmpDate+"T00:00:00.000Z")).valueOf()/1000;
}

var endDate = function(d){
    var tmpDate =  moment(new Date(d)).format("YYYY-MM-DD");
    return moment(new Date(tmpDate+"T23:59:59.000Z")).valueOf()/1000;
}

module.exports= {
    startDate: startDate,
    endDate: endDate
};