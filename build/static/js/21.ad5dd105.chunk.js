(this["webpackJsonp@coreui/coreui-free-react-admin-template"]=this["webpackJsonp@coreui/coreui-free-react-admin-template"]||[]).push([[21],{1814:function(t,e,n){"use strict";n.r(e);var r=n(1),a=n(705),i=n(2),c=n(686),o=n(721),l=n.n(o),s=n(688),u=n(691),b=(n(804),n(772),n(166)),f=n(726),d=n(397),j=n.n(d),p=n(22);e.default=function(){var t=Object(b.d)((function(t){return t.dropdownReducer})),e=t.dataComboProv,n=t.dataComboKabupaten,o=Object(b.d)((function(t){return t.kecamatanReducer})),d=o.DataKecamatanFilter,m=o.modalKec,O=o.formKecamatan,h=(O.IdKecamatan,O.IdKabupaten),y=O.Kode,x=O.Nama,v=O.Alamat,g=O.Longitude,k=O.Latitude,P=Object(i.useState)(0),w=Object(a.a)(P,2),K=w[0],C=w[1],A=Object(i.useState)(0),I=Object(a.a)(A,2),N=I[0],_=I[1],F=Object(i.useState)(!1),S=Object(a.a)(F,2),E=S[0],D=S[1],T=Object(b.c)(),L=function(t,e){Object(r.a)({},K);C(e),T(Object(f.fb)("DATA_CMB_KAB",e))},G=function(){return T({type:"MODAL_KEC",payload:!m})},M=function(t,e){"add_kecamatan"===t?(D(!1),G(),T({type:"RESET_FORM_KEC"})):(D(!0),G(),T(Object(f.s)(e)))},z=[{title:"Aksi",field:"internal_action",cellStyle:{backgroundColor:"#039be5",color:"#FFF"},headerStyle:{backgroundColor:"#039be5"},render:function(t){return Object(p.jsxs)("div",{className:"row",children:[Object(p.jsxs)("button",{type:"button",className:"btn btn-sm btn-dark mr-2 ml-4",onClick:function(){return M("edit",t.idKecamatan)},children:[Object(p.jsx)(s.a,{name:"cil-pencil"})," Update"]}),Object(p.jsxs)("button",{type:"button",className:"btn btn-sm btn-danger",onClick:function(){return e=t.idKecamatan,n=t.idKabupaten,r=t.nama,T(Object(f.F)(e,n,r));var e,n,r},children:[Object(p.jsx)(s.a,{name:"cil-drop"})," Hapus"]})]})}},{title:"Kode",field:"kode"},{title:"Nama Kecamatan",field:"nama"},{title:"Alamat",field:"alamat"},{title:"Longitude",field:"longitude"},{title:"Latitude",field:"latitude"}];return Object(i.useEffect)((function(){T(Object(f.eb)("DATA_CMB_PROV"))}),[]),Object(p.jsxs)(c.U,{children:[Object(p.jsx)(c.k,{md:"12",xl:"12",xs:"12",children:Object(p.jsxs)(c.f,{children:[Object(p.jsx)(c.j,{children:Object(p.jsx)(c.k,{md:"3",children:Object(p.jsxs)(c.e,{block:!0,color:"primary",onClick:function(){return M("add_kecamatan")},children:[Object(p.jsx)(u.a,{icon:"plus"}),"Tambah"]})})}),Object(p.jsxs)(c.g,{children:[Object(p.jsx)(c.k,{md:"12",children:Object(p.jsxs)(c.U,{children:[Object(p.jsx)(c.k,{md:"2",className:"pt-2",children:Object(p.jsx)(c.I,{children:" Provinsi"})}),Object(p.jsx)(c.k,{md:"3",className:"mb-2",children:Object(p.jsxs)(c.V,{custom:!0,name:"select_filter_provinsi",id:"filter_provinsi",onChange:function(t){return L(0,t.target.value)},children:[Object(p.jsx)("option",{value:"0",children:" -- Pilih Provinsi --"}),e.map((function(t){return Object(p.jsxs)("option",{value:t.idProvinsi,children:[" ",t.nama]},t.idProvinsi)}))]})}),Object(p.jsx)(c.k,{md:"2",children:Object(p.jsx)(c.I,{children:" Kabupaten "})}),Object(p.jsx)(c.k,{md:"3",children:Object(p.jsxs)(c.V,{custom:!0,name:"filter_kabupaten",id:"filter_kabupaten",onChange:function(t){return e=t.target.value,Object(r.a)({},N),void _(e);var e},children:[Object(p.jsx)("option",{value:"0",children:" Pilih Kabupaten"}),n.length>0?n.map((function(t){return Object(p.jsxs)("option",{value:t.idKabupaten,children:[" ",t.nama]},t.idKabupaten)})):null]})}),Object(p.jsx)(c.k,{md:"2",children:Object(p.jsxs)(c.e,{className:"btn btn-info",onClick:function(){0==N?j.a.fire("Gagal","Kabupaten belum dipilih","error"):T(Object(f.i)("GET_KECAMATANS",N))},children:[Object(p.jsx)(u.a,{icon:"search"})," Filter"]})})]})}),Object(p.jsx)(l.a,{title:"",options:{headerStyle:{backgroundColor:"#01579b",color:"#FFF"},filtering:!0},columns:z,data:d.length>0?d:[]})]})]})}),"// inisialisasi modal",Object(p.jsxs)(c.K,{show:m,onClose:G,size:"lg",children:[Object(p.jsx)(c.N,{closeButton:!0,children:Object(p.jsx)(c.O,{children:"Form Kecamatan"})}),Object(p.jsx)(c.L,{children:Object(p.jsxs)(c.v,{className:"form-horizontal",children:[Object(p.jsxs)(c.w,{children:[Object(p.jsx)(c.I,{htmlFor:"nf-provinsi",children:" Provinsi "}),Object(p.jsxs)(c.V,{onChange:function(t){return L(0,t.target.value)},children:[Object(p.jsx)("option",{value:"0",children:" Pilih Provinsi"}),e.map((function(t){return Object(p.jsxs)("option",{value:t.idProvinsi,children:[" ",t.nama]},t.idProvinsi)}))]})]}),Object(p.jsxs)(c.w,{children:[Object(p.jsx)(c.I,{htmlFor:"nf-kabupaten",children:" Kabupaten"}),Object(p.jsxs)(c.V,{custom:!0,name:"form_select_kabupten",id:"form_select_lkabupaten",value:h,onChange:function(t){return T(Object(f.lb)("IdKabupaten",t.target.value))},children:[Object(p.jsx)("option",{value:"0",children:" Pilih Kabupaten "}),n.length>0?n.map((function(t){return Object(p.jsxs)("option",{value:t.idKabupaten,children:[" ",t.nama]},t.idKabupaten)})):null]})]}),Object(p.jsxs)(c.w,{children:[Object(p.jsx)(c.I,{htmlFor:"nf-kode",children:" Kode"}),Object(p.jsx)(c.D,{type:"text",value:y,onChange:function(t){return T(Object(f.lb)("Kode",t.target.value))}})]}),Object(p.jsxs)(c.w,{children:[Object(p.jsx)(c.I,{htmlFor:"nf-nama",children:" Nama"}),Object(p.jsx)(c.D,{value:x,type:"text",onChange:function(t){return T(Object(f.lb)("Nama",t.target.value))}})]}),Object(p.jsxs)(c.w,{children:[Object(p.jsx)(c.I,{htmlFor:"ng-alamat",children:" Alamat"}),Object(p.jsx)(c.ib,{value:v,onChange:function(t){return T(Object(f.lb)("Alamat",t.target.value))}})]}),Object(p.jsxs)(c.w,{children:[Object(p.jsx)(c.I,{htmlFor:"latitude",children:" Latitude"}),Object(p.jsx)(c.D,{type:"text",value:k,onChange:function(t){return T(Object(f.lb)("Latitude",t.target.value))}})]}),Object(p.jsxs)(c.w,{children:[Object(p.jsx)(c.I,{htmlFor:"longitude",children:" Longitude"}),Object(p.jsx)(c.D,{type:"text",value:g,onChange:function(t){return T(Object(f.lb)("Longitude",t.target.value))}})]})]})}),Object(p.jsxs)(c.M,{children:[Object(p.jsx)(c.e,{color:"primary",onClick:E?function(){return T(Object(f.db)(O))}:function(){return T(Object(f.cb)(O))},children:E?"Update":"Tambah"}),Object(p.jsx)(c.e,{color:"secondary",onClick:G,children:"Cancel"})]})]})]})}},691:function(t,e,n){"use strict";n.d(e,"a",(function(){return y}));var r=n(167),a=n(64),i=n.n(a),c=n(2),o=n.n(c);function l(t){return(l="function"===typeof Symbol&&"symbol"===typeof Symbol.iterator?function(t){return typeof t}:function(t){return t&&"function"===typeof Symbol&&t.constructor===Symbol&&t!==Symbol.prototype?"symbol":typeof t})(t)}function s(t,e,n){return e in t?Object.defineProperty(t,e,{value:n,enumerable:!0,configurable:!0,writable:!0}):t[e]=n,t}function u(t,e){var n=Object.keys(t);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(t);e&&(r=r.filter((function(e){return Object.getOwnPropertyDescriptor(t,e).enumerable}))),n.push.apply(n,r)}return n}function b(t){for(var e=1;e<arguments.length;e++){var n=null!=arguments[e]?arguments[e]:{};e%2?u(Object(n),!0).forEach((function(e){s(t,e,n[e])})):Object.getOwnPropertyDescriptors?Object.defineProperties(t,Object.getOwnPropertyDescriptors(n)):u(Object(n)).forEach((function(e){Object.defineProperty(t,e,Object.getOwnPropertyDescriptor(n,e))}))}return t}function f(t,e){if(null==t)return{};var n,r,a=function(t,e){if(null==t)return{};var n,r,a={},i=Object.keys(t);for(r=0;r<i.length;r++)n=i[r],e.indexOf(n)>=0||(a[n]=t[n]);return a}(t,e);if(Object.getOwnPropertySymbols){var i=Object.getOwnPropertySymbols(t);for(r=0;r<i.length;r++)n=i[r],e.indexOf(n)>=0||Object.prototype.propertyIsEnumerable.call(t,n)&&(a[n]=t[n])}return a}function d(t){return function(t){if(Array.isArray(t)){for(var e=0,n=new Array(t.length);e<t.length;e++)n[e]=t[e];return n}}(t)||function(t){if(Symbol.iterator in Object(t)||"[object Arguments]"===Object.prototype.toString.call(t))return Array.from(t)}(t)||function(){throw new TypeError("Invalid attempt to spread non-iterable instance")}()}function j(t){return e=t,(e-=0)===e?t:(t=t.replace(/[\-_\s]+(.)?/g,(function(t,e){return e?e.toUpperCase():""}))).substr(0,1).toLowerCase()+t.substr(1);var e}function p(t){return t.split(";").map((function(t){return t.trim()})).filter((function(t){return t})).reduce((function(t,e){var n,r=e.indexOf(":"),a=j(e.slice(0,r)),i=e.slice(r+1).trim();return a.startsWith("webkit")?t[(n=a,n.charAt(0).toUpperCase()+n.slice(1))]=i:t[a]=i,t}),{})}var m=!1;try{m=!0}catch(v){}function O(t){return r.c.icon?r.c.icon(t):null===t?null:"object"===l(t)&&t.prefix&&t.iconName?t:Array.isArray(t)&&2===t.length?{prefix:t[0],iconName:t[1]}:"string"===typeof t?{prefix:"fas",iconName:t}:void 0}function h(t,e){return Array.isArray(e)&&e.length>0||!Array.isArray(e)&&e?s({},t,e):{}}function y(t){var e=t.forwardedRef,n=f(t,["forwardedRef"]),a=n.icon,i=n.mask,c=n.symbol,o=n.className,l=n.title,u=n.titleId,j=O(a),p=h("classes",[].concat(d(function(t){var e,n=t.spin,r=t.pulse,a=t.fixedWidth,i=t.inverse,c=t.border,o=t.listItem,l=t.flip,u=t.size,b=t.rotation,f=t.pull,d=(s(e={"fa-spin":n,"fa-pulse":r,"fa-fw":a,"fa-inverse":i,"fa-border":c,"fa-li":o,"fa-flip-horizontal":"horizontal"===l||"both"===l,"fa-flip-vertical":"vertical"===l||"both"===l},"fa-".concat(u),"undefined"!==typeof u&&null!==u),s(e,"fa-rotate-".concat(b),"undefined"!==typeof b&&null!==b&&0!==b),s(e,"fa-pull-".concat(f),"undefined"!==typeof f&&null!==f),s(e,"fa-swap-opacity",t.swapOpacity),e);return Object.keys(d).map((function(t){return d[t]?t:null})).filter((function(t){return t}))}(n)),d(o.split(" ")))),v=h("transform","string"===typeof n.transform?r.c.transform(n.transform):n.transform),g=h("mask",O(i)),k=Object(r.a)(j,b({},p,{},v,{},g,{symbol:c,title:l,titleId:u}));if(!k)return function(){var t;!m&&console&&"function"===typeof console.error&&(t=console).error.apply(t,arguments)}("Could not find icon",j),null;var P=k.abstract,w={ref:e};return Object.keys(n).forEach((function(t){y.defaultProps.hasOwnProperty(t)||(w[t]=n[t])})),x(P[0],w)}y.displayName="FontAwesomeIcon",y.propTypes={border:i.a.bool,className:i.a.string,mask:i.a.oneOfType([i.a.object,i.a.array,i.a.string]),fixedWidth:i.a.bool,inverse:i.a.bool,flip:i.a.oneOf(["horizontal","vertical","both"]),icon:i.a.oneOfType([i.a.object,i.a.array,i.a.string]),listItem:i.a.bool,pull:i.a.oneOf(["right","left"]),pulse:i.a.bool,rotation:i.a.oneOf([0,90,180,270]),size:i.a.oneOf(["lg","xs","sm","1x","2x","3x","4x","5x","6x","7x","8x","9x","10x"]),spin:i.a.bool,symbol:i.a.oneOfType([i.a.bool,i.a.string]),title:i.a.string,transform:i.a.oneOfType([i.a.string,i.a.object]),swapOpacity:i.a.bool},y.defaultProps={border:!1,className:"",mask:null,fixedWidth:!1,inverse:!1,flip:null,icon:null,listItem:!1,pull:null,pulse:!1,rotation:null,size:null,spin:!1,symbol:!1,title:"",transform:null,swapOpacity:!1};var x=function t(e,n){var r=arguments.length>2&&void 0!==arguments[2]?arguments[2]:{};if("string"===typeof n)return n;var a=(n.children||[]).map((function(n){return t(e,n)})),i=Object.keys(n.attributes||{}).reduce((function(t,e){var r=n.attributes[e];switch(e){case"class":t.attrs.className=r,delete n.attributes.class;break;case"style":t.attrs.style=p(r);break;default:0===e.indexOf("aria-")||0===e.indexOf("data-")?t.attrs[e.toLowerCase()]=r:t.attrs[j(e)]=r}return t}),{attrs:{}}),c=r.style,o=void 0===c?{}:c,l=f(r,["style"]);return i.attrs.style=b({},i.attrs.style,{},o),e.apply(void 0,[n.tag,b({},i.attrs,{},l)].concat(d(a)))}.bind(null,o.a.createElement)},804:function(t,e,n){"use strict";var r=n(113),a=n.n(r),i="http://svcmonev.swg.co.id/api/",c=i+"MasterWilOrgs/",o=function(t,e){var n="";return n=void 0===e?"":e,new Promise((function(e,r){a.a.get("".concat(i).concat(t).concat(n)).then((function(t){e(t.data)}),(function(t){r(t)}))}))},l=function(t,e){return console.log(e),new Promise((function(n,r){a.a.post("".concat(c).concat(t,"?").concat(e)).then((function(t){n(t.data)}),(function(t){r(t)}))}))},s={GetProvinsis:function(){return o("MasterWilOrgs/GetProvinsis")},GetProvinsi:function(t){return o("MasterWilOrgs/GetProvinsi",t)},AddProvinsi:function(t){return l("AddProvinsi",t)},EditProvinsiWeb:function(t){return function(t,e){return new Promise((function(n,r){a.a.post("".concat(c).concat(t),e).then((function(t){n(t.data)}),(function(t){r(t)}))}))}("EditProvinsi",t)},HapusProvinsi:function(t){return l("DeleteProvinsi",t)},GetKabupatenByIdProv:function(t){return o("GetKabupatens",t)},GetKecamatanByIdKab:function(t){return o("GetKecamatans",t)}};e.a=s}}]);
//# sourceMappingURL=21.ad5dd105.chunk.js.map