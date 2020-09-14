const pay = () => {
  // PAY.JPテスト公開鍵をセット
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  // charge-form内のsubmitが実行されるとイベントが発火
  // e.preventDefault(); でRailsのフォーム送信処理をキャンセル.JavaScriptでサーバーサイドに値を送る
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    const formResult = document.getElementById("charge-form");
    const formData   = new FormData(formResult);

    // 入力されたカードの情報を変数に代入
    const card = {
      number:        formData.get("order_address[number]"),
      cvc:           formData.get("corder_address[cvc]"),
      exp_month:     formData.get("order_address[exp_month]"),
      exp_year: `20${formData.get("order_address[exp_year]")}`,
    };

    // PAY.JPにアクセスして、トークンを作成
    // 正常だった場合、トークンを変数に代入
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token     = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj  = `<input value=${token} type="hidden" name='order_address[token]'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      // 入力された各カード情報の値を削除
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      
      // フォームに記載されている情報を、サーバーサイドへ送信
      document.getElementById("charge-form").submit();
      document.getElementById("charge-form").reset();
    });
  });
 };
//  ページがロードされるとpayという関数が呼び出される
 window.addEventListener("load", pay);