(this["webpackJsonp@coreui/coreui-free-react-admin-template"]=this["webpackJsonp@coreui/coreui-free-react-admin-template"]||[]).push([[21],{1807:function(e,n,t){"use strict";t.r(n);var a=t(1),r=t.n(a),c=t(2),s=t(20),o=t(687),i=r.a.lazy((function(){return Promise.all([t.e(0),t.e(10),t.e(14)]).then(t.bind(null,1762))})),l=r.a.lazy((function(){return Promise.all([t.e(11),t.e(33)]).then(t.bind(null,1809))})),d=r.a.lazy((function(){return t.e(27).then(t.bind(null,1794))})),m=r.a.lazy((function(){return t.e(26).then(t.bind(null,1795))})),u=r.a.lazy((function(){return Promise.all([t.e(0),t.e(1),t.e(23)]).then(t.bind(null,1796))})),b=r.a.lazy((function(){return Promise.all([t.e(0),t.e(16)]).then(t.bind(null,1797))})),j=r.a.lazy((function(){return Promise.all([t.e(0),t.e(1),t.e(22)]).then(t.bind(null,1798))})),h=r.a.lazy((function(){return t.e(29).then(t.bind(null,1799))})),p=r.a.lazy((function(){return Promise.all([t.e(0),t.e(19)]).then(t.bind(null,1800))})),x=r.a.lazy((function(){return Promise.all([t.e(0),t.e(17)]).then(t.bind(null,1801))})),f=r.a.lazy((function(){return Promise.all([t.e(0),t.e(1),t.e(24)]).then(t.bind(null,1802))})),O=r.a.lazy((function(){return t.e(30).then(t.bind(null,1803))})),v=r.a.lazy((function(){return Promise.all([t.e(0),t.e(18)]).then(t.bind(null,1804))})),g=r.a.lazy((function(){return Promise.all([t.e(0),t.e(1),t.e(9),t.e(25)]).then(t.bind(null,1814))})),y=r.a.lazy((function(){return t.e(31).then(t.bind(null,1805))})),N=[{path:"/",exact:!0,name:"Home"},{path:"/dashboard",name:"Dashboard",component:i},{path:"/master-wil/",name:"Wilayah Adminsitrasi",component:u,exact:!0},{path:"/master-wil/provinsi",name:"Provinsi",component:u},{path:"/master-wil/kabupaten",name:"Kabupaten",component:b},{path:"/master-wil/kecamatan",name:"Kecamatan",component:j},{path:"/master/",name:"Master",component:h,exact:!0},{path:"/master/pegawai",name:"Pegawai",component:h},{path:"/master/variabel",name:"Variabel",component:p},{path:"/master/bobot",name:"Bobot",component:x},{path:"/master/organisasi",name:"Bobot",component:f},{path:"/master/pegkecamatan",name:"Pegawai Kecamatan",component:O},{path:"/master/jabatan",name:"Jabatan",component:v},{path:"/monev",name:"Monev",component:y,exact:!0},{path:"/monev/ReportMonev",name:"Monev",component:y},{path:"/monev/AddMonev",name:"Add Monev",component:g},{path:"/widgets",name:"Widgets",component:l},{path:"/users",exact:!0,name:"Users",component:d},{path:"/users/:id",exact:!0,name:"User Details",component:m}],w=t(21),S=Object(w.jsx)("div",{className:"pt-3 text-center",children:Object(w.jsx)("div",{className:"sk-spinner sk-spinner-pulse"})}),z=function(){return Object(w.jsx)("main",{className:"c-main",children:Object(w.jsx)(o.m,{fluid:!0,children:Object(w.jsx)(a.Suspense,{fallback:S,children:Object(w.jsxs)(s.d,{children:[N.map((function(e,n){return e.component&&Object(w.jsx)(s.b,{path:e.path,exact:e.exact,name:e.name,render:function(n){return Object(w.jsx)(o.t,{children:Object(w.jsx)(e.component,Object(c.a)({},n))})}},n)})),Object(w.jsx)(s.a,{from:"/",to:"/dashboard"})]})})})})},k=r.a.memo(z),P=function(){return Object(w.jsxs)(o.u,{fixed:!1,children:[Object(w.jsxs)("div",{children:[Object(w.jsx)("a",{href:"https://coreui.io",target:"_blank",rel:"noopener noreferrer",children:"Bnpp"}),Object(w.jsx)("span",{className:"ml-1",children:"\xa9 2021 Monev."})]}),Object(w.jsxs)("div",{className:"mfs-auto",children:[Object(w.jsx)("span",{className:"mr-1",children:"Powered by"}),Object(w.jsx)("a",{href:"https://bnpp",target:"_blank",rel:"noopener noreferrer",children:"Monev Bnpp"})]})]})},A=r.a.memo(P),C=t(167),M=t(688),I=function(){var e=Object(C.c)(),n=Object(C.d)((function(e){return e.sidebarReducer}));return Object(w.jsxs)(o.x,{fixed:!1,withSubheader:!0,children:[Object(w.jsx)(o.ib,{inHeader:!0,className:"ml-md-3 d-lg-none",onClick:function(){var t=!![!1,"responsive"].includes(n.sidebarShow)||"responsive";e({type:"SET",loads:t})}}),Object(w.jsx)(o.ib,{inHeader:!0,className:"ml-3 d-md-down-none",onClick:function(){var t=![!0,"responsive"].includes(n.sidebarShow)&&"responsive";console.log(t),e({type:"SET",loads:t})}}),Object(w.jsx)(o.y,{className:"mx-auto d-lg-none",to:"/",children:Object(w.jsx)(o.C,{src:"/logo-only.png",style:{height:35},className:"c-sidebar-brand-full"})}),Object(w.jsxs)(o.z,{className:"d-md-down-none mr-auto",children:[Object(w.jsx)(o.A,{className:"px-3",children:Object(w.jsx)(o.B,{to:"/dashboard",children:"Dashboard"})}),Object(w.jsx)(o.A,{className:"px-3",children:Object(w.jsx)(o.B,{to:"/users",children:"Users"})}),Object(w.jsx)(o.A,{className:"px-3",children:Object(w.jsx)(o.B,{children:"Settings"})})]}),Object(w.jsx)(o.z,{className:"px-3",children:Object(w.jsx)(U,{})}),Object(w.jsx)(o.eb,{className:"px-3 justify-content-between",children:Object(w.jsx)(o.d,{className:"border-0 c-subheader-nav m-0 px-0 px-md-3",routes:N})})]})},U=function(){var e=Object(s.g)();return Object(w.jsxs)(o.p,{inNav:!0,className:"c-header-nav-items mx-2",direction:"down",children:[Object(w.jsx)(o.s,{className:"c-header-nav-link",caret:!1,children:Object(w.jsx)("div",{className:"c-avatar",children:Object(w.jsx)(o.C,{src:"/avatars/6.jpg",className:"c-avatar-img",alt:""})})}),Object(w.jsxs)(o.r,{className:"pt-0",placement:"bottom-end",children:[Object(w.jsx)(o.q,{header:!0,tag:"div",color:"light",className:"text-center",children:Object(w.jsx)("strong",{children:"Account"})}),Object(w.jsx)(o.q,{header:!0,tag:"div",color:"light",className:"text-center"}),Object(w.jsxs)(o.q,{children:[Object(w.jsx)(M.a,{name:"cil-user",className:"mfe-2"}),"Profile"]}),Object(w.jsxs)(o.q,{children:[Object(w.jsx)(M.a,{name:"cil-settings",className:"mfe-2"}),"Settings"]}),Object(w.jsx)(o.q,{divider:!0}),Object(w.jsxs)(o.q,{onClick:function(){sessionStorage.removeItem("isSuccessLgn"),sessionStorage.removeItem("idUser"),sessionStorage.clear(),e.push("/app")},children:[Object(w.jsx)(M.a,{name:"cil-lock-locked",className:"mfe-2"}),"Logout"]})]})]})},B=t(723),q=t(113),D=t.n(q),E={getMenu:function(){return e="UserApps/GetMenusByIdUser?IdUser=1",new Promise((function(n,t){D.a.get("".concat("http://svcmonev.swg.co.id/api/").concat(e)).then((function(e){n(e.data)}),(function(e){t(e)}))}));var e}},T=function(){var e=Object(C.d)((function(e){return e.sidebarReducer})).sidebarShow,n=Object(C.c)(),t=Object(a.useState)([]),r=Object(B.a)(t,2),c=r[0],s=r[1];return Object(a.useEffect)((function(){!function(){var e=sessionStorage.getItem("idUser");E.getMenu(e).then((function(e){var n=e.data;return s(n)}))}()}),[]),Object(w.jsxs)(o.W,{show:e,onShowChange:function(e){return n({type:"SET",payload:e})},children:[Object(w.jsxs)(o.X,{className:"d-md-down-none",to:"/",children:[Object(w.jsx)(o.C,{src:"/logo.png",style:{height:35},className:"c-sidebar-brand-full"}),Object(w.jsx)(o.C,{src:"/logo-only.png",style:{height:35},className:"c-sidebar-brand-minimized"})]}),Object(w.jsx)(o.Z,{children:Object(w.jsx)(o.n,{items:c,components:{CSidebarNavDivider:o.ab,CSidebarNavDropdown:o.bb,CSidebarNavItem:o.cb,CSidebarNavTitle:o.db}})}),Object(w.jsx)(o.Y,{className:"c-d-md-down-none"})]})},H=r.a.memo(T);n.default=function(){return Object(w.jsxs)("div",{className:"c-app c-default-layout",children:[Object(w.jsx)(H,{}),Object(w.jsxs)("div",{className:"c-wrapper",children:[Object(w.jsx)(I,{}),Object(w.jsx)("div",{className:"c-body",children:Object(w.jsx)(k,{})}),Object(w.jsx)(A,{})]})]})}},723:function(e,n,t){"use strict";function a(e,n){(null==n||n>e.length)&&(n=e.length);for(var t=0,a=new Array(n);t<n;t++)a[t]=e[t];return a}function r(e,n){return function(e){if(Array.isArray(e))return e}(e)||function(e,n){if("undefined"!==typeof Symbol&&Symbol.iterator in Object(e)){var t=[],a=!0,r=!1,c=void 0;try{for(var s,o=e[Symbol.iterator]();!(a=(s=o.next()).done)&&(t.push(s.value),!n||t.length!==n);a=!0);}catch(i){r=!0,c=i}finally{try{a||null==o.return||o.return()}finally{if(r)throw c}}return t}}(e,n)||function(e,n){if(e){if("string"===typeof e)return a(e,n);var t=Object.prototype.toString.call(e).slice(8,-1);return"Object"===t&&e.constructor&&(t=e.constructor.name),"Map"===t||"Set"===t?Array.from(e):"Arguments"===t||/^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)?a(e,n):void 0}}(e,n)||function(){throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")}()}t.d(n,"a",(function(){return r}))}}]);
//# sourceMappingURL=21.e82578b0.chunk.js.map