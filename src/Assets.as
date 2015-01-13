package  
{
	/**
	 * ...
	 * @author Jose Luis Jimenez Urbano
	 */
	public class Assets {
		
		//Backgrounds
		[Embed(source = "../assets/space_bg.jpg")] public static const space_bg:Class; 
		
		//Ships
		[Embed(source = "../assets/ship_pack_parts/ss_ship3.png")]public static const ss_ship3:Class;
		[Embed(source = "../assets/ship_pack_parts/ss_ship9.png")]public static const enemy_ship1:Class;
		[Embed(source = "../assets/ship_pack_parts/ss_ship4.png")]public static const enemy_ship2:Class;
		[Embed(source = "../assets/ship_pack_parts/ss_ship2.png")]public static const enemy_ship3:Class;
		[Embed(source = "../assets/ship_pack_parts/shipExample.png")]public static const enemy_ship4:Class;
		
		//Fonts
		[Embed(source="../assets/fonts/Audiowide-Regular.ttf",
			fontName = "audiowide", 
			mimeType = "application/x-font", 
			fontWeight="normal", 
			fontStyle="normal", 
			unicodeRange="U+0020-U+007E", 
			advancedAntiAliasing = "true",
			embedAsCFF="false"
		)]
        public static var audiowide_font:Class;
		
		//XML / Atlas
		[Embed(source = "../assets/background.xml", mimeType = "application/octet-stream")] public static const atlas_xml:Class;
	}

}