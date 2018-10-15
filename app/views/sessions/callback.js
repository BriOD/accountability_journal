let inventory = 20  

function removeFromInventory(quantity, callback) { 
  callback(err, msg){

  }

  setTimeout(()=>{callback, 2000})
  //code here 
} 

removeFromInventory(10, function(err, msg) { 
     if(err) { 
       return console.log(err) 
     } 
     console.log(msg) 
   }) //Done...inventory is now 10  

removeFromInventory(25, function(err, msg) { 
    if(err) { 
      return console.log(err) 
  } 
  console.log(msg) 
}) //Cannot remove more items than are in the inventory

  removeFromInventory('25', function(err, msg) { 
  if(err) { 
    return console.log(err) 
  } 
  console.log(msg) 
}) //Quantity must be a number
