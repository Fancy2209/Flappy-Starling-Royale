package
{
    public class EmbeddedAssets
    {
        /** ATTENTION: Naming conventions!
         *
         *  - Classes for embedded IMAGES should have the exact same name as the file,
         *    without extension. This is required so that references from XMLs (atlas, bitmap font)
         *    won't break.
         *
         *  - Atlas and font XML files can have an arbitrary name, since they are never
         *    referenced by file name.
         *
         */

        // Texture Atlas

       // [Assets.getAsset("../assets/textures/1x/atlas.xml",
       // Assets.getAsset("../assets/textures/1x/atlas.png"),
       // Assets.getAsset("../assets/fonts/1x/bradybunch.fnt"),
       // Assets.getAsset("../assets/fonts/1x/bradybunch.png"),
       // Assets.getAsset("../assets/sounds/flap.mp3"),
       // Assets.getAsset("../assets/sounds/pass.mp3"),
       // Assets.getAsset("../assets/sounds/crash.mp3")]
    }
}
