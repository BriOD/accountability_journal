function pullOutMoney(number, callback) {
  setTimeout(function() {
    //check if first argument is an integer
    if (typeof(number) == integer) {
      if (number > 9) {
        return callback(null, "exceeds daily limit")
      } else if (number <= 0) {
        return callback(null, "must be greater then zero")
      } else {
        return callcack(null, "amount is good")
      }
    } else {
      return callback("amount must be an integer")
    }
  }, 2000)
}

pullOutMoney(10, function(err, response) {
  if (err) {
    return console.log(err)
  }
  return console.log(response)
})

// "exceeds daily limit"

pullOutMoney(9, function(err, response) {
  if (err) {
    return console.log(err)
  }
  return console.log(response)
})
// "sufficient funds"


pullOutMoney("10", function(err, response) {
  if (err) {
    return console.log(err)
  }
  return console.log(response)
})
// "amount must be an integer"
