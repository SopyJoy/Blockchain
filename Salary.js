const express = require('express');
const bodyParser = require('body-parser');

const app = express();

app.use(bodyParser.urlencoded({ extended: true}));

app.get('/', (req, res) => {
    res.send('<form action = "/Salarynodeapp" method="post">Employee Name:<input type="text" name="empName"><br>Number of days worked:<input type="number" name="numDay"><br>Rate per day:<input type="number" name="rateDay"><button type="submit"Calculate</button></form>');
});

app.post('/Salarynodeapp', (req, res) => {
const numDay = parseFloat(req.body.numDay);
const rateDay = parseFloat(req.body.rateDay);
const empName = req.body.empName;
const grossPay = numDay*rateDay;
const s_money = grossPay*0.028;
const tax = grossPay*0.2;
const Philhealth = grossPay*0.08;
const totalDeduction = s_money+tax+Philhealth;
const netPay = grossPay-totalDeduction;
res.send(`Name: ${empName}<br>Gross Pay:${grossPay.toFixed(2)}<br>SSS: ${s_money.toFixed(2)}<br>Tax: ${tax.toFixed(2)}<br>Philhealth: ${Philhealth.toFixed(2)}<br>Total Deductions:${totalDeduction.toFixed(2)}<br>Net Pay:${netPay.toFixed(2)}`);
});

app.listen(3000, () => {
console.log('Server is running on http://localhost:3000');
});