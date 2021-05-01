window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const taxPrice = Math.floor(inputValue * 0.1);
    addTaxDom.innerHTML = taxPrice;
    const addProfit = document.getElementById("profit");
    addProfit.innerHTML = Math.floor(inputValue - taxPrice);
  })

});