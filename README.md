# JazzyTest
Test project showcasing issue with generating docs with Jazzy for test projects

# Generating Documents

First, install pods using cocoa pods: `cd JazzyTest; pod install`. You then should be able to open JazzyTest.xcworkspace to verify that it compiles.

Then, to generate the test documents, run the `generateDocs.sh` with any of the following `all, app, ui, unit`. E.g `./generateDocs.sh app` will generate the docs for the app project.

# Issue

When generating docs for any project aside from the main project `JazzyTest`, the command fails with the following output:

```
/Users/user/.rbenv/versions/3.3.1/lib/ruby/gems/3.3.0/gems/jazzy-0.15.1/lib/jazzy/executable.rb:39:in `execute_command': /Users/user/.rbenv/versions/3.3.1/lib/ruby/gems/3.3.0/gems/jazzy-0.15.1/bin/sourcekitten ["doc", "--module-name", "JazzyTestTests", "--", "-workspace", "JazzyTest.xcworkspace", "-scheme", "JazzyTest", "-destination\\=platform\\=ios\\ simulator", "name\\=iPad\\ \\(9th\\ generation\\)"] (RuntimeError)

2024-08-01 11:49:38.890 xcodebuild[39479:3252048]  DVTPlugInQuery: Requested but did not find extension point with identifier 'Xcode.InterfaceBuilderBuildSupport.PlatformDefinition'. This is programmer error; code should only request extension points that are defined by itself or its dependencies.

Running xcodebuild

Checking xcodebuild -showBuildSettings

Running xcodebuild

Could not parse compiler arguments from `xcodebuild` output.

Please confirm that `xcodebuild` is building a Swift module.

Saved `xcodebuild` log file: /var/folders/0t/m6b2x0tj5rsfxvr3_3fxvb1m0000gn/T/xcodebuild-F8463AF5-18A0-40E6-844C-148A05D4177E.log

Error: Failed to generate documentation

	from /Users/user/.rbenv/versions/3.3.1/lib/ruby/gems/3.3.0/gems/jazzy-0.15.1/lib/jazzy/sourcekitten.rb:229:in `run_sourcekitten'
	from /Users/user/.rbenv/versions/3.3.1/lib/ruby/gems/3.3.0/gems/jazzy-0.15.1/lib/jazzy/doc_builder.rb:83:in `block (2 levels) in build'
	from /Users/user/.rbenv/versions/3.3.1/lib/ruby/gems/3.3.0/gems/jazzy-0.15.1/lib/jazzy/doc_builder.rb:81:in `chdir'
	from /Users/user/.rbenv/versions/3.3.1/lib/ruby/gems/3.3.0/gems/jazzy-0.15.1/lib/jazzy/doc_builder.rb:81:in `block in build'
	from /Users/user/.rbenv/versions/3.3.1/lib/ruby/gems/3.3.0/gems/jazzy-0.15.1/lib/jazzy/doc_builder.rb:71:in `map'
	from /Users/user/.rbenv/versions/3.3.1/lib/ruby/gems/3.3.0/gems/jazzy-0.15.1/lib/jazzy/doc_builder.rb:71:in `build'
	from /Users/user/.rbenv/versions/3.3.1/lib/ruby/gems/3.3.0/gems/jazzy-0.15.1/bin/jazzy:16:in `<top (required)>'
	from /Users/user/.rbenv/versions/3.3.1/bin/jazzy:25:in `load'
	from /Users/user/.rbenv/versions/3.3.1/bin/jazzy:25:in `<main>'
```
