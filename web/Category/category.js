/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


let preveiwContainer = document.querySelector('.books-preview');
let previewBox = preveiwContainer.querySelectorAll('.preview');

document.querySelectorAll('.books-container .book').forEach(book =>{
  book.onclick = () =>{
    preveiwContainer.style.display = 'flex';
    let name = book.getAttribute('data-name');
    previewBox.forEach(preview =>{
      let target = preview.getAttribute('data-target');
      if(name == target){
        preview.classList.add('active');
      }
    });
  };
});

previewBox.forEach(close =>{
  close.querySelector('.fa-times').onclick = () =>{
    close.classList.remove('active');
    preveiwContainer.style.display = 'none';
  };
});