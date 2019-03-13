/**
This script automates the opening of a preset of tabs in chrome. This will only work
on MacOS by running this script in the AppleScript editor.
We can also execute JS in the browser through JXA.

Based on https://medium.com/@SteveBarbera/automating-chrome-with-jxa-javascript-application-scripting-6f9bc433216a
 */

const chrome = Application('Google Chrome');

const window = chrome.Window().make();

const startupLinks = [
    'https://workflowy.com/',
    'https://yoobic.atlassian.net/jira/software/projects/OD/boards/23',
    'https://github.com/Yoobic/yoobic-ng-6',
    'https://yoobic.atlassian.net/wiki/discover/all-updates',
    'https://app.bitrise.io/dashboard'
]; 

for (let i = 0; i < startupLinks.length; i++) {
    if (startupLinks[i + 1] !== undefined) {
        window.tabs.push(new chrome.Tab());
    }
    window.tabs[i].url = startupLinks[i];
}