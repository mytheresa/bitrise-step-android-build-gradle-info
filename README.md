# Bitrise Step Android Build Gradle Info

We created this custom Bitrise step because we needed two grab these two information from an Android project:
- versionName
- versionCode 

These information on Android can be defined either in `AndroidManifest.xml` either in `build.gradle`.
In our React Native app they are defined in module's `build.gradle` file because of the library [react-native-version](https://github.com/stovmascript/react-native-version) we are using to automatically increment the version number.  

Unfortunately was available only one Bitrise step (open source) to grab these information from `AndroidManifest.xml` called [bitrise-step-android-manifest-info](https://github.com/tomcurran/bitrise-step-android-manifest-info).
So we forked this repo and created this custom Bitrise step to grab the information from the `build.gradle` file.

## Usage

Currently is not published in the Bitrise Steps repository (we could in the future), so we can't add this step through the Bitrise Workflow tab, but only editing the `bitrise.yml`. 

```yaml
# Example of bitrise.yml

workflows:
  primary:
    steps:
    - cache-pull@2.0.1: {}
    - activate-ssh-key@3.1.1:
        run_if: '{{getenv "SSH_RSA_PRIVATE_KEY" | ne ""}}'
    - git-clone@4.0.11: {}

    # Android Build Gradle Info Step integration
    - git::https://github.com/mytheresa/bitrise-step-android-build-gradle-info.git:
        inputs:
        - build_gradle_file: "$ANDROID_APP_BUILD_GRADLE_PATH"
```

For more information check the [Special step sources](https://devcenter.bitrise.io/bitrise-cli/steps/#special-step-sources) on the official documentation.

## Further development

Please check the [Creating and sharing your own step](https://devcenter.bitrise.io/bitrise-cli/create-your-own-step/) on official Bitrise documentation to understand how this was develop and how to eventually extend it

## Author
Vittorio Morganti (@toioski)
<vittorio.morganti@mytheresa.com>
  
