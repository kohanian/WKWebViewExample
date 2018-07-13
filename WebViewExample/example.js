function onButtonClicked(btn) {
    window.webkit.messageHandlers.handler1.postMessage(btn.value)
}
