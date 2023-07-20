# et-inventory with decay system and lj-inventory look

For issues and enhancements you can send a PR or contact me from my Discord channel!
<br>
[Team Hi-Dev](https://discord.com/invite/pSJPPctrNx)
<br>

Runs at ~ 0.00 to 0.01 ms if you have more optimization suggestions feel free to reach out

<br>
Inventory is up to date with the latest et-inventory fixes and dupe

# Dependencies
* [qbcore framework](https://github.com/qbcore-framework)
* [et-target](https://github.com/BerkieBb/et-target)
* [et-core](https://github.com/qbcore-framework/et-core)


# How to install
* Download source files from github
* Drag source files into your resources folder
* Rename folder to `et-inventory`

![image](https://user-images.githubusercontent.com/80186604/163069477-114e14ec-bec1-4f93-8421-42017c605f15.png)

# TO DO
you need to add a decay and created value in your et-core/shared/items for all items, the decay is set to be the days the item lasts
<br>

```lua
-- created = this will get filled in with the time when it's created, just leave this
-- decay = amount of days that an item will decay
-- delete = choice whether to remove the item when it's decayed or not
["created"] = nil, ["decay"] = 28.0, ["delete"] = true
```
<br>
Example:
<br>

```lua
['sandwich'] = {['name'] = 'sandwich', ['label'] = 'Sandwich', ['weight'] = 200, ['type'] = 'item', ['image'] = 'sandwich.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true,	['combinable'] = nil, ['description'] = 'Nice bread for your stomach', ["created"] = nil, ["decay"] = 3.0, ["delete"] = true},
```
In this example our sandwich will decay in 3 days and removed when used.
<br>

# Previews
![full inventory](https://user-images.githubusercontent.com/91661118/146315750-1199a37e-88e0-4d48-86d3-ae0b85df6a72.png)

<br>

# Credits
* [et-inventory](https://github.com/qbcore-framework/et-inventory)
* [et-inventory-withdecay](https://github.com/HarithMichael/et-inventory-withdecay)

<br>

# Issues and Suggestions
Please use the GitHub issues system to report issues or make suggestions, when making suggestion, please keep [Suggestion] in the title to make it clear that it is a suggestion.
