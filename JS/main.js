console.log('読み込み');

//jsonファイルのパス
const jsonFilePath = './data/input.json';
//portforioデータ追加する要素
let container = document.getElementById('portfolio-container');

//jsonファイルからデータを取得
fetch(jsonFilePath)
  .then((response) => response.json())
  .then((data) => {
    const jsonData = data;
    console.log(jsonData.data[0].title);

    //html作成
    let html = '';
    for (let i = 0; i < jsonData.data.length; i++) {
      html += `<h3>${jsonData.data[i].title}</h3>`;
      container.innerHTML = html;
    }
  });
