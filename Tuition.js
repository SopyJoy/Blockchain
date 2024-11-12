const express = require('express');
const bodyParser = require('body-parser');

const app = express();

app.use(bodyParser.urlencoded({ extended: true}));

app.get('/', (req, res) => {
    res.send('<form action = "/tuitionfee" method="post">Number of Units:<input type="number" name="numUnit"><br>Input rate per Unit:<input type="number" name="rateUnit"><br>Input Laboratory fee:<input type="number" name="labFee"><br><button type="submit"Calculate</button></form>');
});

app.post('/tuitionfee', (req, res) => {
const numUnit = parseFloat(req.body.numUnit);
const rateUnit = parseFloat(req.body.rateUnit);
const labFee = parseFloat(req.body.labFee);
const enrollmentFee = numUnit*rateUnit;
const miscFee = (enrollmentFee*10)/100;
const tuitionFee = enrollmentFee+labFee+miscFee;
res.send(`Computation:<br>Enrollment Fee:${enrollmentFee}<br>Miscellaneous Fee:${miscFee}<br>Tuition Fee:${tuitionFee}`);
});

app.listen(3000, () => {
console.log('Server is running on http://localhost:3000');
});