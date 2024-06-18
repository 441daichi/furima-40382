const pay = () => {
  const payjp = Payjp('pk_test_84d496bedca377ebc2a3a6bb')
  const form = document.getElementById('charge-form')
  form.addEventListener("submit", (e) => {
    console.log("フォーム送信時にイベント発火")
    e.preventDefault();
  });
};

window.addEventListener("turbo:load", pay);