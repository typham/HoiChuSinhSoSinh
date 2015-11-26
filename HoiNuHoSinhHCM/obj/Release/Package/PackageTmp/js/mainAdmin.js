function BrowseServer(startupPath, functionData) {
    // You can use the "CKFinder" class to render CKFinder in a page:
    var finder = new CKFinder();
    finder.selectActionFunction = SetFileField;
    // Name of a function which is called when a file is selected in CKFinder.
    finder.selectActionFunction = SetFileField;
    // Launch CKFinder
    finder.popup();
}
