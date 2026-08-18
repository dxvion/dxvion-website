// Dxvion interactions
const header = document.querySelector('header');
window.addEventListener('scroll', () => header?.classList.toggle('scrolled', window.scrollY > 50), {passive:true});

const observer = new IntersectionObserver((entries) => {
  entries.forEach((entry) => { if (entry.isIntersecting) entry.target.classList.add('show'); });
}, {threshold:0.15});
document.querySelectorAll('.animate').forEach((el) => observer.observe(el));

// Mobile navigation
const menuToggle = document.querySelector('.menu-toggle');
const nav = document.querySelector('nav');
menuToggle?.addEventListener('click', () => {
  const open = nav?.classList.toggle('open');
  menuToggle.setAttribute('aria-expanded', String(!!open));
  menuToggle.setAttribute('aria-label', open ? 'Close navigation' : 'Open navigation');
  menuToggle.innerHTML = open ? '<i class="fa-solid fa-xmark"></i>' : '<i class="fa-solid fa-bars"></i>';
});
nav?.querySelectorAll('a').forEach((link) => link.addEventListener('click', () => {
  nav.classList.remove('open');
  menuToggle?.setAttribute('aria-expanded','false');
  if (menuToggle) { menuToggle.setAttribute('aria-label','Open navigation'); menuToggle.innerHTML='<i class="fa-solid fa-bars"></i>'; }
}));

// The enquiry form is submitted directly to the configured form endpoint in index.html.
// No visitor data is stored in this client-side script.

document.querySelectorAll('footer a[href="#"]').forEach((link) => link.setAttribute('href','#products'));
