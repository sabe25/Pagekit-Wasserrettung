!function(t){function e(a){if(s[a])return s[a].exports;var i=s[a]={exports:{},id:a,loaded:!1};return t[a].call(i.exports,i,i.exports,e),i.loaded=!0,i.exports}var s={};return e.m=t,e.c=s,e.p="",e(0)}([function(t,e,s){window.Themes=_.merge(s(14),{name:"themes",el:"#themes",filters:{themeorder:function(t){var e=t.indexOf(_.find(t,{enabled:!0}));return e!==-1&&t.splice(0,0,t.splice(e,1)[0]),t}}}),Vue.ready(window.Themes)},function(t,e){t.exports={data:function(){return{pkg:{},output:"",status:"loading",options:{bgclose:!1,keyboard:!1}}},created:function(){this.$mount().$appendTo("body")},methods:{init:function(){var t=this;return this.open(),{onprogress:function(){t.setOutput(this.responseText)}}},setOutput:function(t){var e=t.split("\n"),s=e[e.length-1].match(/^status=(success|error)$/);s?(this.status=s[1],delete e[e.length-1],this.output=e.join("\n")):this.output=t},open:function(){this.$refs.output.open(),this.$refs.output.modal.on("hide.uk.modal",this.onClose)},close:function(){this.$refs.output.close()},onClose:function(){this.cb&&this.cb(this),this.$destroy()}},watch:{status:function(){"loading"!==this.status&&(this.$refs.output.modal.options.bgclose=!0,this.$refs.output.modal.options.keyboard=!0)}}}},function(t,e,s){var a=Vue.extend(s(11)),i=Vue.extend(s(12)),n=Vue.extend(s(13));t.exports={methods:{queryUpdates:function(t,e){var s={},a={emulateJSON:!0};return _.each(t,function(t){s[t.name]=t.version}),this.$http.post(this.api+"/api/package/update",{packages:JSON.stringify(s)},a).then(e,this.error)},enable:function(t){return this.$http.post("admin/system/package/enable",{name:t.name}).then(function(){this.$notify(this.$trans('"%title%" enabled.',{title:t.title})),Vue.set(t,"enabled",!0),document.location.assign(this.$url("admin/system/package/"+("pagekit-theme"===t.type?"themes":"extensions")))},this.error)},disable:function(t){return this.$http.post("admin/system/package/disable",{name:t.name}).then(function(){this.$notify(this.$trans('"%title%" disabled.',{title:t.title})),Vue.set(t,"enabled",!1),document.location.reload()},this.error)},install:function(t,e,s,i){var n=new a({parent:this});return n.install(t,e,s,i)},update:function(t,e,s,a){var i=new n({parent:this});return i.update(t,e,s,a)},uninstall:function(t,e){var s=new i({parent:this});return s.uninstall(t,e)},error:function(t){this.$notify(t.data,"danger")}}}},function(t,e){e.compare=function(t,e,s){this.php_js=this.php_js||{},this.php_js.ENV=this.php_js.ENV||{};var a,i,n=0,o={dev:-6,alpha:-5,a:-5,beta:-4,b:-4,RC:-3,rc:-3,"#":-2,p:1,pl:1},r=function(t){return t=(""+t).replace(/[_\-+]/g,"."),t=t.replace(/([^.\d]+)/g,".$1.").replace(/\.{2,}/g,"."),t.length?t.split("."):[-8]},u=function(t){return t?isNaN(t)?o[t]||-7:parseInt(t,10):0};for(t=r(t),e=r(e),i=Math.max(t.length,e.length),a=0;a<i;a++)if(t[a]!=e[a]){if(t[a]=u(t[a]),e[a]=u(e[a]),t[a]<e[a]){n=-1;break}if(t[a]>e[a]){n=1;break}}if(!s)return n;switch(s){case">":case"gt":return n>0;case">=":case"ge":return n>=0;case"<=":case"le":return n<=0;case"==":case"=":case"eq":return 0===n;case"<>":case"!=":case"ne":return 0!==n;case"":case"<":case"lt":return n<0;default:return null}}},function(t,e,s){"use strict";t.exports={mixins:[s(1)],methods:{install:function(t,e,s,a){return this.$set("pkg",t),this.cb=s,this.$http.post("admin/system/package/install",{"package":t,packagist:Boolean(a)},null,{xhr:this.init()}).then(function(){if("success"===this.status&&e){var s=_.findIndex(e,"name",t.name);-1!==s?e.splice(s,1,t):e.push(t)}},function(t){this.$notify(t.data,"danger"),this.close()})},enable:function(){this.$parent.enable(this.pkg),this.close()}}}},function(t,e,s){"use strict";t.exports={mixins:[s(1)],methods:{uninstall:function(t,e){return this.$set("pkg",t),this.$http.post("admin/system/package/uninstall",{name:t.name},{xhr:this.init()}).then(function(){"success"===this.status&&e&&e.splice(e.indexOf(t),1)},function(t){this.$notify(t.data,"danger"),this.close()})}}}},function(t,e,s){"use strict";t.exports={mixins:[s(1)],methods:{update:function(t,e,s,a){return this.$set("pkg",t),this.cb=s,this.$http.post("admin/system/package/install",{"package":e[t.name],packagist:Boolean(a)},null,{xhr:this.init()}).then(function(){"loading"===this.status&&(this.status="error"),"success"===this.status&&Vue["delete"](e,t.name),t.enabled&&this.$parent.enable(t).then(null,function(){this.status="error"})},function(t){this.$notify(t.data,"danger"),this.close()})}}}},function(t,e){t.exports=' <div> <v-modal v-ref:output :options=options> <div class="uk-modal-header uk-flex uk-flex-middle"> <h2>{{ \'Installing %title% %version%\' | trans {title:pkg.title,version:pkg.version} }}</h2> </div> <pre class="pk-pre uk-text-break" v-html=output></pre> <v-loader v-show="status == \'loading\'"></v-loader> <div class="uk-alert uk-alert-success" v-show="status == \'success\'">{{ \'Successfully installed.\' | trans }}</div> <div class="uk-alert uk-alert-danger" v-show="status == \'error\'">{{ \'Error\' | trans}}</div> <div class="uk-modal-footer uk-text-right" v-show="status != \'loading\'"> <a class="uk-button uk-button-link" @click.prevent=close>{{ \'Close\' | trans }}</a> <a class="uk-button uk-button-primary" @click.prevent=enable v-show="status == \'success\'">{{ \'Enable\' | trans }}</a> </div> </v-modal> </div> '},function(t,e){t.exports=' <div> <v-modal v-ref:output :options=options> <div class="uk-modal-header uk-flex uk-flex-middle"> <h2>{{ \'Removing %title% %version%\' | trans {title:pkg.title,version:pkg.version} }}</h2> </div> <pre class="pk-pre uk-text-break" v-html=output></pre> <v-loader v-show="status == \'loading\'"></v-loader> <div class="uk-alert uk-alert-success" v-show="status == \'success\'">{{ \'Successfully removed.\' | trans }}</div> <div class="uk-alert uk-alert-danger" v-show="status == \'error\'">{{ \'Error\' | trans}}</div> <div class="uk-modal-footer uk-text-right" v-show="status != \'loading\'"> <a class="uk-button uk-button-link" @click.prevent=close>{{ \'Close\' | trans }}</a> </div> </v-modal> </div> '},function(t,e){t.exports=' <div> <v-modal v-ref:output :options=options> <div class="uk-modal-header uk-flex uk-flex-middle"> <h2>{{ \'Updating %title% to %version%\' | trans {title:pkg.title,version:pkg.version} }}</h2> </div> <pre class="pk-pre uk-text-break" v-html=output></pre> <v-loader v-show="status == \'loading\'"></v-loader> <div class="uk-alert uk-alert-success" v-show="status == \'success\'">{{ \'Successfully updated.\' | trans }}</div> <div class="uk-alert uk-alert-danger" v-show="status == \'error\'">{{ \'Error\' | trans}}</div> <div class="uk-modal-footer uk-text-right" v-show="status != \'loading\'"> <a class="uk-button uk-button-link" @click.prevent=close>{{ \'Close\' | trans }}</a> </div> </v-modal> </div> '},function(t,e,s){var a,i;a=s(15),i=s(17),t.exports=a||{},t.exports.__esModule&&(t.exports=t.exports["default"]),i&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=i)},function(t,e,s){var a,i;a=s(4),i=s(7),t.exports=a||{},t.exports.__esModule&&(t.exports=t.exports["default"]),i&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=i)},function(t,e,s){var a,i;a=s(5),i=s(8),t.exports=a||{},t.exports.__esModule&&(t.exports=t.exports["default"]),i&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=i)},function(t,e,s){var a,i;a=s(6),i=s(9),t.exports=a||{},t.exports.__esModule&&(t.exports=t.exports["default"]),i&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=i)},function(t,e,s){t.exports={mixins:[s(2)],data:function(){return _.extend({"package":{},view:!1,updates:null,search:this.$session.get(this.$options.name+".search",""),status:""},window.$data)},ready:function(){this.load()},watch:{search:function(t){this.$session.set(this.$options.name+".search",t)}},methods:{load:function(){this.$set("status","loading"),this.packages&&this.queryUpdates(this.packages).then(function(t){var e=t.data;this.$set("updates",e.packages.length?_.indexBy(e.packages,"name"):null),this.$set("status","")},function(){this.$set("status","error")})},icon:function(t){return t.extra&&t.extra.icon?t.url+"/"+t.extra.icon:this.$url("app/system/assets/images/placeholder-icon.svg")},image:function(t){return t.extra&&t.extra.image?t.url+"/"+t.extra.image:this.$url("app/system/assets/images/placeholder-800x600.svg")},details:function(t){this.$set("package",t),this.$refs.details.open()},settings:function(t){if(t.settings){var e,s;_.forIn(this.$options.components,function(a,i){s=a.options||{},s.settings&&t.settings===i&&(e=i)}),e?(this.$set("package",t),this.$set("view",e),this.$refs.settings.open()):window.location=t.settings}}},filters:{empty:function(t){return 0===Vue.filter("filterBy")(t,this.search,"title").length}},components:{"package-upload":s(19),"package-details":s(10)}}},function(t,e,s){"use strict";var a=s(3);t.exports={props:{api:{type:String,"default":""},"package":{type:Object,"default":function(){return{}}}},data:function(){return{messages:{}}},filters:{icon:function(t){var e=t.extra||{};return e.icon?e.icon.match(/^(https?:)?\//)?e.icon:t.url+"/"+e.icon:this.$url("app/system/assets/images/placeholder-icon.svg")},image:function(t){var e=t.extra||{};return e.image?e.image.match(/^(https?:)?\//)?e.image:t.url+"/"+e.image:this.$url("app/system/assets/images/placeholder-image.svg")}},watch:{"package":{handler:function(){this["package"].name&&(_.isArray(this["package"].authors)&&(this["package"].author=this["package"].authors[0]),this.$set("messages",{}),this.queryPackage(this["package"],function(t){var e=t.data,s=this["package"].version,i=e.versions[s];i&&this["package"].shasum&&this.$set("messages.checksum",i.dist.shasum!=this["package"].shasum),_.each(e.versions,function(t){a.compare(t.version,s,">")&&(s=t.version)}),this.$set("messages.update",s!=this["package"].version)}))},immediate:!0}},methods:{queryPackage:function(t,e){return this.$http.get(this.api+"/api/package/{+name}",{name:_.isObject(t)?t.name:t}).then(e,this.error)}}}},function(t,e,s){"use strict";t.exports={mixins:[s(2)],props:{api:{type:String,"default":""},packages:Array,type:String},data:function(){return{"package":{},upload:null,progress:""}},ready:function(){var t=this.type,e={action:this.$url.route("admin/system/package/upload"),type:"json",param:"file",before:function(e){_.merge(e.params,{_csrf:$pagekit.csrf,type:t})},loadstart:this.onStart,progress:this.onProgress,allcomplete:this.onComplete};UIkit.uploadSelect(this.$els.input,e),this.modal=UIkit.modal(this.$els.modal)},methods:{onStart:function(){this.progress="1%"},onProgress:function(t){this.progress=Math.ceil(t)+"%"},onComplete:function(t){var e=this;return this.progress="100%",setTimeout(function(){e.progress=""},250),t["package"]?(this.$set("upload",t),this.$set("package",t["package"]),void this.modal.show()):void this.$notify(t,"danger")},doInstall:function(){this.modal.hide(),this.install(this.upload["package"],this.packages,function(t){"success"===t.status&&setTimeout(function(){location.reload()},300)},!0)}},components:{"package-details":s(10)}}},function(t,e){t.exports=" <div class=\"uk-modal-header uk-flex uk-flex-middle\"> <img class=uk-margin-right width=50 height=50 :alt=package.title :src=\"package | icon\" v-if=package.extra.icon> <div class=uk-flex-item-1> <h2 class=uk-margin-small-bottom>{{ package.title }}</h2> <ul class=\"uk-subnav uk-subnav-line uk-margin-bottom-remove\"> <li class=uk-text-muted>{{ package.authors[0].name }}</li> <li class=uk-text-muted>{{ 'Version %version%' | trans {version:package.version} }}</li> </ul> </div> </div> <div class=\"uk-alert uk-alert-danger\" v-show=messages.checksum> {{ 'The checksum of the uploaded package does not match the one from the marketplace. The file might be manipulated.' | trans }} </div> <div class=uk-alert v-show=messages.update> {{ 'There is an update available for the package.' | trans }} </div> <p>{{ package.description }}</p> <ul class=uk-list> <li v-if=package.license><strong>{{ 'License:' | trans }}</strong> {{ package.license }}</li> <li v-if=package.authors[0].homepage><strong>{{ 'Homepage:' | trans }}</strong> <a :href=package.authors[0].homepage target=_blank>{{ package.authors[0].homepage }}</a></li> <li v-if=package.authors[0].email><strong>{{ 'Email:' | trans }}</strong> <a href=\"mailto:{{ package.authors[0].email }}\">{{ package.authors[0].email }}</a></li> </ul> <img width=1200 height=800 :alt=package.title :src=\"package | image\" v-if=package.extra.image> "},function(t,e){t.exports=' <a class="uk-button uk-button-primary uk-form-file"> <span v-show=!progress>{{ \'Upload\' | trans }}</span> <span v-else><i class="uk-icon-spinner uk-icon-spin"></i> {{ progress }}</span> <input type=file name=file v-el:input> </a> <div class=uk-modal v-el:modal> <div class=uk-modal-dialog> <package-details :api=api :package=package></package-details> <div class="uk-modal-footer uk-text-right"> <button class="uk-button uk-button-link uk-modal-close" type=button>{{ \'Cancel\' | trans }}</button> <button class="uk-button uk-button-link" @click.prevent=doInstall>{{ \'Install\' | trans }}</button> </div> </div> </div> '},function(t,e,s){var a,i;a=s(16),i=s(18),t.exports=a||{},t.exports.__esModule&&(t.exports=t.exports["default"]),i&&(("function"==typeof t.exports?t.exports.options||(t.exports.options={}):t.exports).template=i)}]);