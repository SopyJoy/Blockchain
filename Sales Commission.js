const express = require('express');
const bodyParser = require('body-parser');

const app = express();

app.use(bodyParser.urlencoded({ extended: true}));

app.get('/', (req, res) => {
    res.send('<form action = "/Salescommissionapp" method="post">Salesman Name:<input type="text" name="salesName"><br>First Quarter:<input type="number" name="firstQ"><br>Second Quarter:<input type="number" name="secQ"><br>Third Quarter:<input type="number" name="thirdQ"><br>Fourth Quarter:<input type="number" name="fourQ"><br><button type="submit"Calculate</button></form>');
});

app.post('/Salescommissionapp', (req, res) => {
const firstQ = parseFloat(req.body.firstQ);
const secQ = parseFloat(req.body.secQ);
const thirdQ = parseFloat(req.body.thirdQ);
const fourQ = parseFloat(req.body.fourQ);
const salesName = req.body.salesName;
const annualSales = firstQ+secQ+thirdQ+fourQ;
const commission = annualSales*0.08;
const tax = commission*0.032;
const payOut = commission - tax;
res.send(`Commission For: ${salesName}<br>Annual Sales:${annualSales.toFixed(2)}<br>Commission:${commission.toFixed(2)}<br>Tax:${tax.toFixed(2)}<br>Payout:${payOut.toFixed(2)}`);
});

app.listen(3000, () => {
console.log('Server is running on http://localhost:3000');
});