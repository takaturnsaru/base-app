function memo() {
  const button = document.getElementById("memo-submit");
  button.addEventListener("click", (e) => {
    const formData = new FormData(document.getElementById("text-form"));
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "/schedules", true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
      const item = XHR.response.schedule;
      const list = document.getElementById("text-list");
      const formText = document.getElementById("memo-text");
      const HTML = `
        <div class="text-data" data-id=${item.id}>
          <div class="text-data-list">
            ${item.text}
          </div>
        </div>`;
      list.insertAdjacentHTML("afterend", HTML);
      formText.value = "";
    };
    e.preventDefault();
  });
}
window.addEventListener("load", memo);