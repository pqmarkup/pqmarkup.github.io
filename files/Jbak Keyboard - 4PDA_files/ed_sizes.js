var BBSizes_title='������:';var BBSizes_know=new Array(1,2,3,4,5,6,7);function BBSizes(BBEditor,obj){ this.initialize=false;this.BBEditor=BBEditor;this.editor_id=BBEditor.editor_id;this._obj=BBEditor[obj];this.init=function(){if(this.initialize){return;}if(!this._obj){return;}this._obj.innerHTML='';var _p_t=BBSizes_title;BBSizes_title='';this.BBEditor.create_panel_title(this._obj,BBSizes_title);BBSizes_title=_p_t;this._obj.className='ed-panel';var _t=document.createElement('table');_t.cellPadding=0;_t.cellSpacing=0;_t.border=0;var _r=_t.insertRow(-1);var _c=_r.insertCell(-1);_c.innerHTML='&nbsp;';_c=_r.insertCell(-1);_c.innerHTML=_p_t;_c.className='ed-panel-title';for(var i=0;i<BBSizes_know.length;i++){_c=_r.insertCell(-1);_c.width='1px';var _b=document.createElement('div');_b.editor_id=this.editor_id;_b.innerHTML=_b._fsize=new String(BBSizes_know[i]);_b.className='ed-bbcode-normal';_b.onclick=function(e){var retval=true;if(is_ie){e=window.event;}if(e.type=='click'){retval=BBEditors[this.editor_id].wrap_text_option('SIZE',this._fsize);}return retval;};_b.onmousemove=function(){if(!this.is_down){this.className='ed-bbcode-hover';}};_b.onmousedown=function(){this.is_down=1;this.className='ed-bbcode-down';};_b.onmouseup=function(){this.is_down=0;this.className='ed-bbcode-hover';};_b.onmouseout=function(){this.is_down=0;this.className='ed-bbcode-normal';};_c.appendChild(_b);}this._obj.appendChild(_t);this.initialize=true;};this.init();}