$(function() {
	// ======================= imagesLoaded Plugin ===============================
	// https://github.com/desandro/imagesloaded

	// $('#my-container').imagesLoaded(myFunction)
	// execute a callback when all images have loaded.
	// needed because .load() doesn't work on cached images

	// callback function gets image collection as argument
	//  this is the container

	// original: mit license. paul irish. 2010.
	// contributors: Oren Solomianik, David DeSandro, Yiannis Chatzikonstantinou

	$.fn.imagesLoaded 		= function( callback ) {
	var $images = this.find('img'),
		len 	= $images.length,
		_this 	= this,
		blank 	= 'data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==';

	function triggerCallback() {
		callback.call( _this, $images );
	}

	function imgLoaded() {
		if ( --len <= 0 && this.src !== blank ){
			setTimeout( triggerCallback );
			$images.off( 'load error', imgLoaded );
		}
	}

	if ( !len ) {
		triggerCallback();
	}

	$images.on( 'load error',  imgLoaded ).each( function() {
		// cached images don't fire load sometimes, so we reset src.
		if (this.complete || this.complete === undefined){
			var src = this.src;
			// webkit hack from http://groups.google.com/group/jquery-dev/browse_thread/thread/eee6ab7b2da50e1f
			// data uri bypasses webkit log warning (thx doug jones)
			this.src = blank;
			this.src = src;
		}
	});

	return this;
	};

	// gallery container
	var $rgGallery			= $('#rg-gallery'),
	// carousel container
	$esCarousel			= $rgGallery.find('div.es-carousel-wrapper'),
	// the carousel items
	$items				= $esCarousel.find('ul > li'),
	// total number of items
	itemsCount			= $items.length;
	
	Gallery				= (function() {
			// index of the current item
		var current			= 0, 
			// mode : carousel || fullview
			mode 			= 'carousel',
			// control if one image is being loaded
			anim = false,
            showDownLoad = false,
            downLoadFun=null,
			init			= function(setItem) {
			    if (typeof (setItem) != 'undefined')
			    {
			        if (setItem.showDownLoad)
			            showDownLoad = setItem.showDownLoad;
			        if (setItem.downLoadFun)
			            downLoadFun = setItem.downLoadFun;
			    }
				// (not necessary) preloading the images here...
				$items.add('<img src="images/ajax-loader.gif"/><img src="images/black.png"/>').imagesLoaded( function() {
					// add options
					_addViewModes();
					
					// add large image wrapper
					_addImageWrapper();
					
					// show first image
					_showImage( $items.eq( current ) );
						
				});
				
				// initialize the carousel
				if( mode === 'carousel' )
					_initCarousel();
				
			},
			_initCarousel	= function() {
				
				// we are using the elastislide plugin:
				// http://tympanus.net/codrops/2011/09/12/elastislide-responsive-carousel/
				$esCarousel.show().elastislide({
					imageW 	: 65,
					onClick	: function( $item ) {
						if( anim ) return false;
						anim	= true;
						// on click show image
						_showImage($item);
						// change current
						current	= $item.index();
					}
				});
				
				// set elastislide's current to current
				$esCarousel.elastislide( 'setCurrent', current );
				
			},
			_addViewModes	= function() {
				
				// top right buttons: hide / show carousel
				
			    var $viewfull = $('<a href="#" class="rg-view-full" title="Òþ²ØËõÂÔÍ¼"></a>'),
					$viewthumbs = $('<a href="#" class="rg-view-thumbs rg-view-selected" title="ÏÔÊ¾ËõÂÔÍ¼"></a>');
				//jshÐÞ¸Ä
				if (showDownLoad == true) {
				    $downLoad = $('<a href="#" class="rg-download" id="downLoadAllPhoto" title="ÏÂÔØËùÓÐÍ¼Æ¬"></a>');
				    if (downLoadFun)
				        $downLoad.click(function () { downLoadFun() });
				    $rgGallery.prepend($('<div class="rg-view"/>').append($downLoad).append($viewfull).append($viewthumbs));
				}
			    else
				    $rgGallery.prepend($('<div class="rg-view"/>').append($viewfull).append($viewthumbs));

				$viewfull.on('click.rgGallery', function( event ) {
						if( mode === 'carousel' )
							$esCarousel.elastislide( 'destroy' );
						$esCarousel.hide();
					$viewfull.addClass('rg-view-selected');
					$viewthumbs.removeClass('rg-view-selected');
					mode	= 'fullview';
					return false;
				});
				
				$viewthumbs.on('click.rgGallery', function( event ) {
					_initCarousel();
					$viewthumbs.addClass('rg-view-selected');
					$viewfull.removeClass('rg-view-selected');
					mode	= 'carousel';
					return false;
				});
				
				if( mode === 'fullview' )
					$viewfull.trigger('click');
					
			},
			_addImageWrapper= function() {
				
				// adds the structure for the large image and the navigation buttons (if total items > 1)
				// also initializes the navigation events
				
				$('#img-wrapper-tmpl').tmpl( {itemsCount : itemsCount} ).appendTo( $rgGallery );
				
				if( itemsCount > 1 ) {
					// addNavigation
					var $navPrev		= $rgGallery.find('a.rg-image-nav-prev'),
						$navNext		= $rgGallery.find('a.rg-image-nav-next'),
						$imgWrapper		= $rgGallery.find('div.rg-image');
						
					$navPrev.on('click.rgGallery', function( event ) {
						_navigate( 'left' );
						return false;
					});	
					
					$navNext.on('click.rgGallery', function( event ) {
						_navigate( 'right' );
						return false;
					});
				
					// add touchwipe events on the large image wrapper
					$imgWrapper.touchwipe({
						wipeLeft			: function() {
							_navigate( 'right' );
						},
						wipeRight			: function() {
							_navigate( 'left' );
						},
						preventDefaultEvents: false
					});
				
					$(document).on('keyup.rgGallery', function( event ) {
						if (event.keyCode == 39)
							_navigate( 'right' );
						else if (event.keyCode == 37)
							_navigate( 'left' );	
					});
					
				}
				
			},
			_navigate		= function( dir ) {
				
				// navigate through the large images
				
				if( anim ) return false;
				anim	= true;
				
				if( dir === 'right' ) {
					if( current + 1 >= itemsCount )
						current = 0;
					else
						++current;
				}
				else if( dir === 'left' ) {
					if( current - 1 < 0 )
						current = itemsCount - 1;
					else
						--current;
				}
				
				_showImage( $items.eq( current ) );
				
			},
			_showImage		= function( $item ) {
				
				// shows the large image that is associated to the $item
				
				var $loader	= $rgGallery.find('div.rg-loading').show();
				
				$items.removeClass('selected');
				$item.addClass('selected');
					 
				var $thumb		= $item.find('img'),
					largesrc	= $thumb.data('large'),
					title		= $thumb.data('description');
				
				$('<img/>').load( function() {
					
					$rgGallery.find('div.rg-image').empty().append('<img src="' + largesrc + '"/>');
					
					if( title )
						$rgGallery.find('div.rg-caption').show().children('p').empty().text( title );
					
					$loader.hide();
					
					if( mode === 'carousel' ) {
						$esCarousel.elastislide( 'reload' );
						$esCarousel.elastislide( 'setCurrent', current );
					}
					
					anim	= false;
					
				}).attr( 'src', largesrc );
				
			},
			addItems		= function( $new ) {
			
				$esCarousel.find('ul').append($new);
				$items 		= $items.add( $($new) );
				itemsCount	= $items.length; 
				$esCarousel.elastislide( 'add', $new );
			
			};
		
		return { 
			init 		: init,
			addItems	: addItems
		};
	
	})();

	//Gallery.init();
	
	/*
	Example to add more items to the gallery:
	
	var $new  = $('<li><a href="#"><img src="images/thumbs/1.jpg" data-large="images/1.jpg" alt="image01" data-description="From off a hill whose concave womb reworded" /></a></li>');
	Gallery.addItems( $new );
	*/
});