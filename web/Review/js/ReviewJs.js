const btns = Array.from(document.querySelectorAll("nav button"));
const bgSlider = document.getElementById("bgSlider");
const main = document.querySelector("main");

const pages = {
  0: 'ReviewCategory.jsp',
  1: 'ReviewCategory.jsp',
  2: 'ReviewCategory.jsp',
  3: 'ReviewCategory.jsp'
};

const btnPositions = [];

for (let btn of btns) {
  let idx = btns.indexOf(btn);
  btnPositions.push(btn.offsetLeft);
  btn.addEventListener("click", () => {
    btns.forEach(b => b.classList.remove("active"));
    btn.classList.add("active");
    bgSlider.style.transform = `translateX(${btnPositions[idx]}px)`;
    loadPage(pages[idx]);
  });
}

window.addEventListener("resize", () => {
  btnPositions.length = 0; // Clear the array without creating a new one
  for (let b of btns) {
    btnPositions.push(b.offsetLeft);
  }
  let active = document.querySelector('button.active');
  bgSlider.style.transform = `translateX(${btnPositions[btns.indexOf(active)]}px)`;
});

// Function to load and display HTML content from a URL
function loadPage(url) {
  fetch(url)
    .then(response => response.text())
    .then(data => {
      main.innerHTML = data;
    })
    .catch(error => console.error('Error fetching the HTML:', error));
}

window.onload = () => {
    loadPage(pages[0]);
  };
