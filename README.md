# dart_avif_decoder

AVIF decoding functionality for both native and Web WASM environments. This package is derived from the decoder component of [flutter_avif](https://github.com/yekeskin/flutter_avif), enhanced with Web support.

[flutter_avif](https://github.com/yekeskin/flutter_avif) should be preferred. This is much narrower, and only has the decoder with a new Web implementation.

# Full Notes

The situation resulting in this being the best situation is complex.
- `flutter_avif` is based on `flutter_rust_bridge`, which changed significantly in 2.x.x, enough that the `flutter_avif` has found it difficult to find time to update.
- Updating `flutter_avif` in place didn't work, as the author notes, it is a significant amount of work, and in my estimation, it may not be possible. There's not many docs on migrating from 1.x.x to 2.x.x, and those that exist recommend running a `flutter_rust_bridge create .` command, much like you'd run `flutter create .` on an existing project to add a new platform. However, `flutter_rust_bridge create` variant is challenging to understand in the context of an upgrade, it resulted in new demos and API replacing some of the existing ones, and others didn't seem to update.
- At that point, I tried creating a new `flutter_rust_bridge` project, and then porting the `flutter_avif` code into it. This worked on native, however, not on web. I have a feeling `flutter_avif` is set up to do custom initialization of the plugin to handle this situation, but it's not clear how to do that and support the new `flutter_rust_bridge` setup.
- At that point, I decided to prioritize the core feature in `flutter_avif` required for my use case, turning an AVIF into a `dart:ui.Image`. I wrote a web implementation that avoids using `flutter_rust_bridge` entirely and uses `dart:web` and `dart:js_interop` only. This is the package you see here.