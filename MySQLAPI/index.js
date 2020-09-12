
const express = require('express')
const cors = require('cors')
const mysql=require('mysql')
const app = express()
const port = 4000 


app.use(cors());

const selectAllExchangeQuery="Select * from cbot2.xb_masterexch";

// const connection =mysql.createConnection({

     
// });

const connection = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : '',
    database    : 'cbot2'
});

connection.connect(function(err) {
    if (err) {
        console.error('error connecting: ' + err.stack);
        return;
    }
    else{
        console.log("CONNECTED SUCCESSFULLY1");
    }
});

//console.log(connection);

app.get('/', (req, res) => {
  res.send('go to /exchanges to see exchanges')
  
})


app.get('/exchanges', (req, res) => {
   // res.send('You are on Exchanges page');
    connection.query(selectAllExchangeQuery,(err,results)=>{

        // if(results.length > 0){
        //     console.log(results);
        // }
        // else{
        //     console.log("No query result");

        // }
        if(err)
        {
            console.log(err);
            return res.send(err);
        } 
        else
        {
            console.log(results);
            return res.json({
                data:results 
            })
            //return res.send(results);
        }
    });
  });
  console.log("end");
 app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
 })