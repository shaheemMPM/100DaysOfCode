let inputField = document.getElementById("ipTag");
let suggestList = document.getElementById("sugList");
let suggestItems = document.getElementsByClassName("suggest-list-item");
let selectedTags = document.getElementById("selTags");
let outBox = document.getElementById('outBox');

let toggleList = () => {
  if (suggestList.style.display === 'block') {
    suggestList.style.display = 'none';
  }else {
    suggestList.style.display = 'block';
  }
}

let removeTag = (item) => {
  let tempTag = item.parentNode;
  tempTag.parentNode.removeChild(tempTag);
}

let addTag = (item) => {
  let tempTag = `<li class="inlist-item">${item.innerText}<button class="item-close" onclick="removeTag(this)">×</button></li>`;
  selectedTags.innerHTML += tempTag;
  toggleList();
}

let list_items = ['ios', 'ios-mobile', 'ios-app', 'ios-swift', 'android', 'android-studio', 'android-sdk', 'android-app-development', 'test', 'test1', 'test3', 'test2'].sort();

let renderList = (list) => {
  suggestList.innerHTML = '';
  for(let i = 0; i < list.length; i++){
    let tempLi = document.createElement('li');
    tempLi.classList.add("suggest-list-item");
    tempLi.innerText = list[i];
    tempLi.setAttribute("onclick","addTag(this)");
    suggestList.appendChild(tempLi);
  }
}

outBox.addEventListener('click', () => {
  inputField.focus();
});

document.addEventListener('click', (e) => {
  if (suggestList.style.display === 'block') {
    suggestList.style.display = 'none';
  }
});

inputField.addEventListener('click', (e) => {
  e.stopPropagation();
  toggleList();
  renderList(list_items);
});

inputField.addEventListener('keydown', (e) => {
  if (e.keyCode === 13 || e.keyCode === 32) {
    let tempTag = document.createElement('div');
    tempTag.innerText = inputField.value;
    addTag(tempTag);
    inputField.value = "";
  }else if (e.keyCode === 8 || e.keyCode === 46) {
    selectedTags.removeChild(selectedTags.lastElementChild);
  }
})
