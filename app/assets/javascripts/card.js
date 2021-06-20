const pay = () => {
  console.log("OK");
  Payjp.setPublicKey(document.querySelector('meta[name="payjp_public_key"]').content);

  const form = document.getElementById("card-form");
  if (form == null) {
    return;
  }
  form.addEventListener("submit", function(e) {
    e.preventDefault();

    const formResult = document.getElementById("card-form");
    const formData = new FormData(formResult);
    const card = {
      number: formData.get("number"),
      cvc: formData.get("cvc"),
      exp_month: formData.get("exp_month"),
      exp_year: `20${formData.get("exp_year")}`,
    };
    console.log(card);

    Payjp.createToken(card, function(status, response) {
      console.log(status);

      if (status === 200) {
        const token = response.id;
        const tokenObj = `<input value=${token} name='token_id' type="hidden">`; 
        const cardForm = document.getElementById("card-form");
        cardForm.insertAdjacentHTML("beforeend", tokenObj);
        document.getElementById("number").removeAttribute("name");
        document.getElementById("cvc").removeAttribute("name");
        document.getElementById("exp_month").removeAttribute("name");
        document.getElementById("exp_year").removeAttribute("name");
        document.getElementById("card-form").submit();
      } else {
        alert("カード情報が正しくありません")
      } 
    });
  });
};
window.addEventListener("load", pay);