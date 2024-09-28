// document.addEventListener("DOMContentLoaded", (event) => {
//   gsap.registerPlugin(MotionPathPlugin, ScrollTrigger);
//   gsap.config({
//   nullTargetWarn: false
// });

// gsap.set("#plus-icon", {
//   xPercent: 0,
//   yPercent: 0,
//   transformOrigin: "50% 50%",
// });

// gsap.to("#plus-icon", {
//   motionPath: "M0.999756 1L12.7608 358.024C13.923 393.304 39.5284 422.998 74.2533 429.336L507.5 492C529.224 495.965 844.84 537.673 942.247 564.713C962.247 570.265 970.5 587.661 970.5 608.418V807",
//   rotation: 360,
//   ease: "sine.inOut",
//   immediateRender: false,
//   scrollTrigger: {
//     trigger: "#plus-icon",
//     start: "50% center",
//     end: "600% center",
//     autoRotate: false,
//     delay: 4,
//     scrub: 1,
//     markers: false
//   }
// });

// gsap.set("#plus-icon-2", {
//   xPercent: 120,
//   yPercent: 100,
//   transformOrigin: "50% 50%",
// });

// gsap.to("#plus-icon-2", {
//   motionPath: {
//     path: "M1 416L41.0007 145.53C43.3947 129.343 47.7614 113.26 57.1371 99.8498C85.1272 59.8141 130.373 34.4449 180.084 32.1426L861.796 0.570435",
//     align: "self",
//     alignOrigin: [1, 0.5],
//     autoRotate: false,
//     start: 1,
//     end: 0.03
//   },
//   ease: "none",
//   immediateRender: true,
//   rotation: 360,
//   scrollTrigger: {
//     trigger: "#plus-icon-2",
//     start: "100% bottom",
//     end: "bottom top",
//     scrub: 1,
//     markers: false
//   }
// });
// });
