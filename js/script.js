const header=document.querySelector('.site-header');
const nav=header?.querySelector('nav');
const toggle=document.querySelector('.menu-toggle');
window.addEventListener('scroll',()=>header?.classList.toggle('scrolled',scrollY>20),{passive:true});
toggle?.addEventListener('click',()=>{const open=nav?.classList.toggle('open');toggle.setAttribute('aria-expanded',String(!!open));toggle.innerHTML=open?'<i class="fa-solid fa-xmark"></i>':'<i class="fa-solid fa-bars"></i>'});
nav?.querySelectorAll('a').forEach(a=>a.addEventListener('click',()=>{nav.classList.remove('open');toggle?.setAttribute('aria-expanded','false');if(toggle)toggle.innerHTML='<i class="fa-solid fa-bars"></i>'}));