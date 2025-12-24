(() => {
  const SELECTORS = {
    branchLabel: '#status\\.scm\\.0 .statusbar-item-label',
    tabLabel: '.single-tab .label-description',
    positionLabel: '#status\\.editor\\.selection .statusbar-item-label',
    activeLine: '.line-numbers.active-line-number',
  }

  const SEPARATOR = ' | '
  const ORIGINAL_NAME_ATTR = 'data-original-name'

  function updateTabWithBranch() {
    const branchLabel = document.querySelector(SELECTORS.branchLabel)
    const tab = document.querySelector(SELECTORS.tabLabel)

    if (!branchLabel || !tab) return

    const branch = branchLabel.textContent.trim()
    if (!branch) return

    // Save original name once
    if (!tab.hasAttribute(ORIGINAL_NAME_ATTR)) {
      tab.setAttribute(ORIGINAL_NAME_ATTR, tab.textContent)
    }

    const originalName = tab.getAttribute(ORIGINAL_NAME_ATTR)
    const nextText = `${originalName}${SEPARATOR}${branch}`

    if (tab.textContent !== nextText) {
      tab.textContent = nextText
    }
  }

  function updateColumnPosition() {
    const positionLabel = document.querySelector(SELECTORS.positionLabel)
    const activeLine = document.querySelector(SELECTORS.activeLine)

    if (!positionLabel || !activeLine) return

    const match = positionLabel.textContent.match(/Col (\d+)/)
    if (!match) return

    const col = match[1]
    if (activeLine.textContent !== col) {
      activeLine.textContent = col
    }
  }

  function observeUI() {
    const observer = new MutationObserver(() => {
      updateTabWithBranch()
      updateColumnPosition()
    })

    observer.observe(document.body, {
      childList: true,
      subtree: true,
      characterData: true,
    })
  }

  updateTabWithBranch()
  updateColumnPosition()
  observeUI()
})()
