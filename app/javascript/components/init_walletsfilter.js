const initWalletsFilter = () => {
  const walletfilterselect = document.getElementById("walletfilterselect");
  const walletfiltersearch = document.getElementById("walletfiltersearch");
  if (walletfilterselect) {
    walletfilterselect.addEventListener("input", () =>{
      const walletTable = document.getElementById("wallet-table");
      walletTable.innerHTML = "";
      fetch(`/filter_wallets_select/${walletfilterselect.value}`)
        .then(response => response.json())
        .then(data => {
          data.forEach((wallet) =>{
          const walletRow = `<tr>
            <td><img class="rounded-circle mr-2" width="30" height="30" src= ${wallet.img_url}> <a href="wallets/${wallet.id}">${wallet.name}</a> </td>
            <td>$${ wallet.money }</td>
            <td>$${ wallet.invested_money }</td>
            <td>$${ wallet.profit }</td>
            <td>${ wallet.created_at }</td>
          </tr>`
            walletTable.insertAdjacentHTML("beforeend", walletRow)
          })
        });
    })
  }

  if (walletfiltersearch) {
    walletfiltersearch.addEventListener("input", () => {
      const walletTable = document.getElementById("wallet-table");
      walletTable.innerHTML = "";
      fetch(`/filter_wallets_search/${walletfiltersearch.value}`)
        .then(response => response.json())
        .then(data => {
          data.forEach((wallet) => {
            const walletRow = `<tr>
            <td><img class="rounded-circle mr-2" width="30" height="30" src= ${wallet.img_url}> <a href="wallets/${wallet.id}">${wallet.name}</a> </td>
            <td>$${wallet.money}</td>
            <td>$${wallet.invested_money}</td>
            <td>$${wallet.profit}</td>
            <td>${wallet.created_at}</td>
          </tr>`
            walletTable.insertAdjacentHTML("beforeend", walletRow)
          })
        });
    })
  }

};

export {initWalletsFilter};
