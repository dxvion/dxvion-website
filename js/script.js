// Dxvion homepage interactions
const header = document.querySelector('.site-header, header');
const nav = header?.querySelector('nav');
const menuToggle = header?.querySelector('.menu-toggle');

const updateHeader = () => header?.classList.toggle('scrolled', window.scrollY > 30);
updateHeader();
window.addEventListener('scroll', updateHeader, { passive: true });

// Reveal sections progressively. Content remains visible when JavaScript is unavailable.
const animated = document.querySelectorAll('.animate');
if ('IntersectionObserver' in window) {
  const revealObserver = new IntersectionObserver((entries) => {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        entry.target.classList.add('show');
        revealObserver.unobserve(entry.target);
      }
    });
  }, { threshold: 0.08, rootMargin: '0px 0px -40px 0px' });
  animated.forEach((el) => revealObserver.observe(el));
} else {
  animated.forEach((el) => el.classList.add('show'));
}

// Mobile navigation.
const closeMenu = ({ returnFocus = false } = {}) => {
  if (!nav?.classList.contains('open')) return;
  nav.classList.remove('open');
  document.body.classList.remove('nav-open');
  menuToggle?.setAttribute('aria-expanded', 'false');
  if (menuToggle) {
    menuToggle.setAttribute('aria-label', 'Open navigation');
    menuToggle.innerHTML = '<i class="fa-solid fa-bars"></i>';
    if (returnFocus) menuToggle.focus();
  }
};

menuToggle?.addEventListener('click', () => {
  const open = nav?.classList.toggle('open');
  document.body.classList.toggle('nav-open', !!open);
  menuToggle.setAttribute('aria-expanded', String(!!open));
  menuToggle.setAttribute('aria-label', open ? 'Close navigation' : 'Open navigation');
  menuToggle.innerHTML = open ? '<i class="fa-solid fa-xmark"></i>' : '<i class="fa-solid fa-bars"></i>';
});

nav?.querySelectorAll('a').forEach((link) => link.addEventListener('click', () => closeMenu()));

document.addEventListener('keydown', (event) => {
  if (event.key === 'Escape') closeMenu({ returnFocus: true });
});

document.addEventListener('click', (event) => {
  if (nav?.classList.contains('open') && header && !header.contains(event.target)) closeMenu();
});

window.addEventListener('resize', () => {
  if (window.innerWidth > 920) closeMenu();
}, { passive: true });

// Highlight the section currently being viewed on the one-page homepage.
const navLinks = [...(nav?.querySelectorAll('a[href^="#"]') || [])];
const sections = navLinks
  .map((link) => document.querySelector(link.getAttribute('href')))
  .filter(Boolean);

if ('IntersectionObserver' in window && sections.length) {
  const sectionObserver = new IntersectionObserver((entries) => {
    const visible = entries
      .filter((entry) => entry.isIntersecting)
      .sort((a, b) => b.intersectionRatio - a.intersectionRatio)[0];
    if (!visible) return;
    navLinks.forEach((link) => {
      const isActive = link.getAttribute('href') === `#${visible.target.id}`;
      link.classList.toggle('active', isActive);
      if (isActive) link.setAttribute('aria-current', 'location');
      else link.removeAttribute('aria-current');
    });
  }, { threshold: [0.18, 0.35, 0.55], rootMargin: '-80px 0px -45% 0px' });
  sections.forEach((section) => sectionObserver.observe(section));
}

// The enquiry form submits directly to the configured endpoint in index.html.
// No visitor data is stored in this client-side script.
