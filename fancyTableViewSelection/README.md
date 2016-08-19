# Fancy Table View Selection

![animation](/fancyTableViewSelection/_screenshots/TVCfancySelection.gif?raw=true)

Sometimes, you want a tableview that do it all:

* Tap to navigate
* multi-select (maybe to group items, share with someone, pay all at once, or something else)
* Delete

You could build this ad-hoc by using `accessoryView` with checkmarks and so on, but if you want to use platform standard delete and multi-select controls, this can be a little tricky.

Mostly this is tricky, I think, because of the way selection and editing apis for UITableView interact.

This project glues them all together in a way that is isolated and hopefully quite clear.

It uses the standard `tableView.tableView.indexPathsForSelectedRows` for the ui state and does deletion and selection with existing, platform standard controls.

||||
| --- | --- | --- |
|![navigate](/fancyTableViewSelection/_screenshots/1.png?raw=true)|![select](/fancyTableViewSelection/_screenshots/2.png?raw=true)|![delete](/fancyTableViewSelection/_screenshots/3.png?raw=true)|
