// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
document.addEventListener("DOMContentLoaded", function(event) {
  let imageShow = document.querySelector("img");
  if (imageShow) {
    imageShow.addEventListener("click", e => {
      if (e.target.style.width != "50vw") {
        e.target.style.width = "50vw";
      } else {
        e.target.style.width = "35vw";
      }
    });
  }
  let stars = document.getElementsByClassName("glyphicon");
  for (let i = 0; i < stars.length; i++) {
    stars[i].addEventListener("click", e => {
      e.target.classList = "glyphicon glyphicon-star";
    });
  }
});
