function furima (){
  const articleText  = document.getElementById("item-price");
  articleText.addEventListener("keyup", () => {
    const countVal = articleText.value;
    const charNum  = document.getElementById("add-tax-price");
    const charNum2  = document.getElementById("profit");
    charNum.innerHTML = `${countVal * 0.1} `;
    charNum2.innerHTML = `${countVal - charNum.innerHTML} `;
    
  });
};

window.addEventListener('turbo:load', furima);