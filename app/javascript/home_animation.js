document.addEventListener("DOMContentLoaded", (event) => {
  gsap.registerPlugin(TextPlugin);
  const title = document.getElementById("main-title")
  const step3text = document.getElementById("step-3-text");

  // Title animation
  gsap.to(title, {
    delay: 1,
    duration: 2.5,
    text: "It’s time to gain XP",
    ease: "slow",
    onComplete: () => {
      gsap.to(title, {
        delay: 2.5,
        duration: 2.5,
        text: "It’s time to level up",
        ease: "slow",
      });
    },
  });
// Subtitle animation
  let tl = gsap.timeline({
    scrollTrigger: {
      trigger: "#subtitle-text",
      start: "-1080% center",
      end: "0 center",
      scrub: true,
      markers: true,
      toggleActions: "play reverse play reverse"
    }
  });

  tl.from("#subtitle-text", {
    y: 100,
    x: 800,
    scale: 0.5,
    duration: 3,
    ease: "power1.inOut"
  });


  // Step 1
  ScrollTrigger.create({
    start: "100% center",
    end: "bottom center",
    markers: false,
    onEnter:() => {
      gsap.registerPlugin(TextPlugin)
      gsap.to("#step-1-text", {
        duration: 4,
        text: "Browse through hundreds of professional experiences",
        ease: "power1.inOut",
        markers: false,
      })
    }
  })
  // Step 2
  ScrollTrigger.create({
    start: "100% center",
    end: "bottom center",
    markers: false,
    onEnter:() => {
      gsap.registerPlugin(TextPlugin)
      gsap.to("#step-2-text", {
        delay: 3,
        duration: 4,
        text: "Evolve Your Career with Hands-On Experience",
        ease: "power1.inOut",
        markers: false,
        scrub: true,
        toggleActions: "play reverse play reverse"
      })
    }
  })
  // Step 3
  ScrollTrigger.create({
    trigger: "#step-3",
    start: "-80% center",
    end: "120% center",
    scrub: true,
    markers: false,
    onEnter: () => {
      gsap.registerPlugin(TextPlugin)
      gsap.to("#step-3", {
        scale: 3,
        duration: 1,
        markers: false
      });
      gsap.to("#step-3-text", {
        text: "Level yourself up <br> and <br> Break into the industry",
        ease: "power1.inOut",
        scale: 0.5,
        opacity: 1,
        duration: 3,
        delay: 1
      });
    },
    onLeave: () => {
      gsap.to("#step-3-text", {
        scale: 0.5,
        opacity: 0,
        duration: 1
      });
    },
    onEnterBack: () => {
      gsap.to("#step-3-text", {
        scale: 0.5,
        opacity: 1,
        duration: 1
      });
    },
    onLeaveBack: () => {
      gsap.to("#step-3-text", {
        scale: 0.5,
        opacity: 0,
        duration: 1
      });
    }
  });
});

// Smooth Scroll
const lenis = new Lenis()

lenis.on('scroll', (e) => {
  console.log(e)
})

function raf(time) {
  lenis.raf(time)
  requestAnimationFrame(raf)
}

requestAnimationFrame(raf)
