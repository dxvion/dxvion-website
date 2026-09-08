const header=document.querySelector('.site-header');
window.addEventListener('scroll',()=>header?.classList.toggle('scrolled',window.scrollY>30),{passive:true});
const observer=new IntersectionObserver(entries=>entries.forEach(e=>{if(e.isIntersecting)e.target.classList.add('show')}),{threshold:.12});
document.querySelectorAll('.reveal').forEach(el=>observer.observe(el));
const menuToggle=document.querySelector('.menu-toggle');
const nav=document.querySelector('.site-header nav');
menuToggle?.addEventListener('click',()=>{const open=nav?.classList.toggle('open');menuToggle.setAttribute('aria-expanded',String(!!open));menuToggle.setAttribute('aria-label',open?'Close navigation':'Open navigation');menuToggle.innerHTML=open?'<i class="fa-solid fa-xmark"></i>':'<i class="fa-solid fa-bars"></i>';});
nav?.querySelectorAll('a').forEach(link=>link.addEventListener('click',()=>{nav.classList.remove('open');menuToggle?.setAttribute('aria-expanded','false');if(menuToggle){menuToggle.setAttribute('aria-label','Open navigation');menuToggle.innerHTML='<i class="fa-solid fa-bars"></i>';}}));
