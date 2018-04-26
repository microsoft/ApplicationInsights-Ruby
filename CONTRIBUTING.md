# How to Contribute

If you're interested in contributing, take a look at the general [contributer's guide](https://github.com/Microsoft/ApplicationInsights-Home/blob/master/CONTRIBUTING.md) first.

## Build Gem

Run ```gem build application_insights.gemspec``` to generate the gem file.

And you can install the gem to test it locally by running ```gem install application_insights-[version].gem```.

## Run Test

Make sure you have bundler installed, you can install it by ```sudo gem install bundler```. And run ```bundler install``` once to install all dependencies.

Run ```rake test```.

## Releasing new version

This is for repository maintainers only:

1. Create and merge develop->master PR https://github.com/Microsoft/ApplicationInsights-Ruby/compare/master...develop?expand=1
2. Checkout latest `master`
    ``` 
    git checkout master
    git pull
    ```

3. Remove old gem: `rm *.gem`
4. [Build gem](https://github.com/Microsoft/ApplicationInsights-Ruby/blob/develop/CONTRIBUTING.md#build-gem) 
5. Push gem: `gem push application_insights-0.5.5.gem`
6. Check gem on [rubygems](https://rubygems.org/gems/application_insights)
7. Tag code:
    ```
    git tag -a v0.5.5
    git push origin v0.5.5
    ```
8. Update description of [release](https://github.com/Microsoft/ApplicationInsights-Ruby/releases/edit/v0.5.5) from [CHANGELOG.md](https://github.com/Microsoft/ApplicationInsights-Ruby/blob/master/CHANGELOG.md)
9. Create a branch off `develop` branch
    ```
    git checkout develop
    git pull
    git checkout -b releaseUpdates
    git push --set-upstream origin releaseUpdates
    ```
10. Update version in `/lib/application_insights/version.rb`
11. Create new entry for the next release in `/CHANGELOG.md`
12. Push changes
    ```
    git add -A
    git commit -m "post release updates"
    git push
    ```
13. Submit releaseUpdates->develop PR: https://github.com/Microsoft/ApplicationInsights-Ruby/compare/develop...releaseUpdates?expand=1

## Contributing

This project welcomes contributions and suggestions. Most contributions require you to
agree to a Contributor License Agreement (CLA) declaring that you have the right to,
and actually do, grant us the rights to use your contribution. For details, visit
https://cla.microsoft.com.

When you submit a pull request, a CLA-bot will automatically determine whether you need
to provide a CLA and decorate the PR appropriately (e.g., label, comment). Simply follow the
instructions provided by the bot. You will only need to do this once across all repositories using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/)
or contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.