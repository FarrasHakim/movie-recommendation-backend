(window.webpackJsonp=window.webpackJsonp||[]).push([[2],{"9BIH":function(){"use strict";"function"==typeof TextDecoder&&new TextDecoder,"function"==typeof TextEncoder&&new TextEncoder;const t=[..."ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/="];(t=>{let e={};t.forEach(((t,n)=>e[t]=n))})(t),String.fromCharCode.bind(String),"function"==typeof Uint8Array.from&&Uint8Array.from.bind(Uint8Array)},IO5D:function(){},NpNP:function(t,e,n){"use strict";(function(t){var i=n("UutA"),o=n("l8WD");n("9BIH");let a,r,l,s,c,d,u,p,h=t=>t;const m=i.a.section(a||(a=h`
  display: flex;
  flex-direction: column;
  padding: 0 0 1rem 1rem;
`)),f=i.a.div(r||(r=h`
  display: flex;
  max-width: 100%;
  overflow-x: auto;

  &::-webkit-scrollbar {
    display: none;
  }
`)),g=i.a.img(l||(l=h`
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  z-index: 0;
  border-radius: inherit;
`)),y=i.a.div(s||(s=h`
  position: absolute;
  left: 0;
  bottom: -100px;
  width: 100%;
  opacity: 0;
  z-index: 1;
  padding: 10px;
  color: #fff;
  background: linear-gradient(0deg, #222, transparent);
  transition: all 0.2s ease;
`)),b=i.a.div(c||(c=h`
  min-width: 200px;
  min-height: 320px;
  position: relative;
  padding: 1rem;
  border-radius: 10px;
  overflow: hidden;
  margin-right: 1rem;
  cursor: pointer;

  &:hover ${0} {
    bottom: 0;
    opacity: 1;
  }
`),y),v=i.a.h4(d||(d=h`
  margin: 0;
`)),w=i.a.p(u||(u=h`
  font-size: 14px;
  margin: 10px 0;
`)),x=i.a.h3(p||(p=h`
  color: #fff;
`));e.a=()=>{const[e,n]=Object(o.h)([{movie:"dummy",poster:"https://media-cache.cinematerial.com/p/500x/rlhwo8t9/dummy-dutch-movie-poster.jpg?v=1456307982",desc:"This is just dummy"}]);Object(o.d)((()=>{i()}),[]);const i=async()=>{const t=await fetch("http://localhost:8000/movies/recommended"),e=await t.json();n(e.list)};return t(m,null,t(x,null,"Recommendation"),t(f,null,e.map((({poster:e,movie:n,desc:i},o)=>t(b,{key:o},t(g,{src:e}),t(y,null,t(v,null,n.split("_").join(" ").toUpperCase()),t(w,null,i&&i.slice(0,60)+"...")))))))}}).call(this,n("hosL").h)},bJge:function(t,e,n){"use strict";n.r(e),function(t){var i=n("UutA"),o=n("zu5w"),a=n("NpNP");n("IO5D"),n("tCvC");let r;const l=i.a.main(r||(r=(t=>t)`
  background-color: #111;
  min-height: 100vh;
`));e.default=()=>t(l,null,t(o.a,null),t(a.a,null))}.call(this,n("hosL").h)},tCvC:function(){},zu5w:function(t,e,n){"use strict";(function(t){var i=n("UutA");let o,a,r,l,s,c,d=t=>t;const u=i.a.section(o||(o=d`
  position: relative;
  padding: 5%;
  z-index: 0;
`)),p=i.a.div(a||(a=d`
  position: absolute;
  width: 100%;
  height: 100%;
  left: 0;
  top: 0;
  z-index: -1;
  background-image: url("https://m.media-amazon.com/images/M/MV5BNTBmZWJkNjctNDhiNC00MGE2LWEwOTctZTk5OGVhMWMyNmVhXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UX182_CR0,0,182,268_AL_.jpg");
  background-repeat: no-repeat;
  background-size: cover;
`)),h=i.a.div(r||(r=d`
  position: absolute;
  width: 100%;
  height: 100%;
  left: 0;
  top: 0;
  z-index: -1;
  background: linear-gradient(45deg, #111, transparent);
`)),m=i.a.div(l||(l=d`
  width: 50%;
`)),f=i.a.h1(s||(s=d`
  color: #fff;
`)),g=i.a.p(c||(c=d`
  color: #aaa;
`));e.a=()=>t(u,null,t(p,null),t(h,null),t(m,null,t(f,null,"Rangkul"),t(g,null,"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.")))}).call(this,n("hosL").h)}}]);
//# sourceMappingURL=route-Home.chunk.c293b.esm.js.map