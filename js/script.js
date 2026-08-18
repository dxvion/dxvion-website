// Dxvion interactions
const header = document.querySelector("header");

window.addEventListener("scroll", () => {
    if (window.scrollY > 50) header.classList.add("scrolled");
    else header.classList.remove("scrolled");
});

const observer = new IntersectionObserver((entries) => {
    entries.forEach((entry) => {
        if (entry.isIntersecting) entry.target.classList.add("show");
    });
}, { threshold: 0.2 });

document.querySelectorAll(".animate").forEach((el) => observer.observe(el));

// Load the refinement layer without disturbing the original stylesheet.
const refinement = document.createElement("link");
refinement.rel = "stylesheet";
refinement.href = "css/refinement.css";
document.head.appendChild(refinement);

// Keep the public site factual: replace old placeholder/unsupported counters and claims.
const statReplacements = [
    ["20+", "Global"],
    ["20+", "Global"],
    ["150+", "Growing"],
    ["150+", "Portfolio"],
    ["100%", "Quality"],
    ["24/7", "Direct"]
];
const statLabels = ["Market Focus", "Product Portfolio", "Quality Commitment", "Business Support"];
const statBlocks = document.querySelectorAll(".stats > div");
statBlocks.forEach((block, i) => {
    const h2 = block.querySelector("h2");
    const p = block.querySelector("p");
    if (h2) h2.textContent = statReplacements[i]?.[0] || h2.textContent;
    if (p) p.textContent = statLabels[i] || p.textContent;
});

const qualityCard = document.querySelector(".floating-card h3");
const qualityCardText = document.querySelector(".floating-card p");
if (qualityCard) qualityCard.textContent = "QUALITY";
if (qualityCardText) qualityCardText.textContent = "Trusted manufacturing partners";

// Product links in the footer should return to the product section instead of dead '#'.
document.querySelectorAll("footer a[href='#']").forEach((link) => link.href = "#products");
