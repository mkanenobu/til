const moment = require('moment');

const date = moment(data.date, 'YYYY年MM月DD日 HH:mm:ss').toISOString();

console.log(date);
