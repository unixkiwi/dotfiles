// Erlaubt dem Add-on im privaten Modus zu arbeiten
browser.runtime.onInstalled.addListener(() => {
    browser.runtime.openOptionsPage();
});