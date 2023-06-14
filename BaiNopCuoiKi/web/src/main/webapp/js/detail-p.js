var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
    showDivs(slideIndex += n);
};
function currentDiv(n) {
    showDivs(slideIndex = n);
};

function showDivs(n) {
    var i;
    var x = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("image-badge");
    if (n > x.length) {slideIndex = 1}
    if (n < 1) {slideIndex = x.length}
    for (i = 0; i < x.length; i++) {
        x[i].style.display = "none";
    }
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" badge-white", "");
    }
    x[slideIndex-1].style.display = "block";
    dots[slideIndex-1].className += " badge-white";
};
<!-- Au no -->
<!-- Au no --><!-- Au no -->

function chooseFile(){
    const file = document.querySelector('input[type=file]').files[0];
    const reader = new FileReader();

    reader.addEventListener("load", function () {
        // convert image file to base64 string
        const image = reader.result;
        // get the first image element by its ID
        const img_pre = document.getElementById("image_pre");
        // set the source of the first image element to the loaded image
        img_pre.src = image;
    }, false);

    if (file) {
        reader.readAsDataURL(file);
        document.getElementById("image_pre").style.display = "inline";
    }
};

function checkImg() {
    const image = document.getElementById("image_comment");
if (image.complete) {
    document.getElementById("image_comment").style.display = "inline";
} else {
    document.getElementById("image_comment").style.display = "none";
}
};

