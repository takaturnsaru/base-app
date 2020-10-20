function click() {
  const submit = document.getElementById("submit");
  submit.addEventListener("click", (e) => {
    const formData = new FormData(document.getElementById("form"));
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "/work_times", true);
    XHR.responseType = "json";
    XHR.send(formData.strftime("%Y年,%m月%d日,%H時%M分"));
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
      const item = XHR.response.work_time;
      const list = document.getElementById("list");
      const HTML = `
      <div class="work-time" data-id=${item.id}>
        <div class="work-time-date">
          ${item.attendance}
        </div>
      </div>`;
    list.insertAdjacentHTML("afterend", HTML);
    };
    e.preventDefault();
  });
}
window.addEventListener("load", click);