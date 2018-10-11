{language}
	muses_skin_selector: {
		title: '{="%s Skins","Muses"}',
		subtitle: '{="Choose a skin"}',
		select: '{="Select"}',
		cancel: '{="Cancel"}'
	},
	select_skin: '{="Select a skin to preview"}',
{/language}
{options type="muses_skin_selector"}
	skins: {$muses_skins|json_encode}
{/options}

{javascript}
<script language="javascript">
window.centovacast.muses_skin_selector = {

	$preview: null,
	$select: null,
	dialog: null,

	activate: function() {
		var self = this;
		this.dialog = new DialogWindow(
			{
				id: 'muses_skin_selector',
				dialog: {
					height: '160px'
				},
				buttons: {
					select: function(){ self.apply_skin(); self.close();  },
					cancel: function() { self.close(); }
				}
			},
			window.lang.muses_skin_selector,
			this.generate_selector()
		);
		this.dialog.on('show',function () {
			self.$select.change();
		});
		this.dialog.on('close',function() {
			self.close();
		});
		this.dialog.disable_button('select');
		this.dialog.show();
	},

	change_skin: function(select) {
		var selected = $(select).getSelectedOption().text();
		this.load_skin(selected);
	},

	show_error: function(message) {
		this.$preview.text(message);
	},

	load_skin: function(name) {
		var self = this;
		$.ajax({
			type: 'GET',
			url: '/muses/muses-' + name + '.xml',
			dataType: 'xml',
			success: function(data, textStatus, xhr) {
				self.generate_skin_preview(data,name);
			},
			error: function(xhr, textStatus, errorThrown) {
				if (errorThrown === undefined) {
					errorThrown = xhr.statusCode()+' '+xhr.statusText;
				}
				self.show_error(textStatus+' - '+errorThrown);
			}
		});
	},

	get_skin_data: function(name) {
		var skins = window.centovacast.options.muses_skin_selector.skins;
		var s;
		var skindata = null;

		for (s in skins) {
			if (!skins.hasOwnProperty(s)) continue;
			if (skins[s] && skins[s].name == name) {
				skindata = skins[s];
				break;
			}
		}

		return skindata;
	},

	generate_skin_preview: function(xmldocument,name) {
		var skindata = this.get_skin_data(name);

		var $skin = $(xmldocument);
		var $root = $skin.find('muses-skin,ffmp3-skin').first();

		var folder = $root.attr('folder');

		this.$preview
			.empty()
			.css({ width: skindata.width+'px', height: skindata.height+'px' });

		var $sprite,spritename, i,image;
		var sprites = [ 'bg','play','stop','status' ]

		for (i=0; i<sprites.length; i++) {
			spritename = sprites[i];

			$sprite = $root.find(spritename);
			if (!$sprite.length) continue;

			if (spritename == 'status') {
				image = $sprite.attr('imageStop');
			} else {
				image = $sprite.attr('image');
			}
			if (!image) continue;
			this.$preview.append(
				$('<img/>',{
					src: '/muses/' + folder + '/' + image,
					css: {
						position: 'absolute',
						top: parseInt($sprite.attr('y'),10)+'px',
						left: parseInt($sprite.attr('x'),10)+'px'
					}
				})
			);
		}

		var $sprite = $root.find('volume');
		if ($sprite.length) {
			var mode = $sprite.attr('mode');
			if (mode == 'holder' || mode == 'vholder') {
				image = $sprite.attr('holderImage')
				this.$preview.append(
					$('<img/>',{
						src: '/muses/' + folder + '/' + image,
						css: {
							position: 'absolute',
							top: parseInt($sprite.attr('y'),10)+'px',
							left: parseInt($sprite.attr('x'),10)+'px'
						}
					})
				);
			} else if (mode == 'bars') {
				var barwidth = parseInt($sprite.attr('barwidth'),10),
					barstep = parseInt($sprite.attr('barStep'),10),
					color1 = $sprite.attr('color1'),
					color2 = $sprite.attr('color2'),
					w = parseInt($sprite.attr('width'),10),
					h = parseInt($sprite.attr('height'),10),
					bartop, barheight;


				if (!barstep) barstep = parseInt($sprite.attr('barstep'),10);
				if (!barstep) barstep = 1;

				$bars = $('<div/>',{
					css: {
						position: 'absolute',
						top: parseInt($sprite.attr('y'),10)+'px',
						left: parseInt($sprite.attr('x'),10)+'px',
						width: w+'px',
						height: h+'px'
					}
				}).appendTo(this.$preview);

				var nbars = Math.floor(w / barstep);
				var halfbars = Math.floor(nbars / 2);
				for (var i=1; i<nbars; i++) {
					barheight = Math.floor( (i+1) / nbars * h );
					bartop = h - barheight;
					$bars.append(
						$('<div/>', {
							css: {
								position: 'absolute',
								top: bartop+'px',
								left: ( barstep*i ) + 'px',
								width: barwidth+'px',
								height: barheight+'px',
								backgroundColor: i<=halfbars ? color1 : color2
							}
						})
					);
				}
			}
		}


		var $text = $root.find('text');
		if ($text.length) {
			this.$preview.append(
				$('<div/>', {
					css: {
						position: 'absolute',
						top: (parseInt($text.attr('y'), 10) + 2) + 'px',
						left: parseInt($text.attr('x'), 10) + 'px',
						width: parseInt($text.attr('width'), 10) + 'px',
						height: parseInt($text.attr('height'), 10) + 'px',
						color: $text.attr('color'),
						fontFamily: $text.attr('font'),
						fontSize: $text.attr('fontSize') + 'pt',
						textAlign: $text.attr('align')
					}
				}).text('Sample skin')
			);
		}


		var $dialog = this.dialog.$dialog;
		var pos = $dialog.offset();
		var height = $dialog.outerHeight();

		this.$preview.css({
			top: (pos.top + height + 20)+'px',
			left: Math.floor( ($(document).width() - skindata.width) / 2 )+'px'
		}).show();

		this.dialog.enable_button('select');
	},

	generate_selector: function() {
		var self = this;

		this.$preview = $('<div/>',{
			id: 'muses-skin-preview',
			css: {
				position: 'absolute',
				zIndex: 255
			}
		}).hide();

		var skin_names = [];
		var skins = window.centovacast.options.muses_skin_selector.skins;
		var s;
		for (s in skins) {
			if (skins.hasOwnProperty(s) && typeof skins[s] == 'object' && skins[s].name) {
				skin_names.push(skins[s].name);
			}
		}

		this.$select = $('<select/>')
			.setSelectOptions(skin_names)
			.change(function(){ self.change_skin(this); });

		var $content = $('<div />')
			.append(
				$('<div/>',{ css: { paddingBottom: '5px' }})
					.text(window.lang.select_skin+':')
			)
			.append(this.$select)

		$('body').append(this.$preview);

		return $content;
	},

	close: function() {
		this.$preview.remove();
		this.dialog.close();
	},

	apply_skin: function() {
		var selected = this.$select.getSelectedOption().text();
		var skindata = this.get_skin_data(selected);

		var $anchortextarea = $('div#w_webplayer').find('textarea.widget_anchor');
		var anchor = $anchortextarea.val();
		if (!anchor) anchor = '';
		anchor = anchor.replace(/\s+data-(skin|width|height)="[^"]*"/g,'').replace(/data-username="/,'data-skin="'+selected+'" data-width="'+skindata.width+'" data-height="'+skindata.height+'" data-username="');
		$anchortextarea.val(anchor);
	}
};
</script>
{/javascript}

<a href="#" onclick="window.centovacast.muses_skin_selector.activate(); return false">{="Select a skin"}</a>