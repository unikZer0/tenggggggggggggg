let sct = document.querySelector(".selector");
let lists = document.querySelector(".lists");
let icon  = document.querySelector(".icon");
sct.addEventListener("click",()=>{
    icon.classList.toggle("rotate")
    lists.classList.toggle("show")
    
})
document.addEventListener("click", (event) => {
    // Check if the clicked element is not within the selector or lists
    if (!sct.contains(event.target) && !lists.contains(event.target)) {
        icon.classList.remove("rotate");
        lists.classList.remove("show");
    }
});
// let list = document.querySelectorAll(".list")
// list.forEach((e,index)=>{
//     let inp = document.querySelector("input")
//     e.addEventListener("click",()=>{
//         inp.value = e.innerHTML
//         console.log(inp.value)
//     })
// })