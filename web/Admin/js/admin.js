/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/javascript.js to edit this template
 */

var navLinks = document.getElementsByClassName("nav-link");
const col10 = document.getElementById("col10");

function setActiveLink(event) {
    // Remove 'active' class from all links
    for (var i = 0; i < navLinks.length; i++) {
        navLinks[i].classList.remove("active");
    }

    // Add 'active' class to the clicked link
    event.target.classList.add("active");
}

// Attach click event listener to each link
for (var i = 0; i < navLinks.length; i++) {
    navLinks[i].addEventListener("click", setActiveLink);
}
navLinks[0].classList.add("active");



function bigtosmal() {

    var div = document.getElementById("col2");
    div.style.display = "none";

    var div = document.getElementById("col1");
    div.style.display = "block";


    var col2element = document.getElementById("col10");

    var newClassNamecol2 = "col-11 content p-0 m-0 container col11edit";
    col2element.className = newClassNamecol2;

    var div1 = document.getElementById("smalltobig");
    div1.style.display = "block";


}

function smalltobig() {

    var div = document.getElementById("col2");
    div.style.display = "block";

    var div = document.getElementById("col1");
    div.style.display = "none";

    var col2element = document.getElementById("col10");
    var newClassNamecol2 = "col-10 container p-0 m-0 content col10edit";
    col2element.className = newClassNamecol2;


}

function handleWindowWidth() {
    var windowWidth = window.innerWidth;

    // Code to execute based on the window width
    if (windowWidth < 1456) {


        var div = document.getElementById("col2");
        div.style.display = "none";

        var div = document.getElementById("col1");
        div.style.display = "block";


        var col2element = document.getElementById("col10");
        var newClassNamecol2 = "col-11 container p-0 m-0 content col11edit";
        col2element.className = newClassNamecol2;

        var div1 = document.getElementById("smalltobig");
        div1.style.display = "none";



    } else {
        var div = document.getElementById("col2");
        div.style.display = "block";

        var div = document.getElementById("col1");
        div.style.display = "none";

        var col2element = document.getElementById("col10");
        var newClassNamecol2 = "col-10 container p-0 m-0 content col10edit";
        col2element.className = newClassNamecol2;




    }
}

// Function to run continuously while monitoring the width changes
function runFunctionOnResize() {
    handleWindowWidth();

    // Add any additional code or function calls here
}

// Call the function initially
runFunctionOnResize();

// Attach the function to the window resize event
window.addEventListener('resize', runFunctionOnResize);


const pages = {
    0: 'User.html',
    1: 'Book.html'
};



function user() {
    loadPage(pages[0]);

}

function Book() {
    loadPage(pages[1]);
}


function loadPage(url) {
    fetch(url)
            .then(response => response.text())
            .then(data => {
                col10.innerHTML = data;
            })
            .catch(error => console.error('Error fetching the HTML:', error));
}


window.onload = () => {
    loadPage(pages[0]);
};


function closeModals() {

 $('#EditBook').modal('hide');
}

function swalsave() {

    Swal.fire({
        title: 'Do you want to save the changes?',
        showDenyButton: true,
        showCancelButton: true,
        confirmButtonText: 'Save',
        denyButtonText: `Don't save`,
    }).then((result) => {
        /* Read more about isConfirmed, isDenied below */
        if (result.isConfirmed) {
            closeModals();
            Swal.fire('Saved!', '', 'success')
        } else if (result.isDenied) {
            closeModals();
            Swal.fire('Changes are not saved', '', 'info')
        }
    })
}


function swalDelete() {

    Swal.fire({
        title: 'Do you want to Delete?',
        showDenyButton: true,
        showCancelButton: true,
        confirmButtonText: 'Yes',
        denyButtonText: `No`,
    }).then((result) => {
        /* Read more about isConfirmed, isDenied below */
        if (result.isConfirmed) {
            closeModals();
            Swal.fire('Deleted!', '', 'success')
        } else if (result.isDenied) {
            closeModals();
            Swal.fire('Not Deleted', '', 'info')
        }
    })
}


