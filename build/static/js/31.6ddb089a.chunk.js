(this["webpackJsonp@coreui/coreui-free-react-admin-template"]=this["webpackJsonp@coreui/coreui-free-react-admin-template"]||[]).push([[31],{1805:function(e,t,c){"use strict";c.r(t);var s=c(723),r=c(1),n=c(20),a=c(687),i=c(21),u=function(e){switch(e){case"Active":return"success";case"Inactive":return"secondary";case"Pending":return"warning";case"Banned":return"danger";default:return"primary"}};t.default=function(){var e=Object(n.g)(),t=Object(n.h)().search.match(/page=([0-9]+)/,""),c=Number(t&&t[1]?t[1]:1),o=Object(r.useState)(c),l=Object(s.a)(o,2),j=l[0],d=l[1];return Object(r.useEffect)((function(){c!==j&&d(c)}),[c,j]),Object(i.jsx)(a.U,{children:Object(i.jsx)(a.k,{xl:6,children:Object(i.jsxs)(a.f,{children:[Object(i.jsxs)(a.j,{children:["Users",Object(i.jsx)("small",{className:"text-muted",children:" example"})]}),Object(i.jsxs)(a.g,{children:[Object(i.jsx)(a.o,{items:null,fields:[{key:"name",_classes:"font-weight-bold"},"registered","role","status"],hover:!0,striped:!0,itemsPerPage:5,activePage:j,clickableRows:!0,onRowClick:function(t){return e.push("/users/".concat(t.id))},scopedSlots:{status:function(e){return Object(i.jsx)("td",{children:Object(i.jsx)(a.a,{color:u(e.status),children:e.status})})}}}),Object(i.jsx)(a.S,{activePage:j,onActivePageChange:function(t){c!==t&&e.push("/users?page=".concat(t))},pages:5,doubleArrows:!1,align:"center"})]})]})})})}}}]);
//# sourceMappingURL=31.6ddb089a.chunk.js.map