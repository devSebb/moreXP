function parseImportmapJson(){return JSON.parse(document.querySelector("script[type=importmap]").text).imports}function registerControllerFromPath(r,t,e){const o=r.replace(new RegExp(`^${t}/`),"").replace("_controller","").replace(/\//g,"--").replace(/_/g,"-");canRegisterController(o,e)&&import(r).then((r=>registerController(o,r,e))).catch((t=>console.error(`Failed to register controller: ${o} (${r})`,t)))}function lazyLoadExistingControllers(r,t,e){queryControllerNamesWithin(e).forEach((e=>loadController(e,r,t)))}function lazyLoadNewControllers(r,t,e){new MutationObserver((e=>{for(const{attributeName:o,target:l,type:n}of e)switch(n){case"attributes":o==controllerAttribute&&l.getAttribute(controllerAttribute)&&extractControllerNamesFrom(l).forEach((e=>loadController(e,r,t)));case"childList":lazyLoadExistingControllers(r,t,l)}})).observe(e,{attributeFilter:[controllerAttribute],subtree:!0,childList:!0})}function queryControllerNamesWithin(r){return Array.from(r.querySelectorAll(`[${controllerAttribute}]`)).map(extractControllerNamesFrom).flat()}function extractControllerNamesFrom(r){return r.getAttribute(controllerAttribute).split(/\s+/).filter((r=>r.length))}function loadController(r,t,e){canRegisterController(r,e)&&import(controllerFilename(r,t)).then((t=>registerController(r,t,e))).catch((t=>console.error(`Failed to autoload controller: ${r}`,t)))}function controllerFilename(r,t){return`${t}/${r.replace(/--/g,"/").replace(/-/g,"_")}_controller`}function registerController(r,t,e){canRegisterController(r,e)&&e.register(r,t.default)}function canRegisterController(r,t){return!t.router.modulesByIdentifier.has(r)}import"@hotwired/stimulus";const controllerAttribute="data-controller";export function eagerLoadControllersFrom(r,t){Object.keys(parseImportmapJson()).filter((t=>t.match(new RegExp(`^${r}/.*_controller$`)))).forEach((e=>registerControllerFromPath(e,r,t)))}export function lazyLoadControllersFrom(r,t,e=document){lazyLoadExistingControllers(r,t,e),lazyLoadNewControllers(r,t,e)}