function count (){
  const itemText = document.getElementById("item-price");
    itemText.addEventListener("keyup",() => {
      const countValue = itemText.value;
      const taxPrice = document.getElementById("add-tax-price");
      taxPrice.innerHTML =  Math.round(countValue * 0.1) ;
      const profitOutput = document.getElementById("profit");
      profitOutput.innerHTML = Math.round(countValue - countValue * 0.1) ;
    });
}
window.addEventListener('load', count);