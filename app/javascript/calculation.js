window.addEventListener( 'keydown', function() {
  const itemPrice = document.getElementById("item-price")

  itemPrice.addEventListener('input' ,function() {
    const priceValue = itemPrice.value
    const Tax        = Math.round(priceValue * 0.1);
    const Profit     = priceValue - Tax

  document.getElementById("add-tax-price").innerHTML = Tax
  document.getElementById("profit")       .innerHTML = Profit
  })
})