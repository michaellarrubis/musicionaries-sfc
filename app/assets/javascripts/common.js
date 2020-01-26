screenSize = window.innerWidth;

document.addEventListener("turbolinks:load", function() {
  // SideNavbar
  if (screenSize <= 768) {
    slideOut = document.querySelector('#slide-out');
    slideOutInstance = new M.Sidenav(slideOut, {});
  }

  // Dropdown
  dropdownTrigger = document.querySelectorAll('.dropdown-trigger');
  dropdownTriggerInstance = M.Dropdown.init(dropdownTrigger, {});


  // Generates Random Colors
  tagItems = document.querySelectorAll('.js-color');
  colorArray = ["#ef5350", "#ec407a", "#ab47bc", "#5c6bc0", "#42a5f5", "#26a69a", "#ffa726", "#ff7043", "#8d6e63"]

  for( let i = 0; i < tagItems.length; i++ ) {
    tagItems[i].style.backgroundColor = colorArray[Math.floor(Math.random() * colorArray.length)];
    tagItems[i].style.opacity = 0.5;
  }
});

document.addEventListener('turbolinks:before-visit', function() {
  if (screenSize <= 768) {
    slideOut = document.querySelector('#slide-out');
    slideOutInstance = M.Sidenav.getInstance(slideOut);
    if (slideOutInstance){
      slideOutInstance.destroy();
    }
  }
});