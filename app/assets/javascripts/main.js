var displayMaterializeSelect = function(options) {
    var elems = document.querySelectorAll('select');
    var instances = M.FormSelect.init(elems, options);
}

function myFunction() {
    var x = document.getElementById("interest-btn");
    if (x.style.display === "none") {
        x.style.display = "block";
    } else {
        x.style.display = "none";
    }
}

document.addEventListener("turbolinks:load", function(options){
    displayMaterializeSelect(options);
});