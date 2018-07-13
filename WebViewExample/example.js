function onButtonClicked(btn) {
    window.webkit.messageHandlers.interop.postMessage(btn.value)
}
