package
{
    import openfl.display.Sprite;
    import openfl.system.Capabilities;
    import openfl.utils.AssetLibrary;
    import openfl.utils.AssetManifest;
    import openfl.utils.Assets;

    import starling.core.Starling;
    import starling.events.Event;
    import starling.text.BitmapFont;
    import starling.text.TextField;
    import starling.textures.Texture;
    import starling.textures.TextureAtlas;
    import starling.assets.AssetManager;
    

    
    public class FlappyStarlingWeb extends Sprite
    {
        private var _starling:Starling;

        public function FlappyStarlingWeb()
        {
            _starling = new Starling(Game, stage);
            _starling.addEventListener(Event.ROOT_CREATED, function():void
            {
                loadAssets(startGame);
            });
            _starling.start();
        }

        private function loadAssets(onComplete:Function):void
        {
            var assets:AssetManager = new AssetManager();
            assets.verbose = Capabilities.isDebugger;

            var manifest:AssetManifest = new AssetManifest();
            
            manifest.addText("assets/textures/1x/atlas.xml");
            manifest.addBitmapData("assets/textures/1x/atlas.png");
            manifest.addFont("bradybunch");
            manifest.addBitmapData("assets/fonts/1x/bradybunch.png");
            manifest.addText("assets/fonts/1x/bradybunch.fnt")
            manifest.addSound(["assets/sounds/flap.mp3"]);
            manifest.addSound(["assets/sounds/pass.mp3"]);
            manifest.addSound(["assets/sounds/crash.mp3"]);

            AssetLibrary.loadFromManifest(manifest).onComplete(function(library:AssetLibrary):void{
                Assets.registerLibrary("default", library)

                var atlasTexture:Texture = Texture.fromBitmapData(Assets.getBitmapData("assets/textures/1x/atlas.png"), false);
                var atlasXml:String = Assets.getText("assets/textures/1x/atlas.xml");
                var bradybunchTexture:Texture = Texture.fromBitmapData(Assets.getBitmapData("assets/fonts/1x/bradybunch.png"), false);
                var bradybunchXml:String = Assets.getText("assets/fonts/1x/bradybunch.fnt");
                var bitmapFont:BitmapFont = new BitmapFont(bradybunchTexture, bradybunchXml);
                TextField.registerCompositor(bitmapFont, "bradybunch");
                assets.addAsset("atlas", atlasTexture)
                assets.addAsset("atlas", new TextureAtlas(atlasTexture, atlasXml))
                assets.addAsset("pass", Assets.getSound("assets/sounds/pass.mp3"));
                assets.addAsset("flap", Assets.getSound("assets/sounds/flap.mp3"));
                assets.addAsset("crash", Assets.getSound("assets/sounds/crash.mp3"));
            })

        }
        private function startGame(assets:AssetManager):void
        {
            var game:Game = _starling.root as Game;
            game.start(assets)
        }
    }
}
