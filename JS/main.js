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
      //divタグの作成
      let createGroup = document.createElement('div');
      //id付与
      createGroup.id = jsonData.data[i].idName;
      html += `<h3><a href = "${jsonData.data[i].url}" >${jsonData.data[i].title}</a></h3>
              <p>${jsonData.data[i].summary}</p>
              `;
      //portfolioを画面に表示
      createGroup.innerHTML = html;
      container.appendChild(createGroup);
      //タグ作成の初期化
      html = '';
    }
  });
